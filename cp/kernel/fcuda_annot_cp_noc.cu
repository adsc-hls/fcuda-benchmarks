/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/

#include <stdio.h>
#include "cuenergy_noc.h"
#include <fcuda.h>
#include <math.h>
#include <string.h>
__constant__ DATATYPE atominfo[4*MAXATOMS];

/* Size of the benchmark problem.  The GPU can run larger problems in a
 * reasonable time.
 *
 * For VOLSIZEX, VOLSIZEY, size 256 is suitable for a few seconds of
 * GPU computation and size 128 is suitable for a few seconds of
 * CPU computation.
 *
 * For ATOMCOUNT, 100000 is suitable for GPU computation and 10000 is
 * suitable for CPU computation.
 */

/* This is a reference version of the kernel.  It is simpler and slower
 * than the optimzed version. */

#define numatoms MAXATOMS
#define gridspacing 1

#pragma FCUDA GRID x_dim=16 y_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=atominfo port_id=0
#pragma FCUDA PORTMERGE remove_port_name=energygrid_input port_id=0
#pragma FCUDA PORTMERGE remove_port_name=energygrid_output port_id=0 
__global__ void cenergy(DATATYPE * atominfo, DATATYPE * energygrid_input, DATATYPE * energygrid_output) {


	int atombytes = numatoms*4;
#pragma FCUDA PORTMERGE remove_port_name=atom
        __shared__ DATATYPE atom[MAXATOMS * 4];
	__shared__ DATATYPE energyval[16][16];

#pragma FCUDA COMPUTE cores=[1] begin name=fetchatom unroll=1 mpart=1 array_split=[energyval]
        //int i = offset + gridDim.x *,blockDim.x * threadIdx.y + threadIdx.x;
        int i;
        i = BLOCKSIZEX * threadIdx.y + threadIdx.x;
        for(; i < MAXATOMS * 4; i += BLOCKSIZEX*BLOCKSIZEY)
	   atom[i] = atominfo[i]; 
        __syncthreads();
#pragma FCUDA COMPUTE cores=[1] end name=fetchatom unroll=1 mpart=1 array_split=[energyval]

//#pragma FCUDA TRANSFER cores=[1] type=stream dir=[0] pointer=[atomdata] local=[atominfo] size=[atombytes] rsize=[4096] begin name=atomfetch
	int offset = gridDim.x*blockDim.x*blockIdx.y*blockDim.y + blockIdx.x*blockDim.x;
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0] pointer=[energygrid_input] begin name=energyfetch size=[16] unroll=1 mpart=1 array_split=[energyval]
	energyval[threadIdx.y][threadIdx.x] = energygrid_input[offset+gridDim.x*blockDim.x*threadIdx.y + threadIdx.x];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0] pointer=[energygrid_input] end name=energyfetch size=[16] unroll=1 mpart=1 array_split=[energyval]

#pragma FCUDA COMPUTE cores=[1] begin name=blk_compute unroll=1 mpart=1 array_split=[energyval]
	unsigned int xindex  = __umul24(blockIdx.x, blockDim.x) + threadIdx.x;
	unsigned int yindex  = __umul24(blockIdx.y, blockDim.y) + threadIdx.y;
	DATATYPE coorx = gridspacing * xindex;
	DATATYPE coory = gridspacing * yindex;

	int atomid;
  	/* For each atom, compute and accumulate its contribution to energyval
  	 * for this thread's grid point */
	lp1:for (atomid=0; atomid<atombytes; atomid+=4) {
    		DATATYPE dx = coorx - atom[atomid];
    		DATATYPE dy = coory - atom[atomid+1];
    		//DATATYPE r_1 = 1.0f / sqrtf(dx*dx + dy*dy + atominfo[atomid+2]);
                DATATYPE r_1 = dx*dx + dy*dy + atom[atomid+2];
    		energyval[threadIdx.y][threadIdx.x] += atom[atomid+3] * r_1;
	}
#pragma FCUDA COMPUTE cores=[1] end name=blk_compute unroll=1 mpart=1 array_split=[energyval]

	//__syncthreads();
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[energygrid_output] begin name=write size=[16] unroll=1 mpart=1 array_split=[energyval]
        energygrid_output[offset+gridDim.x*blockDim.x*threadIdx.y + threadIdx.x] = energyval[threadIdx.y][threadIdx.x];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[energygrid_output] end name=write size=[16] unroll=1 mpart=1 array_split=[energyval]
}
