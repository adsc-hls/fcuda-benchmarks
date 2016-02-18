#include <fcuda.h>
#include "srad.h"
#include <string.h>


#pragma FCUDA GRID x_dim=16 y_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=E_C port_id=0
#pragma FCUDA PORTMERGE remove_port_name=W_C port_id=0
#pragma FCUDA PORTMERGE remove_port_name=N_C port_id=0
#pragma FCUDA PORTMERGE remove_port_name=S_C port_id=0
#pragma FCUDA PORTMERGE remove_port_name=J_cuda port_id=0
#pragma FCUDA PORTMERGE remove_port_name=C_cuda port_id=0
__global__ void
srad_cuda_1(double *E_C,
	double *W_C,
	double *N_C,
	double *S_C,
	double * J_cuda,
	double * C_cuda,
	int cols,
	int rows,
	double q0sqr
)
{

  //block id
  int bx = blockIdx.x;
  int by = blockIdx.y;

  //thread id
  int tx = threadIdx.x;
  int ty = threadIdx.y;

  //indices
  //int index   = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + tx;
  int index   = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx;

  //int index_n = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + tx - cols;
  int index_n = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx - cols;

  //int index_s = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * BLOCK_SIZE + tx;
  int index_s = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * BLOCK_SIZE;

  //int index_w = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty - 1;
  //int index_w = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx - 1;

  //int index_e = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + BLOCK_SIZE;
  //int index_e = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + BLOCK_SIZE;

  double n, w, e, s, jc, g2, l, num, den, qsqr, c;

  //shared memory allocation
  __shared__ double temp[BLOCK_SIZE][BLOCK_SIZE];
  __shared__ double temp_result[BLOCK_SIZE][BLOCK_SIZE];

  __shared__ double north[BLOCK_SIZE][BLOCK_SIZE];
  __shared__ double south[BLOCK_SIZE][BLOCK_SIZE];
  __shared__ double east[BLOCK_SIZE][BLOCK_SIZE];
  __shared__ double west[BLOCK_SIZE][BLOCK_SIZE];

  //load data to shared memory

  if ( by == 0 ){
#pragma FCUDA TRANSFER begin name=fetch_n type=burst dir=[0|0] pointer=[J_cuda|J_cuda] size=[16|16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]
  	north[ty][tx] = J_cuda[BLOCK_SIZE * bx + tx];
  	south[ty][tx] = J_cuda[index_s + tx];
#pragma FCUDA TRANSFER end name=fetch_n type=burst dir=[0|0] pointer=[J_cuda|J_cuda] size=[16|16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]
  }
  else if ( by == gridDim.y - 1 ){
#pragma FCUDA TRANSFER begin name=fetch_s type=burst dir=[0|0] pointer=[J_cuda|J_cuda] size=[16|16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]
  	south[ty][tx] = J_cuda[cols * BLOCK_SIZE * (gridDim.y - 1) + BLOCK_SIZE * bx + cols * ( BLOCK_SIZE - 1 ) + tx];
  	north[ty][tx] = J_cuda[index_n + tx];
#pragma FCUDA TRANSFER end name=fetch_s type=burst dir=[0|0] pointer=[J_cuda|J_cuda] size=[16|16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]
  } else {
#pragma FCUDA TRANSFER begin name=fetch_n_s type=burst dir=[0|0] pointer=[J_cuda|J_cuda] size=[16|16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]
  	north[ty][tx] = J_cuda[index_n + tx];
  	south[ty][tx] = J_cuda[index_s + tx];
#pragma FCUDA TRANSFER end name=fetch_n_s type=burst dir=[0|0] pointer=[J_cuda|J_cuda] size=[16|16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]
  }
   __syncthreads();

#pragma FCUDA COMPUTE begin name=compute_w_s cores=[1] unroll=1 mpart=1 array_split=[temp_result]
  int index_w = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty - 1;
  int index_e = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + BLOCK_SIZE;

  if ( bx == 0 ){
  	west[ty][tx] = J_cuda[cols * BLOCK_SIZE * by + cols * ty];
	east[ty][tx] = J_cuda[index_e];
  }
  else if ( bx == gridDim.x - 1 ){
  	east[ty][tx] = J_cuda[cols * BLOCK_SIZE * by + BLOCK_SIZE * ( gridDim.x - 1) + cols * ty + BLOCK_SIZE-1];
	west[ty][tx] = J_cuda[index_w];
  }
  else {
	west[ty][tx] = J_cuda[index_w];
  	east[ty][tx] = J_cuda[index_e];
  }
#pragma FCUDA COMPUTE end name=compute_w_s cores=[1] unroll=1 mpart=1 array_split=[temp_result]
  __syncthreads();

#pragma FCUDA TRANSFER begin name=fetch_temp type=burst dir=[0] pointer=[J_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]
  temp[ty][tx] = J_cuda[index + cols * ty + tx];
#pragma FCUDA TRANSFER end name=fetch_temp type=burst dir=[0] pointer=[J_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]

  __syncthreads();

#pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[temp_result]
   jc = temp[ty][tx];

   if ( ty == 0 && tx == 0 ){ //nw
	n  = north[ty][tx] - jc;
    	s  = temp[ty+1][tx] - jc;
    	w  = west[ty][tx]  - jc;
    	e  = temp[ty][tx+1] - jc;
   }
   else if ( ty == 0 && tx == BLOCK_SIZE-1 ){ //ne
	n  = north[ty][tx] - jc;
    	s  = temp[ty+1][tx] - jc;
    	w  = temp[ty][tx-1] - jc;
    	e  = east[ty][tx] - jc;
   }
   else if ( ty == BLOCK_SIZE -1 && tx == BLOCK_SIZE - 1){ //se
	n  = temp[ty-1][tx] - jc;
    	s  = south[ty][tx] - jc;
    	w  = temp[ty][tx-1] - jc;
    	e  = east[ty][tx]  - jc;
   }
   else if ( ty == BLOCK_SIZE -1 && tx == 0 ){//sw
	n  = temp[ty-1][tx] - jc;
    	s  = south[ty][tx] - jc;
    	w  = west[ty][tx]  - jc;
    	e  = temp[ty][tx+1] - jc;
   }

   else if ( ty == 0 ){ //n
	n  = north[ty][tx] - jc;
    	s  = temp[ty+1][tx] - jc;
    	w  = temp[ty][tx-1] - jc;
    	e  = temp[ty][tx+1] - jc;
   }
   else if ( tx == BLOCK_SIZE -1 ){ //e
	n  = temp[ty-1][tx] - jc;
    	s  = temp[ty+1][tx] - jc;
    	w  = temp[ty][tx-1] - jc;
    	e  = east[ty][tx] - jc;
   }
   else if ( ty == BLOCK_SIZE -1){ //s
	n  = temp[ty-1][tx] - jc;
    	s  = south[ty][tx] - jc;
    	w  = temp[ty][tx-1] - jc;
    	e  = temp[ty][tx+1] - jc;
   }
   else if ( tx == 0 ){ //w
	n  = temp[ty-1][tx] - jc;
    	s  = temp[ty+1][tx] - jc;
    	w  = west[ty][tx] - jc;
    	e  = temp[ty][tx+1] - jc;
   }
   else{  //the data elements which are not on the borders
	n  = temp[ty-1][tx] - jc;
    	s  = temp[ty+1][tx] - jc;
    	w  = temp[ty][tx-1] - jc;
    	e  = temp[ty][tx+1] - jc;
   }


    g2 = ( n * n + s * s + w * w + e * e ) / (jc * jc);

    l = ( n + s + w + e ) / jc;

	num  = (0.5*g2) - ((1.0/16.0)*(l*l)) ;
	den  = 1 + (.25*l);
	qsqr = num/(den*den);

	// diffusion coefficent (equ 33)
	den = (qsqr-q0sqr) / (q0sqr * (1+q0sqr)) ;
	c = 1.0 / (1.0+den) ;

    // saturate diffusion coefficent
	if (c < 0){temp_result[ty][tx] = 0;}
	else if (c > 1) {temp_result[ty][tx] = 1;}
	else {temp_result[ty][tx] = c;}

    __syncthreads();

    E_C[index + cols * ty + tx] = e;
    W_C[index + cols * ty + tx] = w;
    S_C[index + cols * ty + tx] = s;
    N_C[index + cols * ty + tx] = n;
#pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[temp_result]

#pragma FCUDA TRANSFER begin name=write type=burst dir=[1] pointer=[C_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]
    C_cuda[index + cols * ty + tx] = temp_result[ty][tx];
#pragma FCUDA TRANSFER end name=write type=burst dir=[1] pointer=[C_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[temp_result]

	//E_C[index] = e;
	//W_C[index] = w;
	//S_C[index] = s;
	//N_C[index] = n;
}


