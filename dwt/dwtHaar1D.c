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
 * 1D DWT for Haar wavelet and signals with a length which is a power of 2.
 * The code reduces bank conflicts and non-coalesced reads / writes as
 * appropriate but does not fully remove them because the computational
 * overhead to achieve this would outweighs the benefit (see inline comments
 * for more details).
 * Large signals are subdivided into sub-signals with 512 elements and the
 * wavelet transform for these is computed with one block over 10 decomposition
 * levels. The resulting signal consisting of the approximation coefficients at
 * level X is then processed in a subsequent step on the device. This requires
 * interblock syncronization which is only possible on host side.
 * Detail coefficients which have been computed are not further referenced
 * during the decomposition so that they can be stored directly in their final
 * position in global memory. The transform and its storing scheme preserve
 * locality in the coefficients so that these writes are coalesced.
 * Approximation coefficients are stored in shared memory because they are
 * needed to compute the subsequent decomposition step. The top most
 * approximation coefficient for a sub-signal processed by one block is stored
 * in a special global memory location to simplify the processing after the
 * interblock synchronization.
 * Most books on wavelets explain the Haar wavelet decompositon. A good freely
 * available resource is the Wavelet primer by Stollnitz et al.
 * http://grail.cs.washington.edu/projects/wavelets/article/wavelet1.pdf
 * http://grail.cs.washington.edu/projects/wavelets/article/wavelet2.pdf
 * The basic of all Wavelet transforms is to decompose a signal into
 * approximation (a) and detail (d) coefficients where the detail tends to be
 * small or zero which allows / simplifies compression. The following "graphs"
 * demonstrate the transform for a signal
 * of length eight. The index always describes the decomposition level where
 * a coefficient arises. The input signal is interpreted as approximation signal
 * at level 0. The coefficients computed on the device are stored in the same
 * scheme as in the example. This data strucure is particularly well suited for
 * compression and also preserves the hierachical strucure of the decomposition.

 -------------------------------------------------
 | a_0 | a_0 | a_0 | a_0 | a_0 | a_0 | a_0 | a_0 |
 -------------------------------------------------

 -------------------------------------------------
 | a_1 | a_1 | a_1 | a_1 | d_1 | d_1 | d_1 | d_1 |
 -------------------------------------------------

 -------------------------------------------------
 | a_2 | a_2 | d_2 | d_2 | d_1 | d_1 | d_1 | d_1 |
 -------------------------------------------------

 -------------------------------------------------
 | a_3 | d_3 | d_2 | d_2 | d_1 | d_1 | d_1 | d_1 |
 -------------------------------------------------

 * Host code.
 */

#ifdef _WIN32
#  define NOMINMAX
#endif

// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>
#include <fcuda.h>

// includes, project
//#include <cutil_inline.h>
//#include "utilities/cutil.cpp"
//#include "utilities/exception.h"
//#include "utilities/error_checker.h"
// constants which are used in host and device code
#include "dwtHaar1D.h"

////////////////////////////////////////////////////////////////////////////////
// includes, kernels
//#include <dwtHaar1D_kernel.cu>

////////////////////////////////////////////////////////////////////////////////
// declaration, forward
void runTest( int argc, char** argv);
int  getLevels( unsigned int len, unsigned int* levels);
int readFile( const char* filename, DATATYPE** data)
{
  // intermediate storage for the data read
  DATATYPE data_read;

  // allocate storage for the data read
  *data = (DATATYPE*) malloc( sizeof(DATATYPE) * 262144);

  FILE *fp = fopen(filename, "r");
  int count = 0;
  while (fscanf(fp, "%f", &data_read) != EOF) {
    (*data)[count] = data_read;
    count++;
  }
  return 1;
}

int compareData( const DATATYPE* reference, const DATATYPE* data, const unsigned int len, const DATATYPE epsilon)
{
  int result = 1;
  int i;
  for (i = 0; i < len; ++i) {

    DATATYPE diff = reference[i] - data[i];
    int comp = (diff <= epsilon) && (diff >= -epsilon);
    result &= comp;
  }
  return (result) ? 1 : 0;
}
////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
  int
main( int argc, char** argv)
{
  // run test
  runTest( argc, argv);
}

