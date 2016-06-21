#include <fcuda.h>
#include <string.h>
typedef int DATATYPE;
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
temp_t[threadIdx.y][threadIdx.x]=(temp_on_cuda[threadIdx.y][threadIdx.x]+(step_div_Cap*(((power_on_cuda[threadIdx.y][threadIdx.x]+(((temp_on_cuda[S][threadIdx.x]+temp_on_cuda[N][threadIdx.x])-(2*temp_on_cuda[threadIdx.y][threadIdx.x]))*Ry_1))+(((temp_on_cuda[threadIdx.y][E]+temp_on_cuda[threadIdx.y][W])-(2*temp_on_cuda[threadIdx.y][threadIdx.x]))*Rx_1))+((amb_temp-temp_on_cuda[threadIdx.y][threadIdx.x])*Rz_1))));
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
#pragma fcuda portmerge port_id=0 remove_port_name=power 
#pragma fcuda portmerge port_id=0 remove_port_name=temp_src 
#pragma fcuda portmerge port_id=0 remove_port_name=temp_dst 
void calculate_temp(int iteration, int grid_cols, int grid_rows, int border_cols, int border_rows, DATATYPE Cap, DATATYPE Rx, DATATYPE Ry, DATATYPE Rz, DATATYPE step, DATATYPE time_elapsed, DATATYPE * memport_p0, int power_addr, int temp_src_addr, int temp_dst_addr, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
#pragma HLS interface ap_bus port=memport_p0 
#pragma HLS RESOURCE variable=memport_p0 core=AXI4M 
DATATYPE * power_block0;
DATATYPE * temp_src_block0;
DATATYPE * temp_dst_block0;
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
temp_dst_block0=( & memport_p0[temp_dst_addr]);
temp_src_block0=( & memport_p0[temp_src_addr]);
power_block0=( & memport_p0[power_addr]);
amb_temp_block0=80;
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
calculate_temp_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, blkY_block0, grid_cols, grid_rows, power_block0, power_on_cuda_ping_block0, temp_on_cuda_ping_block0, temp_src_block0);
calculate_temp_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, Rx_1_pipe_1_block0, Ry_1_pipe_1_block0, Rz_1_pipe_1_block0, amb_temp_pipe_1_block0, blkX_pipe_1_block0, blkXmax_pipe_1_block0, blkY_pipe_1_block0, blkYmax_pipe_1_block0, computed_block_ping_block0, grid_cols, grid_rows, iteration, power_on_cuda_pong_block0, step_div_Cap_pipe_1_block0, temp_on_cuda_pong_block0, temp_t_ping_block0);
calculate_temp_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, blkY_pipe_2_block0, computed_block_pong_block0, grid_cols, temp_dst_block0, temp_t_pong_block0);
pingpong_0=1;
}
else
{
calculate_temp_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, blkY_block0, grid_cols, grid_rows, power_block0, power_on_cuda_pong_block0, temp_on_cuda_pong_block0, temp_src_block0);
calculate_temp_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, Rx_1_pipe_1_block0, Ry_1_pipe_1_block0, Rz_1_pipe_1_block0, amb_temp_pipe_1_block0, blkX_pipe_1_block0, blkXmax_pipe_1_block0, blkY_pipe_1_block0, blkYmax_pipe_1_block0, computed_block_pong_block0, grid_cols, grid_rows, iteration, power_on_cuda_ping_block0, step_div_Cap_pipe_1_block0, temp_on_cuda_ping_block0, temp_t_pong_block0);
calculate_temp_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, blkY_pipe_2_block0, computed_block_ping_block0, grid_cols, temp_dst_block0, temp_t_ping_block0);
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

int main()
{
  int memport_p0[786432];
  int power_addr = 0;
  int temp_src_addr = 262144;
  int temp_dst_addr = 2 * 262144;
  int i;

  for (i = 0; i < 262144; i++) {
    memport_p0[i] = i % 16;
  }
  for (i = 262144; i < 2 * 262144; i++) {
    memport_p0[i] = i % 16;
  }
  for (i = 2 * 262144; i < 3 * 262144; i++) {
    memport_p0[i] = 0;
  }

  dim3 gridDim, blockDim;
  gridDim.x = 32;
  gridDim.y = 32;
  gridDim.z = 1;
  blockDim.x = 16;
  blockDim.y = 16;
  blockDim.z = 1;
  int iteration = 1;
  int grid_cols = 512;
  int grid_rows = 512;
  int border_cols = 1;
  int border_rows = 1;
  int Cap = 1;
  int Rx = 1;
  int Ry = 1;
  int Rz = 1;
  int step = 1;
  int time_elapsed = 1;

  for (i = 0; i < 3 * 262144; i++)
    printf("%x\n", memport_p0[i]);

  calculate_temp(iteration, grid_cols, grid_rows, border_cols, border_rows, Cap, Rx, Ry, Rz, step, time_elapsed, 
      memport_p0, power_addr, temp_src_addr, temp_dst_addr, gridDim, blockDim, 1, 0);

  //for (i = 0; i < 3 * 262144; i++)
    //printf("%x\n", memport_p0[i]);
}
