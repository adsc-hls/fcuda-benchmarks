/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/

#include <stdio.h>
//#include "cuenergy.h"
#include <fcuda.h>
#include <math.h>
#include <string.h>
/* Size of a thread block */
#define BLOCKSIZEX 16
#define BLOCKSIZEY 16

/* Number of grid points processed by a thread */
#define UNROLLX 1

/* Number of atoms processed by a kernel */
#define MAXATOMS 128

/* Size of the benchmark problem.  The GPU can run larger problems in a
 * reasonable time.
 *
 * For VOLSIZEX, VOLSIZEY, size 1024 is suitable for a few seconds of
 * GPU computation and size 128 is suitable for a few seconds of
 * CPU computation.
 *
 * For ATOMCOUNT, 100000 is suitable for GPU computation and 10000 is
 * suitable for CPU computation.
 */
#define VOLSIZEX 128
#define VOLSIZEY 128
#define ATOMCOUNT 1024
//typedef float DATATYPE;
typedef int DATATYPE;

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

#pragma FCUDA GRID x_dim=16 y_dim=16
#pragma FCUDA PORTMERGE remove_port_name=atomdata port_id=0
#pragma FCUDA PORTMERGE remove_port_name=energygrid port_id=0
__global__ void cenergy(int numatoms, DATATYPE gridspacing, DATATYPE *energygrid) {

	int atombytes = numatoms*4;
#pragma FCUDA TRANSFER cores=[1] type=stream dir=[0] pointer=[atomdata] local=[atominfo] size=[atombytes] rsize=[4096] begin name=atomfetch unroll=1 mpart=1 array_split=[energyval]
	__shared__ DATATYPE energyval[16][16], energyval1[16][16];
	int offset = gridDim.x*blockDim.x*blockIdx.y*blockDim.y + blockIdx.x*blockDim.x;
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0] pointer=[energygrid] begin name=energyfetch size=[16] unroll=1 mpart=1 array_split=[energyval]
	energyval[threadIdx.y][threadIdx.x] = energygrid[offset+gridDim.x*blockDim.x*threadIdx.y + threadIdx.x];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0] pointer=[energygrid] end name=energyfetch size=[16] unroll=1 mpart=1 array_split=[energyval]

#pragma FCUDA COMPUTE cores=[1] begin name=blk_compute unroll=1 mpart=1 array_split=[energyval] //shared=[atominfo] non_shared=[energyval] bram_core=[132|24|20|256]
	unsigned int xindex  = __umul24(blockIdx.x, blockDim.x) + threadIdx.x;
	unsigned int yindex  = __umul24(blockIdx.y, blockDim.y) + threadIdx.y;
	DATATYPE coorx = gridspacing * xindex;
	DATATYPE coory = gridspacing * yindex;

	int atomid;
  	/* For each atom, compute and accumulate its contribution to energyval
  	 * for this thread's grid point */
	lp1:for (atomid=0; atomid<atombytes; atomid+=4) {
    		DATATYPE dx = coorx - atominfo[atomid];
    		DATATYPE dy = coory - atominfo[atomid+1];
    		//DATATYPE r_1 = 1.0f / sqrtf(dx*dx + dy*dy + atominfo[atomid+2]);
                DATATYPE r_1 = dx*dx + dy*dy + atominfo[atomid+2];
    		energyval[threadIdx.y][threadIdx.x] += atominfo[atomid+3] * r_1;
  	}
        energyval1[threadIdx.y][threadIdx.x] = energyval[threadIdx.y][threadIdx.x];
#pragma FCUDA COMPUTE cores=[1] end name=blk_compute unroll=1 mpart=1 array_split=[energyval] //shared=[atominfo] non_shared=[energyval] bram_core=[132|84|80|256]

#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[energygrid] begin name=write size=[16] unroll=1 mpart=1 array_split=[energyval]
	energygrid[offset+gridDim.x*blockDim.x*threadIdx.y + threadIdx.x] = energyval1[threadIdx.y][threadIdx.x];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[1] pointer=[energygrid] end name=write size=[16] unroll=1 mpart=1 array_split=[energyval]


}
