#include <fcuda.h>
#include <string.h>
typedef float DATATYPE;
const int BLOCKDIM_X_calculate_temp = 16, BLOCKDIM_Y_calculate_temp = 16;
#pragma fcuda compute array_split=[temp_t] mpart=1 name=fetch cores=[1] end=false unroll=1 begin=true 
void calculate_temp_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int blkY, int grid_cols, int grid_rows, DATATYPE * power, DATATYPE power_on_cuda[16][16], DATATYPE temp_on_cuda[16][16], DATATYPE * temp_src)
{
dim3 threadIdx;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int index;
int loadXidx;
int loadYidx;
int xidx;
int yidx;
if (enableSignal_fetch)
{
yidx=(blkY+threadIdx.y);
xidx=(blkX+threadIdx.x);
loadYidx=yidx;
loadXidx=xidx;
index=((grid_cols*loadYidx)+loadXidx);
if ((((loadYidx>=0)&&(loadYidx<=(grid_rows-1)))&&((loadXidx>=0)&&(loadXidx<=(grid_cols-1)))))
{
temp_on_cuda[threadIdx.y][threadIdx.x]=temp_src[((((grid_cols*threadIdx.y)+(grid_cols*blkY))+blkX)+threadIdx.x)];
power_on_cuda[threadIdx.y][threadIdx.x]=power[((((grid_cols*threadIdx.y)+(grid_cols*blkY))+blkX)+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[temp_t] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void calculate_temp_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE Rx_1, DATATYPE Ry_1, DATATYPE Rz_1, DATATYPE amb_temp, int blkX, int blkXmax, int blkY, int blkYmax, int computed_block[BLOCKDIM_Y_calculate_temp][BLOCKDIM_X_calculate_temp], int grid_cols, int grid_rows, int iteration, DATATYPE power_on_cuda[16][16], DATATYPE step_div_Cap, DATATYPE temp_on_cuda[16][16], DATATYPE temp_t[16][16])
{
dim3 threadIdx;
int i;
int validXmax;
int validXmin;
int validYmax;
int validYmin;
if (enableSignal_compute)
{
validYmin=((blkY<0) ? ( - blkY) : 0);
validYmax=((blkYmax>(grid_rows-1)) ? ((16-1)-((blkYmax-grid_rows)+1)) : (16-1));
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(grid_cols-1)) ? ((16-1)-((blkXmax-grid_cols)+1)) : (16-1));
i=0;
while (i<iteration)
{
int N;
int S;
int W;
int E;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
N=(threadIdx.y-1);
S=(threadIdx.y+1);
W=(threadIdx.x-1);
E=(threadIdx.x+1);
N=((N<validYmin) ? validYmin : N);
S=((S>validYmax) ? validYmax : S);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.y][threadIdx.x]=0;
if ((((((threadIdx.x>=(i+1))&&(threadIdx.x<=((16-i)-2)))&&((threadIdx.y>=(i+1))&&(threadIdx.y<=((16-i)-2))))&&((threadIdx.x>=validXmin)&&(threadIdx.x<=validXmax)))&&((threadIdx.y>=validYmin)&&(threadIdx.y<=validYmax))))
{
computed_block[threadIdx.y][threadIdx.x]=1;
temp_t[threadIdx.y][threadIdx.x]=(temp_on_cuda[threadIdx.y][threadIdx.x]+(step_div_Cap*(((power_on_cuda[threadIdx.y][threadIdx.x]+(((temp_on_cuda[S][threadIdx.x]+temp_on_cuda[N][threadIdx.x])-(2.0*temp_on_cuda[threadIdx.y][threadIdx.x]))*Ry_1))+(((temp_on_cuda[threadIdx.y][E]+temp_on_cuda[threadIdx.y][W])-(2.0*temp_on_cuda[threadIdx.y][threadIdx.x]))*Rx_1))+((amb_temp-temp_on_cuda[threadIdx.y][threadIdx.x])*Rz_1))));
}
}
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.y][threadIdx.x])
{
temp_on_cuda[threadIdx.y][threadIdx.x]=temp_t[threadIdx.y][threadIdx.x];
}
}
i ++ ;
}
}
}

