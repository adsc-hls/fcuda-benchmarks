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

/*
 * Walsh transforms belong to a class of generalized Fourier transformations.
 * They have applications in various fields of electrical engineering
 * and numeric theory. In this sample we demonstrate efficient implementation
 * of naturally-ordered Walsh transform
 * (also known as Walsh-Hadamard or Hadamard transform) in CUDA and its
 * particular application to dyadic convolution computation.
 * Refer to excellent Jorg Arndt's "Algorithms for Programmers" textbook
 * http://www.jjj.de/fxt/fxtbook.pdf (Chapter 22)
 *
 * Victor Podlozhnyuk (vpodlozhnyuk@nvidia.com)
 */



#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <fcuda.h>
#include "fastWalshTransform_gold.c"


////////////////////////////////////////////////////////////////////////////////
// Reference CPU FWT
////////////////////////////////////////////////////////////////////////////////
void fwtCPU(float *h_Output, float *h_Input, int log2N);
void slowWTcpu(float *h_Output, float *h_Input, int log2N);
void dyadicConvolutionCPU(
    float *h_Result,
    float *h_Data,
    float *h_Kernel,
    int log2dataN,
    int log2kernelN
    );

void fwtBatch1Kernel(
    float *d_Data,
    float *d_Data1,
    int log2N,
    dim3 grid,
    dim3 block,
    int num_cores, int core_id
    );

void fwtBatch2Kernel(
    float *d_Data,
    float *d_Data1,
    int N,
    dim3 grid,
    dim3 block,
    int num_cores, int core_id
    );

////////////////////////////////////////////////////////////////////////////////
// GPU FWT
////////////////////////////////////////////////////////////////////////////////
#include "fastWalshTransform_kernel_wrapper.c"

////////////////////////////////////////////////////////////////////////////////
// Main program
////////////////////////////////////////////////////////////////////////////////
int main(int argc, char *argv[])
{

  const int log2Kernel = 7;

#ifndef __DEVICE_EMULATION__
  const int log2Data = 23;
#else
  const int log2Data = 15;
#endif
  const int   dataN = 1 << log2Data;
  const int kernelN = 1 << log2Kernel;

  const int   DATA_SIZE = dataN   * sizeof(float);
  const int KERNEL_SIZE = kernelN * sizeof(float);

  float *h_Data, *h_Kernel, *h_ResultCPU;
  float *d_Data, *d_Kernel;
  double delta, ref, sum_delta2, sum_ref2, L2norm, gpuTime;
  int i;
  printf("Initializing data...\n");
  printf("...allocating CPU memory\n");
  h_Kernel = (float*) malloc(KERNEL_SIZE);
  h_Data = (float*) malloc(DATA_SIZE);
  h_ResultCPU = (float*) malloc(DATA_SIZE);

  printf("...allocating GPU memory\n");
  d_Kernel = (float*) malloc(DATA_SIZE);
  d_Data = (float*) malloc(DATA_SIZE);

  printf("...generating data\n");
  printf("Data length: %i; kernel length: %i\n", dataN, kernelN);
  srand(2007);
  for (i = 0; i < kernelN; i++)
    h_Kernel[i] = (float)rand() / (float)RAND_MAX;

  for (i = 0; i < dataN; i++)
    h_Data[i] = (float)rand() / (float)RAND_MAX;

  for(i = 0; i < dataN; i++)
    d_Kernel[i] = 0;

  memcpy(d_Kernel, h_Kernel, KERNEL_SIZE);
  memcpy(d_Data, h_Data, DATA_SIZE);

  printf("Running GPU dyadic convolution using Fast Walsh Transform...\n");
  fwtBatchGPU(d_Data, 1, log2Data);
  fwtBatchGPU(d_Kernel, 1, log2Data);
  modulateGPU(d_Data, d_Kernel, dataN);
  fwtBatchGPU(d_Data, 1, log2Data);

  printf("Reading back GPU results...\n");
  printf("Running straightforward CPU dyadic convolution...\n");
  dyadicConvolutionCPU(h_ResultCPU, h_Data, h_Kernel, log2Data, log2Kernel);

  printf("Comparing the results...\n");
  sum_delta2 = 0;
  sum_ref2   = 0;
  for(i = 0; i < dataN; i++) {
    delta = h_ResultCPU[i] - d_Data[i];
    ref = h_ResultCPU[i];
    sum_delta2 += delta * delta;
    sum_ref2   += ref * ref;
  }
  L2norm = sqrt(sum_delta2 / sum_ref2);
  printf("L2 norm: %E\n", L2norm);
  printf("sum_delta2: %E \t sum_ref2: %E\n", sum_delta2, sum_ref2);
  printf((L2norm < 1e-6) ? "PASSED.\n" : "FAILED.\n");
  free(d_Data);
  free(d_Kernel);
  free(h_ResultCPU);
  free(h_Data);
  free(h_Kernel);
}
