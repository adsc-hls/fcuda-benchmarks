#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, int prev[256])
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, int prev[256], int result[256], int startStep, int validXmax, int validXmin)
{
dim3 threadIdx;
int i;
if (enableSignal_compute)
{
i=0;
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
i ++ ;
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, int result[256])
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
int prev_ping_block0[256];
int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
int prev_pong_block0[256];
int result_ping_block0[256];
int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=gpuWall_addr remove_port_name=gpuWall_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=gpuSrc_addr remove_port_name=gpuSrc_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=gpuResults_addr remove_port_name=gpuResults_core0 port_core=0 
void fcuda1(int iteration, int gpuWall_addr, int gpuSrc_addr, int gpuResults_addr, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=iteration 
#pragma HLS RESOURCE core=AXI4LiteS variable=iteration 
#pragma HLS INTERFACE ap_none register port=gpuWall_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=gpuWall_addr 
#pragma HLS INTERFACE ap_none register port=gpuSrc_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=gpuSrc_addr 
#pragma HLS INTERFACE ap_none register port=gpuResults_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=gpuResults_addr 
#pragma HLS INTERFACE ap_none register port=cols 
#pragma HLS RESOURCE core=AXI4LiteS variable=cols 
#pragma HLS INTERFACE ap_none register port=rows 
#pragma HLS RESOURCE core=AXI4LiteS variable=rows 
#pragma HLS INTERFACE ap_none register port=startStep 
#pragma HLS RESOURCE core=AXI4LiteS variable=startStep 
#pragma HLS INTERFACE ap_none register port=border 
#pragma HLS RESOURCE core=AXI4LiteS variable=border 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
int * gpuSrc_core0;
int * gpuResults_core0;
int * gpuWall_core0;
gpuResults_core0=( & memport_core0_p0[gpuResults_addr]);
gpuSrc_core0=( & memport_core0_p0[gpuSrc_addr]);
gpuWall_core0=( & memport_core0_p0[gpuWall_addr]);
dynproc_kernel(iteration, gpuWall_core0, gpuSrc_core0, gpuResults_core0, cols, rows, startStep, border, gridDim, blockDim, 1, 0);
}

void fcuda(int iteration, int gpuWall_addr, int gpuSrc_addr, int gpuResults_addr, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int * memport_core0_p0_int, int en_fcuda1)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(iteration, gpuWall_addr, gpuSrc_addr, gpuResults_addr, cols, rows, startStep, border, gridDim, blockDim, memport_core0_p0_int);
}
}

