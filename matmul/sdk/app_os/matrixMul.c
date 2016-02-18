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

/* Matrix multiplication: C = A * B.
 * Host code.
 *
 * This sample implements matrix multiplication and is exactly the same as
 * Chapter 7 of the programming guide.
 * It has been written for clarity of exposition to illustrate various CUDA
 * programming principles, not with the goal of providing the most
 * performant generic kernel for matrix multiplication.
 *
 * CUBLAS provides high-performance matrix multiplication.
 */

// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <fcuda.h>
#include "matrixMul.h"
#include "xfcuda.h"
#include "fpga_comm.h"

#define BASE_ADDRESS_A 0x11000000
#define BASE_ADDRESS_B 0x12000000
#define BASE_ADDRESS_C 0x13000000
#define BASE_ADDRESS_1 0x80000000

#define HW
#define SW
#define VERIFY

// includes, kernels
//#include "matrixMul_gold.c"
////////////////////////////////////////////////////////////////////////////////
// declaration, forward
void randomInit(DATATYPE*, int);
void printDiff(DATATYPE*, DATATYPE*, int, int);

//extern "C"
void computeGold(DATATYPE*, const DATATYPE*, const DATATYPE*, unsigned int, unsigned int, unsigned int);


// Comparison from Util/common.cpp in qilin benchs (with some mods)
int compareVectorFloats(float* out, float* ref, const int size, float errThreshld)
{
  // out is the vector to compare
  // ref is the reference
  // size = number of elements in both out and ref

  double error_norm = 0;
  double ref_norm = 0;
  int i;
  for (i=0; i<size; ++i) {
    const double diff = out[i] - ref[i];
    error_norm += diff * diff;
    ref_norm += ref[i]*ref[i];
  }

  error_norm = sqrt((double)error_norm);
  ref_norm = sqrt((double)ref_norm);

  if (fabs(ref_norm) < 1e-10) {
    fprintf (stderr, "!!!! reference norm is 0\n");
    return EXIT_FAILURE;
  }

  double err = error_norm / ref_norm;

  printf("error =  %.10lf\n", err);
  if (err < errThreshld)
    printf("PASSED.\n");
  else
    printf("FAILED.\n");
  return 0;
}

#include <sys/time.h>

struct timeval  tv1, tv2;
void runTest(int argc, char** argv);

