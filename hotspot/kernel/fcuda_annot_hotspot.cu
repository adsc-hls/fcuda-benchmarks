#include <fcuda.h>
#include <string.h>
typedef float DATATYPE;
#define IN_RANGE(x, min, max)   ((x)>=(min) && (x)<=(max))
#define CLAMP_RANGE(x, min, max) x = (x<(min)) ? min : ((x>(max)) ? max : x )
#define MIN(a, b) ((a)<=(b) ? (a) : (b))
#define BLOCK_SIZE 16
#pragma FCUDA GRID x_dim=16 y_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=yes
#pragma FCUDA PORTMERGE remove_port_name=power port_id=0
#pragma FCUDA PORTMERGE remove_port_name=temp_src port_id=0
#pragma FCUDA PORTMERGE remove_port_name=temp_dst port_id=0
__global__ void calculate_temp(int iteration,  			// number of iteration
    DATATYPE *power,   		// power input
    DATATYPE *temp_src, 		// temperature input/output
    DATATYPE *temp_dst,  		// temperature input/output
    int grid_cols,  			// Col of grid
    int grid_rows,  			// Row of grid
    int border_cols,  		// border offset
    int border_rows,  		// border offset
    DATATYPE Cap,      		// Capacitance
    DATATYPE Rx,
    DATATYPE Ry,
    DATATYPE Rz,
    DATATYPE step,
    DATATYPE time_elapsed){

  __shared__ DATATYPE temp_on_cuda[BLOCK_SIZE][BLOCK_SIZE];
  __shared__ DATATYPE power_on_cuda[BLOCK_SIZE][BLOCK_SIZE];
  __shared__ DATATYPE temp_t[BLOCK_SIZE][BLOCK_SIZE]; // saving temporary temperature result

  DATATYPE amb_temp = 80.0;
  DATATYPE step_div_Cap;
  DATATYPE Rx_1,Ry_1,Rz_1;

  int bx = blockIdx.x;
  int by = blockIdx.y;
  int tx=threadIdx.x;
  int ty=threadIdx.y;

  step_div_Cap=step/Cap;

  Rx_1=1/Rx;
  Ry_1=1/Ry;
  Rz_1=1/Rz;

  // each block finally computes result for a small block
  // after N iterations.
  // it is the non-overlapping small blocks that cover
  // all the input data

  // calculate the small block size
  int small_block_rows = BLOCK_SIZE-iteration*2;//EXPAND_RATE
  int small_block_cols = BLOCK_SIZE-iteration*2;//EXPAND_RATE

  // calculate the boundary for the block according to
  // the boundary of its small block
  int blkY = small_block_rows*by-border_rows;
  int blkX = small_block_cols*bx-border_cols;
  int blkYmax = blkY+BLOCK_SIZE-1;
  int blkXmax = blkX+BLOCK_SIZE-1;

#pragma FCUDA COMPUTE cores=[1] begin name=fetch unroll=1 mpart=1 array_split=[temp_t]
  // calculate the global thread coordination
  int yidx = blkY+ty;
  int xidx = blkX+tx;
  // load data if it is within the valid input range
  int loadYidx=yidx, loadXidx=xidx;
  int index = grid_cols*loadYidx+loadXidx;

  if(IN_RANGE(loadYidx, 0, grid_rows-1) && IN_RANGE(loadXidx, 0, grid_cols-1)) {
    temp_on_cuda[ty][tx] = temp_src[grid_cols*ty + grid_cols*blkY + blkX + tx]; // Load the temperature data from global memory to shared memory
    power_on_cuda[ty][tx] = power[grid_cols*ty + grid_cols*blkY + blkX + tx]; // Load the power data from global memory to shared memory
  }
#pragma FCUDA COMPUTE cores=[1] end name=fetch unroll=1 mpart=1 array_split=[temp_t]
  __syncthreads();

#pragma FCUDA COMPUTE cores=[1] begin name=compute unroll=1 mpart=1 array_split=[temp_t]
  // effective range within this block that falls within
  // the valid range of the input data
  // used to rule out computation outside the boundary.
  int validYmin = (blkY < 0) ? -blkY : 0;
  int validYmax = (blkYmax > grid_rows-1) ? BLOCK_SIZE-1-(blkYmax-grid_rows+1) : BLOCK_SIZE-1;
  int validXmin = (blkX < 0) ? -blkX : 0;
  int validXmax = (blkXmax > grid_cols-1) ? BLOCK_SIZE-1-(blkXmax-grid_cols+1) : BLOCK_SIZE-1;

  /*
     int N = ty-1;
     int S = ty+1;
     int W = tx-1;
     int E = tx+1;
     N = (N < validYmin) ? validYmin : N;
     S = (S > validYmax) ? validYmax : S;
     W = (W < validXmin) ? validXmin : W;
     E = (E > validXmax) ? validXmax : E;
   */

  //bool computed;
  int i, computed;
  for (i=0; i<iteration ; i++){
    int N = ty-1;
    int S = ty+1;
    int W = tx-1;
    int E = tx+1;

    N = (N < validYmin) ? validYmin : N;
    S = (S > validYmax) ? validYmax : S;
    W = (W < validXmin) ? validXmin : W;
    E = (E > validXmax) ? validXmax : E;

    computed = 0;
    if(IN_RANGE(tx, i+1, BLOCK_SIZE-i-2) &&  \
        IN_RANGE(ty, i+1, BLOCK_SIZE-i-2) &&  \
        IN_RANGE(tx, validXmin, validXmax) && \
        IN_RANGE(ty, validYmin, validYmax)) {
      computed = 1;
      temp_t[ty][tx] =   temp_on_cuda[ty][tx] + step_div_Cap * (power_on_cuda[ty][tx] +
          (temp_on_cuda[S][tx] + temp_on_cuda[N][tx] - 2.0*temp_on_cuda[ty][tx]) * Ry_1 +
          (temp_on_cuda[ty][E] + temp_on_cuda[ty][W] - 2.0*temp_on_cuda[ty][tx]) * Rx_1 +
          (amb_temp - temp_on_cuda[ty][tx]) * Rz_1);
    }
    __syncthreads();

    if(i==iteration-1)
      break;

    if(computed)         //Assign the computation range
      temp_on_cuda[ty][tx]= temp_t[ty][tx];
    __syncthreads();
  }

#pragma FCUDA COMPUTE cores=[1] end name=compute unroll=1 mpart=1 array_split=[temp_t]

  // update the global memory
  // after the last iteration, only threads coordinated within the
  // small block perform the calculation and switch on ``computed''

#pragma FCUDA COMPUTE cores=[1] begin name=write unroll=1 mpart=1 array_split=[temp_t]
  if (computed)
    temp_dst[grid_cols*ty + grid_cols*blkY + blkX + tx] = temp_t[ty][tx];
#pragma FCUDA COMPUTE cores=[1] end name=write unroll=1 mpart=1 array_split=[temp_t]

}


