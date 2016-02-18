/*
 * Copyright 1993-2007 NVIDIA Corporation.  All rights reserved.
 *
 * NOTICE TO USER:
 *
 * This source code is subject to NVIDIA ownership rights under U.S. and
 * international Copyright laws.  Users and possessors of this source code
 * are hereby granted a nonexclusive, royalty-free license to use this code
 * in individual and commercial software.
 *
 * NVIDIA MAKES NO REPRESENTATION ABOUT THE SUITABILITY OF THIS SOURCE
 * CODE FOR ANY PURPOSE.  IT IS PROVIDED "AS IS" WITHOUT EXPRESS OR
 * IMPLIED WARRANTY OF ANY KIND.  NVIDIA DISCLAIMS ALL WARRANTIES WITH
 * REGARD TO THIS SOURCE CODE, INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY, NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE.
 * IN NO EVENT SHALL NVIDIA BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL,
 * OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
 * OF USE, DATA OR PROFITS,  WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
 * OR OTHER TORTIOUS ACTION,  ARISING OUT OF OR IN CONNECTION WITH THE USE
 * OR PERFORMANCE OF THIS SOURCE CODE.
 *
 * U.S. Government End Users.   This source code is a "commercial item" as
 * that term is defined at  48 C.F.R. 2.101 (OCT 1995), consisting  of
 * "commercial computer  software"  and "commercial computer software
 * documentation" as such terms are  used in 48 C.F.R. 12.212 (SEPT 1995)
 * and is provided to the U.S. Government only as a commercial end item.
 * Consistent with 48 C.F.R.12.212 and 48 C.F.R. 227.7202-1 through
 * 227.7202-4 (JUNE 1995), all U.S. Government End Users acquire the
 * source code with only those rights set forth herein.
 *
 * Any use of this source code in individual and commercial software must
 * include, in the user documentation and internal comments to the code,
 * the above Disclaimer and U.S. Government End Users Notice.
 */

#include <fcuda.h>
#define ELEMENTARY_LOG2SIZE 11

void fwtBatchGPU(float *d_Data, int M, int log2N)
{
  const int THREAD_N = 256;
  int N = 1 << log2N;
  int dataN = N;

  dim3 grid((1 << log2N) / (4 * THREAD_N), M, 1);
  dim3 block(THREAD_N, 1, 1);
  for(; log2N > ELEMENTARY_LOG2SIZE; log2N -= 2, N >>= 2, M <<= 2) {
    fwtBatch2Kernel(d_Data, d_Data, N / 4, grid, block, 1, 0);
  }
  grid.x = M;
  grid.y = 1;
  block.x = N/4;
  fwtBatch1Kernel(d_Data, d_Data, log2N, grid, block, 1, 0);
}



////////////////////////////////////////////////////////////////////////////////
// Modulate two arrays
////////////////////////////////////////////////////////////////////////////////
void modulateKernel_CMP(int guard_modulateKernel_CMP, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int N, float * d_A, float * d_B)
{
  int numThreads;
  int pos;
  float rcpN;
  int tid;
  dim3 threadIdx;
  if (guard_modulateKernel_CMP)
  {

    for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1)
    {
      tid=((blockIdx.x*blockDim.x)+threadIdx.x);
      numThreads=(blockDim.x*gridDim.x);
      rcpN=(1.0F/((float)N));
      pos=tid;
      while (1)
      {
        if (( !(pos<N)))
        {
          threadIdx=threadIdx;
          break;
        }
        if (pos<N)
        {
          float d_B_loc;
          float d_A_loc;
          float d_A_loc0;
          d_B_loc=d_B[pos];
          d_A_loc0=d_A[pos];
          d_A_loc=(d_A_loc0*(d_B_loc / (int)N));
          d_A[pos]=d_A_loc;
          pos+=numThreads;
        }
      }

    }

  }
}

void modulateKernel(float * d_A, float * d_B, int N, dim3 gridDim, dim3 blockDim)
{
  dim3 blockIdx;
  int guard_modulateKernel_CMP;
  dim3 blockIdx_loop;
  for (blockIdx_loop.x=0; gridDim.x>blockIdx_loop.x; blockIdx_loop.x+=1) {
    blockIdx.x=blockIdx_loop.x;
    guard_modulateKernel_CMP=1;
    modulateKernel_CMP(guard_modulateKernel_CMP, blockDim, gridDim, blockIdx, N, d_A, d_B);
  }
}

//Interface to modulateKernel()
void modulateGPU(float *d_A, float *d_B, int N)
{
  dim3 blockDim;
  dim3 gridDim;
  blockDim.x = 256;
  blockDim.y = 1;
  blockDim.z = 1;
  gridDim.x = 128;
  gridDim.y = 1;
  gridDim.z = 1;
  modulateKernel(d_A, d_B, N, gridDim, blockDim);
}
