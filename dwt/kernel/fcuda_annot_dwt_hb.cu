/*

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

 * Device Code.
 */
#ifndef _DWTHAAR1D_KERNEL_H_
#define _DWTHAAR1D_KERNEL_H_

#include <fcuda.h>
//#include "dwtHaar1D.h"
#include <string.h>

#define INV_SQRT_2 10
#define LOG_NUM_BANKS 4
#define NUM_BANKS 16
typedef int DATATYPE;

////////////////////////////////////////////////////////////////////////////////
//! Compute partial wavelet decomposition on the GPU using Haar basis
//! For each thread block the full decomposition is computed but these results
//! have to be combined
//! Use one thread to perform the full decomposition
//! @param id  input data
//! @param od  output data
//! @param approx_final  place to store the final approximation coefficient for
//!                      the subsignal
//! @param dlevels  number of decomposition levels for this transform
//! @param slength_step_half   half signal length for current decomposition
//!                            level (offset for storing detail coefficients in
//!                            global memory
//! @param bdim  block dimension
////////////////////////////////////////////////////////////////////////////////

#pragma FCUDA GRID x_dim=512
#pragma FCUDA COREINFO num_cores=2 pipeline=yes
#pragma FCUDA PORTMERGE remove_port_name=id port_id=0
#pragma FCUDA PORTMERGE remove_port_name=od port_id=0
#pragma FCUDA PORTMERGE remove_port_name=approx_final port_id=0
  __global__ void
dwtHaar1D(DATATYPE *id, DATATYPE *od, DATATYPE *approx_final,
    const unsigned int dlevels,
    const unsigned int slength_step_half,
    const int bdim)
{
  __shared__ DATATYPE shared[1024];
  __shared__ DATATYPE shared2[1024];

  __shared__ DATATYPE dataDiff1[512];
  __shared__ DATATYPE dataDiff2[512];

  const int gdim = gridDim.x;
  const int bid = blockIdx.x;
  const int tid = threadIdx.x;

  DATATYPE data0;
  DATATYPE data1;
  unsigned int offset_neighbor;
  unsigned int num_threads, num_threads2;
  unsigned int stride;
  unsigned int g_wpos;

  const int tid_global = (bid * bdim) ;
  unsigned int idata = (bid * (2 * bdim));

#pragma FCUDA COMPUTE cores=[1] begin name=fetch unroll=1 array_split=[dataDiff1] mpart=1
//#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0] pointer=[id] size=[1024] begin name=fetchid unroll=1 mpart=1 array_split=[dataDiff1]
  int i;
  for (i = 0; i < 1024; i+=512)
  shared[tid + i] = id[idata + tid + i];
//#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0] pointer=[id] size=[1024] end name=fetchid unroll=1 mpart=1  array_split=[dataDiff1]
#pragma FCUDA COMPUTE cores=[1] end name=fetch unroll=1 array_split=[dataDiff1] mpart=1

  __syncthreads();

#pragma FCUDA COMPUTE cores=[1] begin name=dcomp0 unroll=1 array_split=[dataDiff1] mpart=1
  data0 = shared[2*tid];
  data1 = shared[(2*tid) + 1];
  __syncthreads();

  dataDiff1[tid] = (data0 - data1) * INV_SQRT_2;
  unsigned int atid = tid + (tid >> LOG_NUM_BANKS);
  shared2[atid] = (data0 + data1) * INV_SQRT_2;
  __syncthreads();

  offset_neighbor = 1;
  num_threads = bdim >> 1;
  stride = 1;
  unsigned int dlv;
  for(dlv = 1; dlv < dlevels; ++dlv)
  {
    unsigned int idata0 = tid << stride;
    if( tid < num_threads)
    {
      unsigned int idata1 = idata0 + offset_neighbor;
      dataDiff2[num_threads+tid] = (shared2[idata0 + (idata0 >> LOG_NUM_BANKS)] - shared2[idata1 + (idata1 >> LOG_NUM_BANKS)]) * INV_SQRT_2;
      shared2[idata0 + (idata0 >> LOG_NUM_BANKS)] = (shared2[idata0 + (idata0 >> LOG_NUM_BANKS)] + shared2[idata1 + (idata1 >> LOG_NUM_BANKS)]) * INV_SQRT_2;
    }
    num_threads = num_threads >> 1;
    offset_neighbor <<= 1;
    stride = stride + 1;
    __syncthreads();
  }
  __syncthreads();
#pragma FCUDA COMPUTE cores=[1] end name=dcomp0 unroll=1 array_split=[dataDiff1] mpart=1

#pragma FCUDA COMPUTE cores=[1] begin name=dcomp1 unroll=1 array_split=[dataDiff1] mpart=1
  if (tid == 0)
    approx_final[bid + tid] = shared2[tid];
#pragma FCUDA COMPUTE cores=[1] end name=dcomp1 unroll=1 array_split=[dataDiff1] mpart=1


#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[od] size=[bdim] begin name=writeod unroll=1 mpart=1 array_split=[dataDiff1]
  od[tid_global + slength_step_half + tid] = dataDiff1[tid];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[od] size=[bdim] end name=writeod unroll=1 mpart=1 array_split=[dataDiff1]

  for(num_threads2 = bdim >> 1; num_threads2>0; num_threads2 >>= 1) {
    g_wpos = (num_threads2 * gdim) + (bid * num_threads2);

#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[od] size=[num_threads2] begin name=writeod2 unroll=1 mpart=1 array_split=[dataDiff1] inline=no
    od[g_wpos + tid] = dataDiff2[tid + num_threads2];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[od] size=[num_threads2] end name=writeod2 unroll=1 mpart=1 array_split=[dataDiff1] inline=no
  }
}

#endif
