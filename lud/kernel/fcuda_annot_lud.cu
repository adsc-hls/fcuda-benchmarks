#include <fcuda.h>
#include "lud.h"
#pragma FCUDA GRID x_dim=16
#pragma FCUDA COREINFO num_cores=4 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=m port_id=0
  __global__ void
lud_diagonal(double *m, int matrix_dim, int offset)
{
  int i, j, array_offset;
  __shared__ double shadow[BLOCK_SIZE][BLOCK_SIZE];
  array_offset = offset*matrix_dim+offset;
  for(i=0; i < BLOCK_SIZE; i++){
#pragma FCUDA TRANSFER begin name=fetch type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    shadow[i][threadIdx.x]=m[array_offset+threadIdx.x];
#pragma FCUDA TRANSFER end name=fetch type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    array_offset += matrix_dim;
  }
  __syncthreads();

#pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[]
  for(i=0; i < BLOCK_SIZE-1; i++) {

    if (threadIdx.x>i){
      for(j=0; j < i; j++)
        shadow[threadIdx.x][i] -= shadow[threadIdx.x][j]*shadow[j][i];
      shadow[threadIdx.x][i] /= shadow[i][i];
    }

    __syncthreads();
    if (threadIdx.x>i){

      for(j=0; j < i+1; j++)
        shadow[i+1][threadIdx.x] -= shadow[i+1][j]*shadow[j][threadIdx.x];
    }
    __syncthreads();
  }

  /*
     The first row is not modified, it
     is no need to write it back to the
     global memory

   */
#pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[]

  array_offset = (offset+1)*matrix_dim+offset;
  for(i=1; i < BLOCK_SIZE; i++){
#pragma FCUDA TRANSFER begin name=write type=burst dir=[1] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    m[array_offset+threadIdx.x]=shadow[i][threadIdx.x];
#pragma FCUDA TRANSFER end name=write type=burst dir=[1] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    array_offset += matrix_dim;
  }
}

#pragma FCUDA GRID x_dim=32
#pragma FCUDA COREINFO num_cores=2 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=m port_id=0
  __global__ void