////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
int main(int argc, char** argv)
{
  gettimeofday(&tv1, NULL);
  runTest(argc, argv);
  gettimeofday(&tv2, NULL);
  printf ("Total time = %lf seconds\n",
      (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
      (double) (tv2.tv_sec - tv1.tv_sec));
  return 0;
}

////////////////////////////////////////////////////////////////////////////////
//! Run a simple test for CUDA
////////////////////////////////////////////////////////////////////////////////
void runTest(int argc, char** argv)
{

  // set seed for rand()
  srand(2006);
  int i;
#ifdef HW
  int mem_dev = open("/dev/mem", O_RDWR | O_SYNC);

  if(mem_dev == -1)
  {
    // Error
    printf("Error when opening /dev/mem\n");
    return;
  }

  XFcuda xcore;
  int Status;

  Status = XFcuda_Initialize(&xcore, "fcuda");
  if (Status != XST_SUCCESS) {
    printf("Initialization failed %d\r\n", Status);
    return; // XST_FAILURE;
  }

#endif

  // allocate host memory for matrices A and B
  unsigned int size_A = WA * HA;
  unsigned int mem_size_A = sizeof(DATATYPE) * size_A;

#ifdef HW
  DATATYPE *h_A = (DATATYPE*)mem_alloc(mem_size_A, BASE_ADDRESS_A, mem_dev);
#endif

#ifdef SW
  DATATYPE* h_A_ref = (DATATYPE*) malloc(mem_size_A);
#endif
  unsigned int size_B = WB * HB;
  unsigned int mem_size_B = sizeof(DATATYPE) * size_B;

#ifdef HW
  DATATYPE *h_B = (DATATYPE*)mem_alloc(mem_size_B, BASE_ADDRESS_B, mem_dev);
#endif

#ifdef SW
  DATATYPE* h_B_ref = (DATATYPE*) malloc(mem_size_B);
#endif
  // initialize host memory

#ifdef HW
  randomInit(h_A, size_A);
  randomInit(h_B, size_B);
#endif

#ifdef SW
  randomInit(h_A_ref, size_A);
  randomInit(h_B_ref, size_B);
#endif

#ifdef VERIFY
  memcpy(h_A_ref, h_A, mem_size_A);
  memcpy(h_B_ref, h_B, mem_size_B);
#endif

  // allocate device memory for result
  unsigned int size_C = WC * HC;
  unsigned int mem_size_C = sizeof(DATATYPE) * size_C;

  //DATATYPE* h_C = (DATATYPE*) malloc(mem_size_C);
#ifdef HW
  DATATYPE *h_C = (DATATYPE*)mem_alloc(mem_size_C, BASE_ADDRESS_C, mem_dev);

  memset(h_C, 1, mem_size_C);
  // setup execution parameters
#endif




#ifdef SW
  DATATYPE* reference = (DATATYPE*)malloc(mem_size_C);
  computeGold(reference, h_A_ref, h_B_ref, HA, WA, WB);
#endif

#ifdef HW
  //DATATYPE *test = (DATATYPE*)mem_alloc(sizeof(DATATYPE), BASE_ADDRESS_1, mem_dev);
  //memcpy(h_A, test, 1 * sizeof(DATATYPE));
  //printf("here %d\n", test[0]);
  dim3 threads;
  threads.x = BLOCK_SIZE;
  threads.y = BLOCK_SIZE;
  threads.z = 1;
  dim3 grid;
  grid.x = WC / threads.x;
  grid.y = HC / threads.y;
  grid.z = 1;

  XFcuda_SetWa(&xcore, WA);
  XFcuda_SetWb(&xcore, WB);

  XFcuda_SetGriddim_x(&xcore, grid.x);
  XFcuda_SetGriddim_y(&xcore, grid.y);
  //XFcuda_SetGriddim_z(&xcore, grid.z);
  XFcuda_SetBlockdim_x(&xcore, threads.x);
  XFcuda_SetBlockdim_y(&xcore, threads.y);
  //XFcuda_SetBlockdim_z(&xcore, threads.z);
  XFcuda_SetC_addr(&xcore, BASE_ADDRESS_C / sizeof(DATATYPE));
  XFcuda_SetA_addr(&xcore, BASE_ADDRESS_A / sizeof(DATATYPE));
  XFcuda_SetB_addr(&xcore, BASE_ADDRESS_B / sizeof(DATATYPE));

  XFcuda_SetEn_fcuda1(&xcore, 1);

  XFcuda_Start(&xcore);	
  while (!XFcuda_IsDone(&xcore));

#endif

#ifdef VERIFY
  for (i = 0; i < 10; i++)
    printf("index %d: %d vs %d\n", i, h_C[i], reference[i]);

  compareVectorFloats(h_C, reference, size_C, 1e-6f);

#endif
  // clean up memory
  //free(h_A);
  //free(h_B);
  //free(h_C);
#ifdef HW
  mem_free((void*)h_A, mem_size_A, BASE_ADDRESS_A);
  mem_free((void*)h_B, mem_size_B, BASE_ADDRESS_B);
  mem_free((void*)h_C, mem_size_C, BASE_ADDRESS_C);
  close(mem_dev);
#endif

#ifdef SW
  free(h_A_ref);
  free(h_B_ref);
  free(reference);
#endif

}

// Allocates a matrix with random DATATYPE entries.
void randomInit(DATATYPE* data, int size)
{
  int i;
  for (i = 0; i < size; ++i)
    data[i] = rand() / (DATATYPE)RAND_MAX;
}

void printDiff(DATATYPE *data1, DATATYPE *data2, int width, int height)
{
  int i,j,k;
  int error_count=0;
  for (j=0; j<height; j++) {
    for (i=0; i<width; i++) {
      k = j*width+i;
      if (data1[k] != data2[k]) {
        printf("diff(%d,%d) CPU=%4.4f, GPU=%4.4f n", i,j, data1[k], data2[k]);
        error_count++;
      }
    }
  }
  printf(" nTotal Errors = %d n", error_count);
}
