#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>

#define SDATA( index) CUT_BANK_CHECKER(sdata, index)

/*
   __device__ int
   int maximum(int a, int b, int c) {

   int k;
   if( a <= b )
   k = b;
   else
   k = a;

   if (k <=c )
   return(c);
   else
   return(k);
   }
 */

#pragma FCUDA GRID x_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=referrence port_id=0
#pragma FCUDA PORTMERGE remove_port_name=matrix_cuda port_id=0
__global__ void
needle_cuda_shared_1(  int* referrence,
    int* matrix_cuda,
    //int* matrix_cuda_out,
    int cols,
    int penalty,
    int i,
    int block_width)
{
  int bx = blockIdx.x;
  int tx = threadIdx.x;

  int b_index_x = bx;
  int b_index_y = i - 1 - bx;

  //int index   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + tx + ( cols + 1 );
  int index   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + ( cols + 1 );
  //int index_n   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + tx + ( 1 );
  int index_n   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + ( 1 );
  int index_w   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + ( cols );
  int index_nw =  cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x;

  __shared__  int temp[BLOCK_SIZE+1][BLOCK_SIZE+1];
  __shared__  int ref[BLOCK_SIZE][BLOCK_SIZE];

#pragma FCUDA COMPUTE begin name=init_temp cores=[1]
  if (tx == 0)
    temp[tx][0] = matrix_cuda[index_nw];
#pragma FCUDA COMPUTE end name=init_temp cores=[1]

  int ty;
  //#pragma FCUDA COMPUTE begin name=fetch_ref cores=[1] unroll=1 mpart=1 array_split=[]
  for (ty = 0 ; ty < BLOCK_SIZE; ty++) {
#pragma FCUDA TRANSFER begin name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    ref[ty][tx] = referrence[index + tx + cols * ty];
#pragma FCUDA TRANSFER end name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
  }
  //#pragma FCUDA COMPUTE end name=fetch_ref cores=[1] unroll=1 mpart=1 array_split=[]

  __syncthreads();

#pragma FCUDA COMPUTE begin name=init_temp2 cores=[1]
  temp[tx + 1][0] = matrix_cuda[index_w + cols * tx];
#pragma FCUDA COMPUTE end name=init_temp2 cores=[1]

  __syncthreads();

#pragma FCUDA TRANSFER begin name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] array_split=[]

  temp[0][tx + 1] = matrix_cuda[index_n + tx];
#pragma FCUDA TRANSFER end name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] array_split=[]
  __syncthreads();

#pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[]
  int m;
  for (m = 0 ; m < BLOCK_SIZE ; m++) {

    if (tx <= m) {

      int t_index_x =  tx + 1;
      int t_index_y =  m - tx + 1;

      temp[t_index_y][t_index_x] = maximum(temp[t_index_y-1][t_index_x-1] + ref[t_index_y-1][t_index_x-1],
          temp[t_index_y][t_index_x-1]  - penalty,
          temp[t_index_y-1][t_index_x]  - penalty);
    }
    __syncthreads();
  }

  for (m = BLOCK_SIZE - 2 ; m >=0 ; m--) {

    if (tx <= m) {

      int t_index_x =  tx + BLOCK_SIZE - m ;
      int t_index_y =  BLOCK_SIZE - tx;

      temp[t_index_y][t_index_x] = maximum(temp[t_index_y-1][t_index_x-1] + ref[t_index_y-1][t_index_x-1],
          temp[t_index_y][t_index_x-1]  - penalty,
          temp[t_index_y-1][t_index_x]  - penalty);
    }

    __syncthreads();
  }
#pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[]

  for (ty = 0 ; ty < BLOCK_SIZE ; ty++) {
#pragma FCUDA TRANSFER begin name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

    matrix_cuda[index + tx + ty * cols] = temp[ty+1][tx+1];
#pragma FCUDA TRANSFER end name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
  }
}


#pragma FCUDA GRID x_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=referrence port_id=0
#pragma FCUDA PORTMERGE remove_port_name=matrix_cuda port_id=0
__global__ void
needle_cuda_shared_2(  int* referrence,
    int* matrix_cuda,
    //int* matrix_cuda_out,

    int cols,
    int penalty,
    int i,
    int block_width)
{
  int bx = blockIdx.x;
  int tx = threadIdx.x;

  int b_index_x = bx + block_width - i  ;
  int b_index_y = block_width - bx -1;

  //int index   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + tx + ( cols + 1 );
  int index   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + ( cols + 1 );
  //int index_n   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + tx + ( 1 );
  int index_n   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + ( 1 );
  int index_w   = cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x + ( cols );
  int index_nw =  cols * BLOCK_SIZE * b_index_y + BLOCK_SIZE * b_index_x;

  __shared__  int temp[BLOCK_SIZE+1][BLOCK_SIZE+1];
  __shared__  int ref[BLOCK_SIZE][BLOCK_SIZE];
  int ty;
  for (ty = 0 ; ty < BLOCK_SIZE ; ty++) {
#pragma FCUDA TRANSFER begin name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    ref[ty][tx] = referrence[index + cols * ty + tx];
#pragma FCUDA TRANSFER end name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
  }
  __syncthreads();

#pragma FCUDA COMPUTE begin name=init_temp cores=[1]
  if (tx == 0)
    temp[tx][0] = matrix_cuda[index_nw];
#pragma FCUDA COMPUTE end name=init_temp cores=[1]

#pragma FCUDA COMPUTE begin name=init_temp2 cores=[1]
  temp[tx + 1][0] = matrix_cuda[index_w + cols * tx];
#pragma FCUDA COMPUTE end name=init_temp2 cores=[1]

  __syncthreads();

#pragma FCUDA TRANSFER begin name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
  temp[0][tx + 1] = matrix_cuda[index_n + tx];
#pragma FCUDA TRANSFER end name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
  __syncthreads();

#pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[]
  int m;
  for (m = 0 ; m < BLOCK_SIZE ; m++) {

    if (tx <= m) {

      int t_index_x =  tx + 1;
      int t_index_y =  m - tx + 1;

      temp[t_index_y][t_index_x] = maximum(temp[t_index_y-1][t_index_x-1] + ref[t_index_y-1][t_index_x-1],
          temp[t_index_y][t_index_x-1]  - penalty,
          temp[t_index_y-1][t_index_x]  - penalty);

    }
    __syncthreads();
  }


  for(m = BLOCK_SIZE - 2 ; m >=0 ; m--){

    if (tx <= m) {

      int t_index_x =  tx + BLOCK_SIZE - m ;
      int t_index_y =  BLOCK_SIZE - tx;

      temp[t_index_y][t_index_x] = maximum(temp[t_index_y-1][t_index_x-1] + ref[t_index_y-1][t_index_x-1],
          temp[t_index_y][t_index_x-1]  - penalty,
          temp[t_index_y-1][t_index_x]  - penalty);


    }

    __syncthreads();
  }
#pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[]

  for (ty = 0 ; ty < BLOCK_SIZE ; ty++) {
#pragma FCUDA TRANSFER begin name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    matrix_cuda[index + tx + ty * cols] = temp[ty+1][tx+1];
#pragma FCUDA TRANSFER end name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
  }
}