lud_perimeter(double *m, int matrix_dim, int offset)
{
  __shared__ double dia[BLOCK_SIZE1][BLOCK_SIZE1];
  __shared__ double peri_row[BLOCK_SIZE1][BLOCK_SIZE1];
  __shared__ double peri_col[BLOCK_SIZE1][BLOCK_SIZE1];

  int i,j, array_offset;
  int idx, idx1;

  //if (threadIdx.x < BLOCK_SIZE) {
  idx = threadIdx.x;

  array_offset = offset*matrix_dim+offset;
  for (i=0; i < BLOCK_SIZE/2; i++){
#pragma FCUDA TRANSFER begin name=fetch1 type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    dia[i][idx]=m[array_offset+idx];
#pragma FCUDA TRANSFER end name=fetch1 type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    array_offset += matrix_dim;
  }

  array_offset = offset*matrix_dim+offset;
  for (i=0; i < BLOCK_SIZE; i++) {
#pragma FCUDA TRANSFER begin name=fetch2 type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    peri_row[i][idx]=m[array_offset+(blockIdx.x+1)*BLOCK_SIZE+idx];
#pragma FCUDA TRANSFER end name=fetch2 type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    array_offset += matrix_dim;
  }

  //} else {
  //idx = threadIdx.x-BLOCK_SIZE;

  array_offset = (offset+BLOCK_SIZE/2)*matrix_dim+offset;
  for (i=BLOCK_SIZE/2; i < BLOCK_SIZE; i++){
#pragma FCUDA TRANSFER begin name=fetch3 type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    dia[i][idx]=m[array_offset+idx];
#pragma FCUDA TRANSFER end name=fetch3 type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    array_offset += matrix_dim;
  }

  array_offset = (offset+(blockIdx.x+1)*BLOCK_SIZE)*matrix_dim+offset;
  for (i=0; i < BLOCK_SIZE; i++) {
#pragma FCUDA TRANSFER begin name=fetch4 type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    peri_col[i][idx] = m[array_offset+idx];
#pragma FCUDA TRANSFER end name=fetch4 type=burst dir=[0] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    array_offset += matrix_dim;
  }

  //}
  __syncthreads();

  /* this version works ok on hardware, but not gpgpusim
   **************************************************************
   if (threadIdx.x < BLOCK_SIZE) { //peri-row
   idx=threadIdx.x;
   for(i=1; i < BLOCK_SIZE; i++){
   for (j=0; j < i; j++)
   peri_row[i][idx]-=dia[i][j]*peri_row[j][idx];
   }


   array_offset = (offset+1)*matrix_dim+offset;
   for(i=1; i < BLOCK_SIZE; i++){
   m[array_offset+(blockIdx.x+1)*BLOCK_SIZE+idx] = peri_row[i][idx];
   array_offset += matrix_dim;
   }
   } else { //peri-col
   idx=threadIdx.x - BLOCK_SIZE;
   for(i=0; i < BLOCK_SIZE; i++){
   for(j=0; j < i; j++)
   peri_col[idx][i]-=peri_col[idx][j]*dia[j][i];
   peri_col[idx][i] /= dia[i][i];
   }

   __syncthreads();

   array_offset = (offset+(blockIdx.x+1)*BLOCK_SIZE)*matrix_dim+offset;
   for(i=0; i < BLOCK_SIZE; i++){
   m[array_offset+idx] =  peri_col[i][idx];
   array_offset += matrix_dim;
   }
   }
   ***************************************************************/
#pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[]
  if (threadIdx.x < BLOCK_SIZE) { //peri-row
    idx1=threadIdx.x;
    for(i=1; i < BLOCK_SIZE; i++){
      for (j=0; j < i; j++)
        peri_row[i][idx1]-=dia[i][j]*peri_row[j][idx1];
    }
  } else { //peri-col
    idx1=threadIdx.x - BLOCK_SIZE;
    for(i=0; i < BLOCK_SIZE; i++){
      for(j=0; j < i; j++)
        peri_col[idx1][i]-=peri_col[idx1][j]*dia[j][i];
      peri_col[idx1][i] /= dia[i][i];
    }
  }
#pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[]
  __syncthreads();

  //if (threadIdx.x < BLOCK_SIZE) { //peri-row
  //idx=threadIdx.x;
  array_offset = (offset+1)*matrix_dim+offset;
  for(i=1; i < BLOCK_SIZE; i++){
#pragma FCUDA TRANSFER begin name=write1 type=burst dir=[1] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    m[array_offset+(blockIdx.x+1)*BLOCK_SIZE+idx] = peri_row[i][idx];
#pragma FCUDA TRANSFER end name=write1 type=burst dir=[1] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    array_offset += matrix_dim;
  }
  //} else { //peri-col
  //idx=threadIdx.x - BLOCK_SIZE;
  array_offset = (offset+(blockIdx.x+1)*BLOCK_SIZE)*matrix_dim+offset;
  for(i=0; i < BLOCK_SIZE; i++){
#pragma FCUDA TRANSFER begin name=write2 type=burst dir=[1] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    m[array_offset+idx] =  peri_col[i][idx];
#pragma FCUDA TRANSFER end name=write2 type=burst dir=[1] pointer=[m] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]
    array_offset += matrix_dim;
  }
  //}

}

#pragma FCUDA GRID x_dim=16 y_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=m port_id=0
  __global__ void
lud_internal(double *m, int matrix_dim, int offset)
{
  __shared__ double peri_row[BLOCK_SIZE][BLOCK_SIZE];
  __shared__ double peri_col[BLOCK_SIZE][BLOCK_SIZE];

  int i;
  double sum;
  int global_row_id = offset + (blockIdx.y+1)*BLOCK_SIZE;
  int global_col_id = offset + (blockIdx.x+1)*BLOCK_SIZE;
#pragma FCUDA TRANSFER begin name=fetch type=burst dir=[0|0] pointer=[m|m] size=[16|16] cores=[1] unroll=1 mpart=1 array_split=[peri_col]
  peri_row[threadIdx.y][threadIdx.x] = m[offset * matrix_dim + global_col_id + matrix_dim * threadIdx.y + threadIdx.x]; //m[(offset+threadIdx.y)*matrix_dim+global_col_id+threadIdx.x];
  peri_col[threadIdx.y][threadIdx.x] = m[global_row_id * matrix_dim + offset + matrix_dim * threadIdx.y + threadIdx.x]; //m[(global_row_id+threadIdx.y)*matrix_dim+offset+threadIdx.x];
#pragma FCUDA TRANSFER end name=fetch type=burst dir=[0|0] pointer=[m|m] size=[16|16] cores=[1] unroll=1 mpart=1 array_split=[peri_col]

  __syncthreads();

#pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[peri_col]
  sum = 0;
  for (i=0; i < BLOCK_SIZE; i++)
    sum += peri_col[threadIdx.y][i] * peri_row[i][threadIdx.x];
  m[(global_row_id+threadIdx.y)*matrix_dim+global_col_id+threadIdx.x] -= sum;
#pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[peri_col]

}