#pragma FCUDA GRID x_dim=16 y_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=E_C port_id=0
#pragma FCUDA PORTMERGE remove_port_name=W_C port_id=0
#pragma FCUDA PORTMERGE remove_port_name=N_C port_id=0
#pragma FCUDA PORTMERGE remove_port_name=S_C port_id=0
#pragma FCUDA PORTMERGE remove_port_name=J_cuda port_id=0
#pragma FCUDA PORTMERGE remove_port_name=C_cuda port_id=0
__global__ void
srad_cuda_2(double *E_C,
	double *W_C,
	double *N_C,
	double *S_C,
	double * J_cuda,
	double * C_cuda,
	int cols,
	int rows,
	double lambda,
	double q0sqr
) {
    	//block id
    	int bx = blockIdx.x;
    	int by = blockIdx.y;

	//thread id
    	int tx = threadIdx.x;
    	int ty = threadIdx.y;

	//indices
    	//int index   = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + tx;
	int index   = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx;

    	//int index_s = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * BLOCK_SIZE + tx;
	int index_s = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * BLOCK_SIZE;

    	//int index_e = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + BLOCK_SIZE;
	double cc, cn, cs, ce, cw, d_sum;

	//shared memory allocation
	__shared__ double south_c[BLOCK_SIZE][BLOCK_SIZE];
    	__shared__ double east_c[BLOCK_SIZE][BLOCK_SIZE];

    	__shared__ double c_cuda_temp[BLOCK_SIZE][BLOCK_SIZE];
    	__shared__ double c_cuda_result[BLOCK_SIZE][BLOCK_SIZE];
    	__shared__ double temp[BLOCK_SIZE][BLOCK_SIZE];

    	//load data to shared memory
#pragma FCUDA TRANSFER begin name=fetch_temp type=burst dir=[0] pointer=[J_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
	temp[ty][tx]      = J_cuda[index + cols * ty + tx];
#pragma FCUDA TRANSFER end name=fetch_temp type=burst dir=[0] pointer=[J_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]

    	__syncthreads();

	if ( by == gridDim.y - 1 ){
#pragma FCUDA TRANSFER begin name=fetch_south_c_2 type=burst dir=[0] pointer=[C_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
		south_c[ty][tx] = C_cuda[cols * BLOCK_SIZE * (gridDim.y - 1) + BLOCK_SIZE * bx + cols * ( BLOCK_SIZE - 1 ) + tx];
#pragma FCUDA TRANSFER end name=fetch_south_c_2 type=burst dir=[0] pointer=[C_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
	} else {
#pragma FCUDA TRANSFER begin name=fetch_south_c_1 type=burst dir=[0] pointer=[C_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
		south_c[ty][tx] = C_cuda[index_s + tx];
#pragma FCUDA TRANSFER end name=fetch_south_c_1 type=burst dir=[0] pointer=[C_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
	}
	__syncthreads();

#pragma FCUDA COMPUTE begin name=compute1 cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
	int index_e = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + BLOCK_SIZE;
	
	if ( bx == gridDim.x - 1 ){
		east_c[ty][tx] = C_cuda[cols * BLOCK_SIZE * by + BLOCK_SIZE * ( gridDim.x - 1) + cols * ty + BLOCK_SIZE-1];
	} else {
		east_c[ty][tx] = C_cuda[index_e];
	}
#pragma FCUDA COMPUTE end name=compute1 cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
    	__syncthreads();

#pragma FCUDA TRANSFER begin name=fetch_c_cuda_temp type=burst dir=[0] pointer=[C_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
    	c_cuda_temp[ty][tx] = C_cuda[index + cols * ty + tx];
#pragma FCUDA TRANSFER end name=fetch_c_cuda_temp type=burst dir=[0] pointer=[C_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
    	__syncthreads();

#pragma FCUDA COMPUTE begin name=compute2 cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
	cc = c_cuda_temp[ty][tx];

   	if ( ty == BLOCK_SIZE -1 && tx == BLOCK_SIZE - 1){ //se
		cn  = cc;
    		cs  = south_c[ty][tx];
    		cw  = cc;
    		ce  = east_c[ty][tx];
   	}
   	else if ( tx == BLOCK_SIZE -1 ){ //e
		cn  = cc;
    		cs  = c_cuda_temp[ty+1][tx];
    		cw  = cc;
    		ce  = east_c[ty][tx];
   	}
   	else if ( ty == BLOCK_SIZE -1){ //s
		cn  = cc;
    		cs  = south_c[ty][tx];
    		cw  = cc;
    		ce  = c_cuda_temp[ty][tx+1];
   	}
   	else{ //the data elements which are not on the borders
		cn  = cc;
    		cs  = c_cuda_temp[ty+1][tx];
    		cw  = cc;
    		ce  = c_cuda_temp[ty][tx+1];
   	}
	__syncthreads();
   	// divergence (equ 58)
   	d_sum = cn * N_C[index + cols * ty + tx] + cs * S_C[index + cols * ty + tx] + cw * W_C[index + cols * ty + tx] + ce * E_C[index + cols * ty + tx];

   	// image update (equ 61)
   	c_cuda_result[ty][tx] = temp[ty][tx] + 0.25 * lambda * d_sum;
#pragma FCUDA COMPUTE end name=compute2 cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
   	__syncthreads();

#pragma FCUDA TRANSFER begin name=write type=burst dir=[1] pointer=[J_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]
   	J_cuda[index + cols * ty + tx] = c_cuda_result[ty][tx];
#pragma FCUDA TRANSFER end name=write type=burst dir=[1] pointer=[J_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[c_cuda_result]

}

