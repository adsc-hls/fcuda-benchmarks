#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"

#define IN_RANGE(x, min, max)   ((x)>=(min) && (x)<=(max))
#define CLAMP_RANGE(x, min, max) x = (x<(min)) ? min : ((x>(max)) ? max : x )
#define MIN(a, b) ((a)<=(b) ? (a) : (b))
#define BLOCK_SIZE 256
#define HALO 1

#pragma FCUDA GRID x_dim=256
#pragma FCUDA COREINFO num_cores=1 pipeline=yes
#pragma FCUDA PORTMERGE remove_port_name=gpuWall port_id=0
#pragma FCUDA PORTMERGE remove_port_name=gpuSrc port_id=0
#pragma FCUDA PORTMERGE remove_port_name=gpuResults port_id=0
__global__ void dynproc_kernel(
    int iteration,
    DATATYPE *gpuWall,
    DATATYPE *gpuSrc,
    DATATYPE *gpuResults,
    int cols,
    int rows,
    int startStep,
    int border)
{
  __shared__ DATATYPE prev[BLOCK_SIZE];
  __shared__ DATATYPE result[BLOCK_SIZE];
  int bx = blockIdx.x;
  int tx=threadIdx.x;

  // each block finally computes result for a small block
  // after N iterations.
  // it is the non-overlapping small blocks that cover
  // all the input data

  // calculate the small block size
  int small_block_cols = BLOCK_SIZE-iteration*HALO*2;

  // calculate the boundary for the block according to
  // the boundary of its small block
  int blkX = small_block_cols*bx-border;
  int blkXmax = blkX+BLOCK_SIZE-1;

  // calculate the global thread coordination
  //int xidx = blkX+tx;

  // effective range within this block that falls within
  // the valid range of the input data
  // used to rule out computation outside the boundary.
  /*
     int validXmin = (blkX < 0) ? -blkX : 0;
     int validXmax = (blkXmax > cols-1) ? BLOCK_SIZE-1-(blkXmax-cols+1) : BLOCK_SIZE-1;

     int W = tx-1;
     int E = tx+1;

     W = (W < validXmin) ? validXmin : W;
     E = (E > validXmax) ? validXmax : E;

     bool isValid = IN_RANGE(tx, validXmin, validXmax);
   */
  // if(IN_RANGE(xidx, 0, cols-1)) {
#pragma FCUDA COMPUTE begin name=fetch cores=[1] unroll=1 mpart=1 array_split=[result]
  if(IN_RANGE(blkX + (int)tx, 0, cols-1)){
    prev[tx] = gpuSrc[blkX + tx];
  }
#pragma FCUDA COMPUTE end name=fetch cores=[1] unroll=1 mpart=1 array_split=[result]
  __syncthreads(); // [Ronny] Added sync to avoid race on prev Aug. 14 2012

  int validXmin = (blkX < 0) ? -blkX : 0;
  int validXmax = (blkXmax > cols-1) ? BLOCK_SIZE-1-(blkXmax-cols+1) : BLOCK_SIZE-1;

#pragma FCUDA COMPUTE cores=[1] begin name=compute unroll=1 mpart=1 array_split=[result]
  int i, computed;
  for (i=0; i<iteration ; i++)
  {

    int xidx = blkX+tx;
    int isValid = IN_RANGE((int)tx, validXmin, validXmax);
    int W = tx-1;
    int E = tx+1;
    W = (W < validXmin) ? validXmin : W;
    E = (E > validXmax) ? validXmax : E;
    computed = 0;

    if(IN_RANGE((int)tx, i+1, BLOCK_SIZE-i-2) && isValid) {
      computed = 1;
      DATATYPE left = prev[W];
      DATATYPE up = prev[tx];
      DATATYPE right = prev[E];
      DATATYPE shortest = MIN(left, up);
      shortest = MIN(shortest, right);
      int index = cols*(startStep+i)+xidx;
      result[tx] = shortest + gpuWall[index];
    }
    __syncthreads();

    if(i==iteration-1)
      break;

    if(computed)     //Assign the computation range
      prev[tx]= result[tx];
    __syncthreads(); // [Ronny] Added sync to avoid race on prev Aug. 14 2012
  }
#pragma FCUDA COMPUTE cores=[1] end name=compute unroll=1 mpart=1 array_split=[result]

  // update the global memory
  // after the last iteration, only threads coordinated within the
  // small block perform the calculation and switch on ``computed''
#pragma FCUDA COMPUTE cores=[1] begin name=write unroll=1 mpart=1 array_split=[result]
  if (computed) {
    gpuResults[blkX + tx]=result[tx];
  }
#pragma FCUDA COMPUTE cores=[1] end name=write unroll=1 mpart=1 array_split=[result]
}

