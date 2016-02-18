/*
 * Copyright 1993-2010 NVIDIA Corporation.  All rights reserved.
 *
 * NVIDIA Corporation and its licensors retain all intellectual property and
 * proprietary rights in and to this software and related documentation.
 * Any use, reproduction, disclosure, or distribution of this software
 * and related documentation without an express license agreement from
 * NVIDIA Corporation is strictly prohibited.
 *
 * Please refer to the applicable NVIDIA end user license agreement (EULA)
 * associated with this source code for terms and conditions that govern
 * your use of this NVIDIA software.
 *
 */



#ifndef FWT_KERNEL_CUH
#define FWT_KERNEL_CUH
#ifndef fwt_kernel_cuh
#define fwt_kernel_cuh

#include <fcuda.h>
#include <string.h>
//typedef float float;

///////////////////////////////////////////////////////////////////////////////
// Elementary(for vectors less than elementary size) in-shared memory
// combined radix-2 + radix-4 Fast Walsh Transform
///////////////////////////////////////////////////////////////////////////////
#define ELEMENTARY_LOG2SIZE 11
#define ELEMENTARY_SIZE 2048
#define THREAD_N 256

#pragma FCUDA GRID x_dim=512
#pragma FCUDA COREINFO num_cores=2 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=d_Input port_id=0 offset=0
#pragma FCUDA PORTMERGE remove_port_name=d_Output port_id=0 offset=8388608
//note: this kernel does not allow array partitioning as it will lead to incorrect result
__global__ void fwtBatch1Kernel(float *d_Output, float *d_Input, int log2N)
{
    	const int    N = 1 << log2N;
    	const int base = blockIdx.x << log2N;
    	__shared__ float s_data[ELEMENTARY_SIZE];
	__shared__ float s_data1[ELEMENTARY_SIZE];
#pragma FCUDA TRANSFER name=fetch type=burst dir=[0] pointer=[d_Input] cores=[1] begin size=[2048] unroll=1
   	s_data[0] = d_Input[base];
#pragma FCUDA TRANSFER name=fetch type=burst dir=[0] pointer=[d_Input] cores=[1] end size=[2048] unroll=1

#pragma FCUDA COMPUTE cores=[1] begin name=vec_blk unroll=1
    	//Main radix-4 stages
    	const int pos = threadIdx.x;
    	int stride;
    	for(stride = N >> 2; stride > 0; stride >>= 2) {
        	int lo = pos & (stride - 1);
        	int i0 = ((pos - lo) << 2) + lo;
        	int i1 = i0 + stride;
        	int i2 = i1 + stride;
        	int i3 = i2 + stride;
		//__syncthreads(); // FCUDA: avoid creating ThreadLoop here to make the execution correctly.
        	float D0 = s_data[i0];
        	float D1 = s_data[i1];
       	 	float D2 = s_data[i2];
        	float D3 = s_data[i3];

        	float T;
        	T = D0;
		D0 = D0 + D2;
		D2 = T - D2;
        	T = D1;
		D1 = D1 + D3;
		D3 = T - D3;
        	T = D0;
		s_data[i0] = D0 + D1;
		s_data[i1] = T - D1;
        	T = D2;
		s_data[i2] = D2 + D3;
		s_data[i3] = T - D3;
        	__syncthreads();
    	}

    	//Do single radix-2 stage for odd power of two
	if(log2N & 1) {
    		__syncthreads();
		int pos2;
    		for(pos2 = threadIdx.x+0; pos2 < N / 2; pos2 += blockDim.x) {
    			int i4 = pos2 << 1;
        		int i5 = i4 + 1;

        		float D4 = s_data[i4];
        		float D5 = s_data[i5];
        		s_data[i4] = D4 + D5;
        		s_data[i5] = D4 - D5;
			s_data1[i4] = s_data[i4];
			s_data1[i5] = s_data[i5];
       		}
    	}
	//__syncthreads();
#pragma FCUDA COMPUTE cores=[1] end name=vec_blk unroll=1

#pragma FCUDA TRANSFER name=write type=burst dir=[1] pointer=[d_Output] cores=[1] begin size=[2048] unroll=1
	d_Output[base] = s_data1[0];
#pragma FCUDA TRANSFER name=write type=burst dir=[1] pointer=[d_Output] cores=[1] end size=[2048] unroll=1

}

