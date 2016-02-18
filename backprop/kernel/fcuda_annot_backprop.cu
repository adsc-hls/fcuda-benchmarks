#include <fcuda.h>
#include "backprop.h"
#include <math.h>
#include <string.h>

int custom_pow_base2(int i) {
  int k;
  int result = 1;
  for (k = 0; k < i; k++)
    result = result * 2;
  return result;
}

#pragma FCUDA GRID x_dim=16 y_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=input_cuda port_id=0 offset=0
#pragma FCUDA PORTMERGE remove_port_name=input_hidden_cuda port_id=0
#pragma FCUDA PORTMERGE remove_port_name=hidden_partial_sum port_id=0
  __global__ void
bpnn_layerforward_CUDA(float *input_cuda,
    float *input_hidden_cuda,
    float *hidden_partial_sum,
    int in,
    int hid)
{
  int by = blockIdx.y;
  int tx = threadIdx.x;
  int ty = threadIdx.y;

  //int index =  ( hid + 1 ) * HEIGHT * by + ( hid + 1 ) * ty + tx + 1 + ( hid + 1 ) ;
  int index =  ( hid + 1 ) * HEIGHT * by + 1 + ( hid + 1 ) ;

  //int index_in = HEIGHT * by + ty + 1;

  __shared__ float input_node[HEIGHT];
  __shared__ float weight_matrix[HEIGHT][WIDTH];
  __shared__ float weight_matrix1[HEIGHT][WIDTH];
  __shared__ float weight_matrix2[HEIGHT][WIDTH];

#pragma FCUDA COMPUTE begin name=compute_input_node cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]
  int index_in = HEIGHT * by + ty + 1;
  if ( tx == 0 )
    input_node[ty] = input_cuda[index_in] ;
#pragma FCUDA COMPUTE end name=compute_input_node cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]

  //__syncthreads();

#pragma FCUDA TRANSFER begin name=fetch_weight_matrix type=burst dir=[0] pointer=[input_hidden_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]
  weight_matrix[ty][tx] = input_hidden_cuda[index + (hid + 1) * ty + tx];
#pragma FCUDA TRANSFER end name=fetch_weight_matrix type=burst dir=[0] pointer=[input_hidden_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]
  __syncthreads();

#pragma FCUDA COMPUTE begin name=compute_weight_matrix1 cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]
  weight_matrix1[ty][tx] = weight_matrix[ty][tx] * input_node[ty];
  //#pragma FCUDA COMPUTE end name=compute_weight_matrix1 cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]

  __syncthreads();
  int i,j;

  for ( i = 1 ; i <= log(HEIGHT) ; i++)
  {
    //int power_two = powf(2, i);
    int power_two = custom_pow_base2(i);
    if( ty % power_two == 0 )
      weight_matrix1[ty][tx] = weight_matrix1[ty][tx] + weight_matrix1[ty + power_two/2][tx];
    __syncthreads();
  }

  weight_matrix2[ty][tx] = weight_matrix1[ty][tx];
  __syncthreads();

#pragma FCUDA COMPUTE end name=compute_weight_matrix1 cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]



#pragma FCUDA TRANSFER begin name=write_weight_matrix type=burst dir=[1] pointer=[input_hidden_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]
  input_hidden_cuda[index + (hid + 1) * ty + tx] = weight_matrix2[ty][tx];
#pragma FCUDA TRANSFER end name=write_weight_matrix type=burst dir=[1] pointer=[input_hidden_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]

  /*
     for ( unsigned int i = 2 ; i <= HEIGHT ; i *= 2){

     unsigned int power_two = i - 1;

     if( (ty & power_two) == 0 ) {
     weight_matrix[ty][tx] = weight_matrix[ty][tx] + weight_matrix[ty + power_two/2][tx];
     }

     }
   */

  __syncthreads();

#pragma FCUDA COMPUTE begin name=compute_hps cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]
  if ( tx == 0 ) {
    hidden_partial_sum[by * hid + ty] = weight_matrix1[tx][ty];
  }
#pragma FCUDA COMPUTE end name=compute_hps cores=[1] unroll=1 mpart=1 array_split=[input_node|weight_matrix]

}

#pragma FCUDA GRID x_dim=16 y_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=delta port_id=0 offset=0
#pragma FCUDA PORTMERGE remove_port_name=ly port_id=0
#pragma FCUDA PORTMERGE remove_port_name=w port_id=0
#pragma FCUDA PORTMERGE remove_port_name=oldw port_id=0
__global__ void bpnn_adjust_weights_cuda(float * delta,
    int hid,
    float * ly,
    int in,
    float * w,
    float * oldw)
{
#pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1
  int by = blockIdx.y;

  int tx = threadIdx.x;
  int ty = threadIdx.y;

  int index =  ( hid + 1 ) * HEIGHT * by + ( hid + 1 ) * ty + tx + 1 + ( hid + 1 ) ;
  int index_y = HEIGHT * by + ty + 1;
  int index_x = tx + 1;
  //eta = 0.3;
  //momentum = 0.3;

  w[index] += ((ETA * delta[index_x] * ly[index_y]) + (MOMENTUM * oldw[index]));
  oldw[index] = ((ETA * delta[index_x] * ly[index_y]) + (MOMENTUM * oldw[index]));


  __syncthreads();

  if (ty == 0 && by ==0){
    w[index_x] += ((ETA * delta[index_x]) + (MOMENTUM * oldw[index_x]));
    oldw[index_x] = ((ETA * delta[index_x]) + (MOMENTUM * oldw[index_x]));
  }
#pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1
}