#pragma fcuda compute array_split=[temp_t] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void calculate_temp_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int blkY, int computed_block[BLOCKDIM_Y_calculate_temp][BLOCKDIM_X_calculate_temp], int grid_cols, DATATYPE * temp_dst, DATATYPE temp_t[16][16])
{
dim3 threadIdx;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.y][threadIdx.x])
{
temp_dst[((((grid_cols*threadIdx.y)+(grid_cols*blkY))+blkX)+threadIdx.x)]=temp_t[threadIdx.y][threadIdx.x];
}
}
}
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
void calculate_temp(int iteration, DATATYPE * power, DATATYPE * temp_src, DATATYPE * temp_dst, int grid_cols, int grid_rows, int border_cols, int border_rows, DATATYPE Cap, DATATYPE Rx, DATATYPE Ry, DATATYPE Rz, DATATYPE step, DATATYPE time_elapsed, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
DATATYPE amb_temp_block0;
DATATYPE step_div_Cap_block0;
DATATYPE Rx_1_block0;
DATATYPE Ry_1_block0;
DATATYPE Rz_1_block0;
int small_block_rows_block0;
int small_block_cols_block0;
int blkY_block0;
int blkX_block0;
int blkYmax_block0;
int blkXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
DATATYPE power_on_cuda_ping_block0[16][16];
DATATYPE temp_on_cuda_ping_block0[16][16];
int computed_block_ping_block0[BLOCKDIM_Y_calculate_temp][BLOCKDIM_X_calculate_temp];
DATATYPE power_on_cuda_pong_block0[16][16];
DATATYPE temp_on_cuda_pong_block0[16][16];
DATATYPE temp_t_ping_block0[16][16];
int computed_block_pong_block0[BLOCKDIM_Y_calculate_temp][BLOCKDIM_X_calculate_temp];
DATATYPE temp_t_pong_block0[16][16];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
DATATYPE Rz_1_pipe_1_block0;
int enableSignal_compute_pipe_1_block0;
DATATYPE amb_temp_pipe_1_block0;
DATATYPE Rx_1_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
DATATYPE step_div_Cap_pipe_1_block0;
int blkYmax_pipe_1_block0;
int blkY_pipe_1_block0;
int blkY_pipe_2_block0;
int blkXmax_pipe_1_block0;
DATATYPE Ry_1_pipe_1_block0;
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
amb_temp_block0=80.0;
step_div_Cap_block0=(step/Cap);
Rx_1_block0=(1/Rx);
Ry_1_block0=(1/Ry);
Rz_1_block0=(1/Rz);
small_block_rows_block0=(16-(iteration*2));
small_block_cols_block0=(16-(iteration*2));
blkY_block0=((small_block_rows_block0*blockIdx_block0.y)-border_rows);
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border_cols);
blkYmax_block0=((blkY_block0+16)-1);
blkXmax_block0=((blkX_block0+16)-1);
#pragma fcuda compute array_split=[temp_t] mpart=1 name=fetch unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[temp_t] mpart=1 name=fetch unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[temp_t] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[temp_t] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[temp_t] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
calculate_temp_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, blkY_block0, grid_cols, grid_rows, power, power_on_cuda_ping_block0, temp_on_cuda_ping_block0, temp_src);
calculate_temp_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, Rx_1_pipe_1_block0, Ry_1_pipe_1_block0, Rz_1_pipe_1_block0, amb_temp_pipe_1_block0, blkX_pipe_1_block0, blkXmax_pipe_1_block0, blkY_pipe_1_block0, blkYmax_pipe_1_block0, computed_block_ping_block0, grid_cols, grid_rows, iteration, power_on_cuda_pong_block0, step_div_Cap_pipe_1_block0, temp_on_cuda_pong_block0, temp_t_ping_block0);
calculate_temp_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, blkY_pipe_2_block0, computed_block_pong_block0, grid_cols, temp_dst, temp_t_pong_block0);
pingpong_0=1;
}
else
{
calculate_temp_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, blkY_block0, grid_cols, grid_rows, power, power_on_cuda_pong_block0, temp_on_cuda_pong_block0, temp_src);
calculate_temp_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, Rx_1_pipe_1_block0, Ry_1_pipe_1_block0, Rz_1_pipe_1_block0, amb_temp_pipe_1_block0, blkX_pipe_1_block0, blkXmax_pipe_1_block0, blkY_pipe_1_block0, blkYmax_pipe_1_block0, computed_block_pong_block0, grid_cols, grid_rows, iteration, power_on_cuda_ping_block0, step_div_Cap_pipe_1_block0, temp_on_cuda_ping_block0, temp_t_pong_block0);
calculate_temp_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, blkY_pipe_2_block0, computed_block_ping_block0, grid_cols, temp_dst, temp_t_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
Rz_1_pipe_1_block0=Rz_1_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
amb_temp_pipe_1_block0=amb_temp_block0;
Rx_1_pipe_1_block0=Rx_1_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
step_div_Cap_pipe_1_block0=step_div_Cap_block0;
blkYmax_pipe_1_block0=blkYmax_block0;
blkY_pipe_2_block0=blkY_pipe_1_block0;
blkY_pipe_1_block0=blkY_block0;
blkXmax_pipe_1_block0=blkXmax_block0;
Ry_1_pipe_1_block0=Ry_1_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[temp_t] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=power_addr remove_port_name=power_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=temp_src_addr remove_port_name=temp_src_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=temp_dst_addr remove_port_name=temp_dst_core0 port_core=0 
void fcuda1(int iteration, int power_addr, int temp_src_addr, int temp_dst_addr, int grid_cols, int grid_rows, int border_cols, int border_rows, DATATYPE Cap, DATATYPE Rx, DATATYPE Ry, DATATYPE Rz, DATATYPE step, DATATYPE time_elapsed, dim3 gridDim, dim3 blockDim, DATATYPE * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=iteration 
#pragma HLS RESOURCE core=AXI4LiteS variable=iteration 
#pragma HLS INTERFACE ap_none register port=power_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=power_addr 
#pragma HLS INTERFACE ap_none register port=temp_src_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=temp_src_addr 
#pragma HLS INTERFACE ap_none register port=temp_dst_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=temp_dst_addr 
#pragma HLS INTERFACE ap_none register port=grid_cols 
#pragma HLS RESOURCE core=AXI4LiteS variable=grid_cols 
#pragma HLS INTERFACE ap_none register port=grid_rows 
#pragma HLS RESOURCE core=AXI4LiteS variable=grid_rows 
#pragma HLS INTERFACE ap_none register port=border_cols 
#pragma HLS RESOURCE core=AXI4LiteS variable=border_cols 
#pragma HLS INTERFACE ap_none register port=border_rows 
#pragma HLS RESOURCE core=AXI4LiteS variable=border_rows 
#pragma HLS INTERFACE ap_none register port=Cap 
#pragma HLS RESOURCE core=AXI4LiteS variable=Cap 
#pragma HLS INTERFACE ap_none register port=Rx 
#pragma HLS RESOURCE core=AXI4LiteS variable=Rx 
#pragma HLS INTERFACE ap_none register port=Ry 
#pragma HLS RESOURCE core=AXI4LiteS variable=Ry 
#pragma HLS INTERFACE ap_none register port=Rz 
#pragma HLS RESOURCE core=AXI4LiteS variable=Rz 
#pragma HLS INTERFACE ap_none register port=step 
#pragma HLS RESOURCE core=AXI4LiteS variable=step 
#pragma HLS INTERFACE ap_none register port=time_elapsed 
#pragma HLS RESOURCE core=AXI4LiteS variable=time_elapsed 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
DATATYPE * temp_src_core0;
DATATYPE * temp_dst_core0;
DATATYPE * power_core0;
temp_dst_core0=( & memport_core0_p0[temp_dst_addr]);
temp_src_core0=( & memport_core0_p0[temp_src_addr]);
power_core0=( & memport_core0_p0[power_addr]);
calculate_temp(iteration, power_core0, temp_src_core0, temp_dst_core0, grid_cols, grid_rows, border_cols, border_rows, Cap, Rx, Ry, Rz, step, time_elapsed, gridDim, blockDim, 1, 0);
}

void fcuda(int iteration, int power_addr, int temp_src_addr, int temp_dst_addr, int grid_cols, int grid_rows, int border_cols, int border_rows, DATATYPE Cap, DATATYPE Rx, DATATYPE Ry, DATATYPE Rz, DATATYPE step, DATATYPE time_elapsed, dim3 gridDim, dim3 blockDim, DATATYPE * memport_core0_p0_DATATYPE, int en_fcuda1)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(iteration, power_addr, temp_src_addr, temp_dst_addr, grid_cols, grid_rows, border_cols, border_rows, Cap, Rx, Ry, Rz, step, time_elapsed, gridDim, blockDim, memport_core0_p0_DATATYPE);
}
}

