/* Matrix multiplication: C = A * B.
 * Device code.
 */

#ifndef _MATRIXMUL_KERNEL_H_
#define _MATRIXMUL_KERNEL_H_

#include <fcuda.h>
//#include "matrixMul.h"
#include <string.h>

#define BLOCK_SIZE 16
typedef int DATATYPE;

#define CHECK_BANK_CONFLICTS 0
#if CHECK_BANK_CONFLICTS
#define AS(i, j) cutilBankChecker(((DATATYPE*)&As[0][0]), (BLOCK_SIZE * i + j))
#define BS(i, j) cutilBankChecker(((DATATYPE*)&Bs[0][0]), (BLOCK_SIZE * i + j))
#else
#define AS(i, j) As[i][j]
#define BS(i, j) Bs[i][j]
#endif

////////////////////////////////////////////////////////////////////////////////
//! Matrix multiplication on the device: C = A * B
//! wA is A's width and wB is B's width
////////////////////////////////////////////////////////////////////////////////
#pragma FCUDA GRID x_dim=16 y_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=A port_id=0
#pragma FCUDA PORTMERGE remove_port_name=B port_id=0
#pragma FCUDA PORTMERGE remove_port_name=C port_id=0
__global__ void matrixMul( DATATYPE *C, DATATYPE *A, DATATYPE *B, int wA, int wB)
{
  // Block index
  int bx = blockIdx.x;
  int by = blockIdx.y;

  // Thread index
  int tx = threadIdx.x;
  int ty = threadIdx.y;

  // Index of the first sub-matrix of A processed by the block
  int aBegin = wA * BLOCK_SIZE * by;

  // Index of the last sub-matrix of A processed by the block
  int aEnd   = aBegin + wA - 1;

  // Step size used to iterate through the sub-matrices of A
  int aStep  = BLOCK_SIZE;

  // Index of the first sub-matrix of B processed by the block
  int bBegin = BLOCK_SIZE * bx;

  // Step size used to iterate through the sub-matrices of B
  int bStep  = BLOCK_SIZE * wB;

#pragma FCUDA COMPUTE cores=[1] begin name=vec_init unroll=1 mpart=1 array_split=[Csub_block|As] inline=no
  DATATYPE Csub = 0;
#pragma FCUDA COMPUTE cores=[1] end name=vec_init unroll=1 mpart=1 array_split=[Csub_block|As] inline=no

  int a = 0, b = 0, k = 0;
  // Loop over all the sub-matrices of A and B
  // required to compute the block sub-matrix
  for (a = aBegin, b = bBegin;
      a <= aEnd;
      a += aStep, b += bStep) {
    // Declaration of the shared memory array As used to
    // store the sub-matrix of A
#pragma FCUDA PORTMERGE remove_port_name=As
    __shared__ DATATYPE As[BLOCK_SIZE][BLOCK_SIZE];

    // Declaration of the shared memory array Bs used to
    // store the sub-matrix of B
#pragma FCUDA PORTMERGE remove_port_name=Bs
    __shared__ DATATYPE Bs[BLOCK_SIZE][BLOCK_SIZE];

    // Load the matrices from device memory
    // to shared memory; each thread loads
    // one element of each matrix
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0|0] pointer=[A|B] size=[16|16] begin name=fetch unroll=1 mpart=1 array_split=[Csub_block|As] inline=no
    AS(ty, tx) = A[a + wA * ty + tx];
    BS(ty, tx) = B[b + wB * ty + tx];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0|0] pointer=[A|B] size=[16|16] end name=fetch unroll=1 mpart=1 array_split=[Csub_block|As] inline=no

    // Synchronize to make sure the matrices are loaded
    __syncthreads();

    // Multiply the two matrices together;
    // each thread computes one element
    // of the block sub-matrix
#pragma FCUDA COMPUTE cores=[1] begin name=vec_blk array_split=[Csub_block|As] unroll=1 mpart=1 inline=no
lp1: for (k = 0; k < BLOCK_SIZE; ++k)
       Csub += AS(ty, k) * BS(k, tx);
#pragma FCUDA COMPUTE cores=[1] end name=vec_blk array_split=[Csub_block|As] unroll=1 mpart=1 inline=no

     // Synchronize to make sure that the preceding
     // computation is done before loading two new
     // sub-matrices of A and B in the next iteration
     __syncthreads();
  }

  // Write the block sub-matrix to device memory;
  // each thread writes one element
  int c = wB * BLOCK_SIZE * by + BLOCK_SIZE * bx;
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[C] size=[16] begin name=write unroll=1 mpart=1 array_split=[Csub_block|As] inline=yes
  C[c + wB * ty + tx] = Csub;
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[C] size=[16] end name=write unroll=1 mpart=1 array_split=[Csub_block|As] inline=yes
}

#endif // #ifndef _MATRIXMUL_KERNEL_H_
