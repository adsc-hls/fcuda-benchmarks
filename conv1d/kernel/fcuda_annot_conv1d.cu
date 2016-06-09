/* 1d convolution
 * Device code.
 */

#include <fcuda.h>
#include <stdio.h>


#define X_DIM 16
#define Y_DIM 16
// 6 in either direction
#define CONV_DIM 6

#define X_TILE_DIM 16 + CONV_DIM+CONV_DIM
#define Y_TILE_DIM 16

int kernel[13] = {1,2,3,4,5,6,7,6,5,4,3,2,1};
#define KERNEL_NORM  (2*(1 + 2 + 3 + 4 + 5 + 6) + 7)

// vals = {1,2,3,4,5,6,7,6,5,4,3,2,1};
// [0->5] [ 6 -> 21 ] [22->27]

#pragma FCUDA GRID x_dim=28 y_dim=16
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=A port_id=0 //offset=0
#pragma FCUDA PORTMERGE remove_port_name=B port_id=0 //offset=GRID_X*GRID_Y
__global__ void
conv1d (int * A, int * B) {

#pragma FCUDA COMPUTE begin name=compute
  //#pragma FCUDA PORTMERGE remove_port_name=local_tile_with_halo
  __shared__ int local_tile_with_halo[Y_TILE_DIM][X_TILE_DIM];


  int tx,ty,bx,by,gx,gy;
  tx = threadIdx.x;
  ty = threadIdx.y;

  bx = blockIdx.x;
  by = blockIdx.y;
  
  gx=gridDim.x;
  gy=gridDim.y;

  // input location within tile: what should this tile read?
  int x_tile_idx_in ; 
  int x_tile_blk_in = bx;

  // need to set input memory location based on halos
  if (tx >= X_DIM + CONV_DIM)  {
    x_tile_idx_in = tx  - CONV_DIM - X_DIM;
    x_tile_blk_in = bx + 1 >= gx ? 0 : bx + 1;
  } else if (tx < CONV_DIM){
    x_tile_idx_in = tx  - CONV_DIM + X_DIM;
    x_tile_blk_in = bx < 1 ? gx - 1 : bx -1;
  } else {
    x_tile_idx_in = tx - CONV_DIM;
    x_tile_blk_in = bx;
  }

  /*
  if ( x_tile_blk_in < 0) {
    x_tile_blk_in = gx - 1;
  } 
  */

  /*
  if ( x_tile_blk_in < 0) {
    x_tile_blk_in = gx - 1;
  } 
  */
  /*
  else if ( x_tile_blk_in >= gx ) {
    x_tile_blk_in = 0;
  }
  */
  

  int y_tile_idx_in = ty;
  int y_tile_blk_in = by;

  // input memory location
  int x_mem_idx_in = x_tile_idx_in + x_tile_blk_in * X_DIM;
  int y_mem_idx_in = y_tile_idx_in + y_tile_blk_in * Y_DIM;

  int input_addr = y_mem_idx_in * ( gx * X_DIM ) + x_mem_idx_in;


  // output location
  int x_tile_idx_out = tx - CONV_DIM;
  int y_tile_idx_out = ty;

  // output location 
  int x_mem_idx_out = x_tile_idx_out + X_DIM * bx;
  int y_mem_idx_out = y_tile_idx_out + Y_DIM * by;

  // output location address
  int output_addr = y_mem_idx_out  * (gx * X_DIM) + x_mem_idx_out;



  local_tile_with_halo[ty][tx]  = A[input_addr];

  __syncthreads();

  // [ 0 1 2 3 4] 
  // [-2-1 0 1 2 3 4 5 6 7 8]


  int i, j;

  if (x_tile_idx_out >= 0 && x_tile_idx_out < X_DIM && y_tile_idx_out >= 0 && y_tile_idx_out < Y_DIM ) {
  int result = 0;

    for (j = 0; j < CONV_DIM * 2 + 1; j++) {
      result += kernel[j] * local_tile_with_halo[ty][x_tile_idx_out + j];
    }
    B[output_addr] = result / KERNEL_NORM;
  }
#pragma FCUDA COMPUTE end name=compute
}