#pragma FCUDA GRID x_dim=256
#pragma FCUDA COREINFO num_cores=2 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=d_Input port_id=0 offset=0
#pragma FCUDA PORTMERGE remove_port_name=d_Output port_id=0 offset=8388608
__global__ void fwtBatch2Kernel(float *d_Output, float *d_Input, int stride)
{
    	const int pos = blockIdx.x * blockDim.x;
    	__shared__ float bram_d0[THREAD_N];
    	__shared__ float bram_d1[THREAD_N];
    	__shared__ float bram_d2[THREAD_N];
    	__shared__ float bram_d3[THREAD_N];

	__shared__ float bram_d01[THREAD_N];
	__shared__ float bram_d11[THREAD_N];
	__shared__ float bram_d21[THREAD_N];
	__shared__ float bram_d31[THREAD_N];

    	int lo = pos & (stride - 1);
    	int i0 = ((pos - lo) << 2) + lo;
    	int i1 = i0 + stride;
    	int i2 = i1 + stride;
    	int i3 = i2 + stride;

#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0|0|0|0] pointer=[d_Input|d_Input|d_Input|d_Input] size=[256|256|256|256] begin name=fetch unroll=1 mpart=1 array_split=[bram_d0|bram_d1|bram_d2|bram_d3]
    	bram_d0[threadIdx.x] = d_Input[i0 + threadIdx.x];
    	bram_d1[threadIdx.x] = d_Input[i1 + threadIdx.x];
    	bram_d2[threadIdx.x] = d_Input[i2 + threadIdx.x];
    	bram_d3[threadIdx.x] = d_Input[i3 + threadIdx.x];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0|0|0|0] pointer=[d_Input|d_Input|d_Input|d_Input] size=[256|256|256|256] end name=fetch unroll=1 mpart=1 array_split=[bram_d0|bram_d1|bram_d2|bram_d3]


#pragma FCUDA COMPUTE cores=[1] begin name=vec_blk array_split=[bram_d0|bram_d1|bram_d2|bram_d3] unroll=1 mpart=1

    	float D0 = bram_d0[threadIdx.x];
    	float D1 = bram_d1[threadIdx.x];
    	float D2 = bram_d2[threadIdx.x];
    	float D3 = bram_d3[threadIdx.x];

    	float T;
    	T = D0;
	D0 = D0 + D2;
	D2 = T - D2;
    	T = D1;
	D1 = D1 + D3;
	D3 = T - D3;
    	T = D0;

    	bram_d0[threadIdx.x] = D0 + D1;
	bram_d01[threadIdx.x] = bram_d0[threadIdx.x];

    	bram_d1[threadIdx.x] = T - D1;
	bram_d11[threadIdx.x] = bram_d1[threadIdx.x];

    	T = D2;
    	bram_d2[threadIdx.x] = D2 + D3;
	bram_d21[threadIdx.x] = bram_d2[threadIdx.x];

    	bram_d3[threadIdx.x] = T - D3;
	bram_d31[threadIdx.x] = bram_d3[threadIdx.x];

#pragma FCUDA COMPUTE cores=[1] end name=vec_blk array_split=[bram_d0|bram_d1|bram_d2|bram_d3] unroll=1 mpart=1


#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1|1|1|1] pointer=[d_Output|d_Output|d_Output|d_Output] size=[256|256|256|256] begin name=write unroll=1 mpart=1 array_split=[bram_d0|bram_d1|bram_d2|bram_d3]
    	d_Output[i0 + threadIdx.x] = bram_d01[threadIdx.x];
    	d_Output[i1 + threadIdx.x] = bram_d11[threadIdx.x];
    	d_Output[i2 + threadIdx.x] = bram_d21[threadIdx.x];
    	d_Output[i3 + threadIdx.x] = bram_d31[threadIdx.x];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1|1|1|1] pointer=[d_Output|d_Output|d_Output|d_Output] size=[256|256|256|256] end name=write unroll=1 mpart=1 array_split=[bram_d0|bram_d1|bram_d2|bram_d3]

}

#endif
#endif