////////////////////////////////////////////////////////////////////////////////
//! Perform the wavelet decomposition
////////////////////////////////////////////////////////////////////////////////
void runTest( int argc, char** argv)
{
  char* s_fname ;
  char* r_fname ;
  char* r_gold_fname ;
  const char usage[] =
  {
    "\nUsage:\n"
      "  dwtHaar1D --signal=<signal_file> --result=<result_file> --gold=<gold_file>\n\n"
      "  <signal_file> Input file containing the signal\n"
      "  <result_file> Output file storing the result of the wavelet decomposition\n"
      "  <gold_file>   Input file containing the reference result of the wavelet decomposition\n"
      "\nExample:\n"
      "  bin\\win32\\release\\dwtHaar1D\n"
      "       --signal=projects\\dwtHaar1D\\data\\signal.dat\n"
      "       --result=projects\\dwtHaar1D\\data\\regression.dat\n"
      "       --gold=projects\\dwtHaar1D\\data\\regression.gold.dat\n"
  };

  char s_fname_arr[] = "data/signal_2_18.dat";
  char r_gold_fname_arr[] = "data/regression_2_18.gold.dat";

  char r_fname_arr[] = "regression.dat";
  s_fname = s_fname_arr;
  r_fname = r_fname_arr;
  r_gold_fname = r_gold_fname_arr;

  // read in signal
  unsigned int slength = 262144;
  DATATYPE* signal = NULL;
  if (s_fname == 0)
  {
    fprintf(stderr, "Cannot find the file containing the signal.\n%s", usage);
    exit(1);
  }
  if (readFile(s_fname, &signal) == 1) {
    printf("Reading signal from %s\n", s_fname);
  } else {
    exit(1);
  }

  // get the number of decompositions necessary to perform a full decomposition
  unsigned int dlevels_complete = 0;
  if (1 != getLevels( slength, &dlevels_complete))
  {
    // error message
    fprintf( stderr, "Signal length not supported.\n");
    return;
  }

  // device in data
  DATATYPE* d_idata = NULL;
  // device out data
  DATATYPE* d_odata = NULL;
  // device approx_final data
  DATATYPE* approx_final = NULL;

  // The very final approximation coefficient has to be written to the output
  // data, all others are reused as input data in the next global step and
  // therefore have to be written to the input data again.
  // The following flag indicates where to copy approx_final data
  //   - 0 is input, 1 is output
  int approx_is_input;

  // allocate device mem
  const unsigned int smem_size = sizeof(DATATYPE) * slength;
  d_idata = (DATATYPE*) malloc(smem_size);
  d_odata = (DATATYPE*) malloc(smem_size);
  approx_final = (DATATYPE*) malloc(smem_size);
  memcpy(d_idata, signal, smem_size);

  // clear result memory
  DATATYPE* tmp = (DATATYPE*) malloc( smem_size);
  int i;
  for (i = 0; i < slength; ++i)
    tmp[i] = 0.0;
  memcpy(d_odata, tmp, smem_size);
  free( tmp);

  // total number of threads
  // in the first decomposition step always one thread computes the average and
  // detail signal for one pair of adjacent values
  unsigned int num_threads_total_left = slength / 2;
  // decomposition levels performed in the current / next step
  unsigned int  dlevels_step = dlevels_complete;

  // 1D signal so the arrangement of elements is also 1D
  dim3  block_size;
  dim3  grid_size;

  // number of decomposition levels left after one iteration on the device
  unsigned int dlevels_left = dlevels_complete;

  // if less or equal 1k elements, then the data can be processed in one block,
  // this avoids the Wait-For-Idle (WFI) on host side which is necessary if the
  // computation is split accross multiple SM's if enough input data
  if( dlevels_complete <= 10) {
    // decomposition can be performed at once
    block_size.x = num_threads_total_left;
    approx_is_input = 0;
  } else {
    // 512 threads per block
    grid_size.x = (num_threads_total_left / 512);
    block_size.x = 512;

    // 512 threads corresponds to 10 decomposition steps
    dlevels_step = 10;
    dlevels_left -= 10;
    approx_is_input = 1;
  }
  grid_size.y = 1;
  grid_size.z = 1;
  block_size.y = 1;
  block_size.z = 1;

  // do until full decomposition is accomplished
  while( 0 != num_threads_total_left) {
    // run kernel
    dwtHaar1D(d_idata, d_odata, approx_final, dlevels_step, num_threads_total_left, block_size.x, grid_size, block_size, 1, 0);

    // Copy approx_final to appropriate location
    if (approx_is_input) {
      memcpy(d_idata, approx_final, grid_size.x*4);
    } else {
      memcpy(d_odata, approx_final, grid_size.x*4);
    }

    // update level variables
    if( dlevels_left < 10) {
      // approx_final = d_odata;
      approx_is_input = 0;
    }

    // more global steps necessary
    dlevels_step = (dlevels_left > 10) ? dlevels_left - 10 : dlevels_left;
    dlevels_left -= 10;

    // after each step only half the threads are used any longer
    // therefore after 10 steps 2^10 less threads
    num_threads_total_left = num_threads_total_left >> 10;

    // update block and grid size
    grid_size.x = (num_threads_total_left / 512)
      + (0 != (num_threads_total_left % 512)) ? 1 : 0;
    if( grid_size.x <= 1) {
      block_size.x = num_threads_total_left;
    }
  }

  // load the reference solution
  unsigned int len_reference = 262144;
  DATATYPE* reference = NULL;
  if (r_gold_fname == 0) {
    fprintf(stderr, "Cannot read the file containing the reference result of the wavelet decomposition.\n%s", usage);
    //cudaThreadExit();
    exit(1);
  }
  if (readFile(r_gold_fname, &reference) == 1)
    printf("Reading reference result from %s\n", r_gold_fname);
  else {
    exit(1);
  }
  assert(slength == len_reference);

  //compare the computed solution and the reference
  int res = compareData(reference, d_odata, slength, 0.001f);
  printf("%s\n", (1 == res) ? "PASSED." : "FAILED.");
  free(reference);
  free(d_odata);
  free(d_idata);
  free(approx_final);
  free(signal);
}

////////////////////////////////////////////////////////////////////////////////
//! Get number of decomposition levels to perform a full decomposition
//! Also check if the input signal size is suitable
//! @return  CUTTrue if the number of decomposition levels could be determined
//!          and the signal length is supported by the implementation,
//!          otherwise CUTFalse
//! @param   len  length of input signal
//! @param   levels  number of decomposition levels necessary to perform a full
//!           decomposition
////////////////////////////////////////////////////////////////////////////////
int getLevels( unsigned int len, unsigned int* levels)
{
  //CUTBoolean retval = CUTFalse;
  int retval = 0;

  // currently signals up to a length of 2^20 supported
  int i;
  for (i = 0; i < 20; ++i)
  {
    if( len == (1 << i))
    {
      *levels = i;
      //retval = CUTTrue;
      retval = 1;
      break;
    }
  }
  return retval;
}
