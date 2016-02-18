#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, int temp[(16+1)][(16+1)])
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp)
{
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
}
}
}

#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, int temp[(16+1)][(16+1)])
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_temp)
{
{
memcpy((fetch_temp_temp_offset+temp[0]), ((fetch_temp_temp_X_0+matrix_cuda)+(threadIdx.y*fetch_temp_temp_c_1)), (16*sizeof (int)));
}
}
}

#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, int ref[16][16], int temp[(16+1)][(16+1)])
{
dim3 threadIdx;
int m;
if (enableSignal_compute)
{
m=0;
while (m<16)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
m ++ ;
}
m=(16-2);
while (m>=0)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
m -- ;
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_ref)
{
{
memcpy((fetch_ref_ref_offset+ref[ty]), ((fetch_ref_ref_X_0+referrence)+(threadIdx.y*fetch_ref_ref_c_1)), (16*sizeof (int)));
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_write)
{
{
memcpy(((matrix_cuda+write_temp_X_0)+(threadIdx.y*write_temp_c_1)), (write_temp_offset+temp[(1+ty)]), (16*sizeof (int)));
}
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
int temp_block0[(16+1)][(16+1)];
int ref_block0[16][16];
int ty_block0;
int enableSignal_init_temp_block0;
int enableSignal_fetch_ref_block0;
int fetch_ref_ref_offset_block0;
int fetch_ref_ref_X_0_block0;
int fetch_ref_ref_c_1_block0;
int enableSignal_init_temp2_block0;
int enableSignal_fetch_temp_block0;
int fetch_temp_temp_offset_block0;
int fetch_temp_temp_X_0_block0;
int fetch_temp_temp_c_1_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
int write_temp_offset_block0;
int write_temp_X_0_block0;
int write_temp_c_1_block0;
dim3 blockIdx_block0;
int whileLoopGuard_0_block0;
int whileLoopGuard_1_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=gridDim.y))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_temp_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_init_temp2_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_ref_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_init_temp_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
b_index_y_block0=((i-1)-blockIdx_block0.x);
index_block0=((((cols*16)*b_index_y_block0)+(16*blockIdx_block0.x))+(cols+1));
index_n_block0=((((cols*16)*b_index_y_block0)+(16*blockIdx_block0.x))+1);
index_w_block0=((((cols*16)*b_index_y_block0)+(16*blockIdx_block0.x))+cols);
index_nw_block0=(((cols*16)*b_index_y_block0)+(16*blockIdx_block0.x));
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp 
needle_cuda_shared_1_init_temp(enableSignal_init_temp_block0, blockDim, gridDim, blockIdx_block0, index_nw_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp 
whileLoopGuard_0_block0=1;
ty_block0=0;
while (1)
{
whileLoopGuard_0_block0&=ty_block0<16;
if (( ! whileLoopGuard_0_block0))
{
break;
}
if (whileLoopGuard_0_block0)
{
fetch_ref_ref_offset_block0=0;
fetch_ref_ref_X_0_block0=(index_block0+(cols*ty_block0));
fetch_ref_ref_c_1_block0=0;
}
needle_cuda_shared_1_fetch_ref((enableSignal_fetch_ref_block0&&whileLoopGuard_0_block0), blockDim, gridDim, referrence, ref_block0, fetch_ref_ref_offset_block0, ty_block0, fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0);
if (whileLoopGuard_0_block0)
{
ty_block0 ++ ;
}
}
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp2 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2_block0, blockDim, gridDim, blockIdx_block0, cols, index_w_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp2 
fetch_temp_temp_offset_block0=1;
fetch_temp_temp_X_0_block0=index_n_block0;
fetch_temp_temp_c_1_block0=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst cores=[1] end=false size=[16] begin=true 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, matrix_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst cores=[1] end=true size=[16] begin=false 
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 cores=[1] end=false begin=true 
needle_cuda_shared_1_compute(enableSignal_compute_block0, blockDim, gridDim, blockIdx_block0, penalty, ref_block0, temp_block0);
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 cores=[1] end=true begin=false 
whileLoopGuard_1_block0=1;
ty_block0=0;
while (1)
{
whileLoopGuard_1_block0&=ty_block0<16;
if (( ! whileLoopGuard_1_block0))
{
break;
}
if (whileLoopGuard_1_block0)
{
write_temp_offset_block0=1;
write_temp_X_0_block0=(index_block0+(cols*ty_block0));
write_temp_c_1_block0=0;
}
needle_cuda_shared_1_write((enableSignal_write_block0&&whileLoopGuard_1_block0), blockDim, gridDim, matrix_cuda, temp_block0, write_temp_offset_block0, ty_block0, write_temp_X_0_block0, write_temp_c_1_block0);
if (whileLoopGuard_1_block0)
{
ty_block0 ++ ;
}
}
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
void fcuda1(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=referrence_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=referrence_addr 
#pragma HLS INTERFACE ap_none register port=matrix_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=matrix_cuda_addr 
#pragma HLS INTERFACE ap_none register port=cols 
#pragma HLS RESOURCE core=AXI4LiteS variable=cols 
#pragma HLS INTERFACE ap_none register port=penalty 
#pragma HLS RESOURCE core=AXI4LiteS variable=penalty 
#pragma HLS INTERFACE ap_none register port=i 
#pragma HLS RESOURCE core=AXI4LiteS variable=i 
#pragma HLS INTERFACE ap_none register port=block_width 
#pragma HLS RESOURCE core=AXI4LiteS variable=block_width 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
int * matrix_cuda_core0;
int * referrence_core0;
matrix_cuda_core0=( & memport_core0_p0[matrix_cuda_addr]);
referrence_core0=( & memport_core0_p0[referrence_addr]);
needle_cuda_shared_1(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, int temp[(16+1)][(16+1)])
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp)
{
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
}
}
}

#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, int temp[(16+1)][(16+1)])
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_temp)
{
{
memcpy((fetch_temp_temp_offset+temp[0]), ((fetch_temp_temp_X_0+matrix_cuda)+(threadIdx.y*fetch_temp_temp_c_1)), (16*sizeof (int)));
}
}
}

#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, int ref[16][16], int temp[(16+1)][(16+1)])
{
dim3 threadIdx;
int m;
if (enableSignal_compute)
{
m=0;
while (m<16)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
m ++ ;
}
m=(16-2);
while (m>=0)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
m -- ;
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_ref)
{
{
memcpy((fetch_ref_ref_offset+ref[ty]), ((fetch_ref_ref_X_0+referrence)+(threadIdx.y*fetch_ref_ref_c_1)), (16*sizeof (int)));
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_write)
{
{
memcpy(((matrix_cuda+write_temp_X_0)+(threadIdx.y*write_temp_c_1)), (write_temp_offset+temp[(1+ty)]), (16*sizeof (int)));
}
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
int temp_block0[(16+1)][(16+1)];
int ref_block0[16][16];
int ty_block0;
int enableSignal_fetch_ref_block0;
int fetch_ref_ref_offset_block0;
int fetch_ref_ref_X_0_block0;
int fetch_ref_ref_c_1_block0;
int enableSignal_init_temp_block0;
int enableSignal_init_temp2_block0;
int enableSignal_fetch_temp_block0;
int fetch_temp_temp_offset_block0;
int fetch_temp_temp_X_0_block0;
int fetch_temp_temp_c_1_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
int write_temp_offset_block0;
int write_temp_X_0_block0;
int write_temp_c_1_block0;
dim3 blockIdx_block0;
int whileLoopGuard_2_block0;
int whileLoopGuard_3_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=gridDim.y))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_temp_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_init_temp2_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_init_temp_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_ref_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
b_index_x_block0=((blockIdx_block0.x+block_width)-i);
b_index_y_block0=((block_width-blockIdx_block0.x)-1);
index_block0=((((cols*16)*b_index_y_block0)+(16*b_index_x_block0))+(cols+1));
index_n_block0=((((cols*16)*b_index_y_block0)+(16*b_index_x_block0))+1);
index_w_block0=((((cols*16)*b_index_y_block0)+(16*b_index_x_block0))+cols);
index_nw_block0=(((cols*16)*b_index_y_block0)+(16*b_index_x_block0));
whileLoopGuard_2_block0=1;
ty_block0=0;
while (1)
{
whileLoopGuard_2_block0&=ty_block0<16;
if (( ! whileLoopGuard_2_block0))
{
break;
}
if (whileLoopGuard_2_block0)
{
fetch_ref_ref_offset_block0=0;
fetch_ref_ref_X_0_block0=(index_block0+(cols*ty_block0));
fetch_ref_ref_c_1_block0=0;
}
needle_cuda_shared_2_fetch_ref((enableSignal_fetch_ref_block0&&whileLoopGuard_2_block0), blockDim, gridDim, referrence, ref_block0, fetch_ref_ref_offset_block0, ty_block0, fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0);
if (whileLoopGuard_2_block0)
{
ty_block0 ++ ;
}
}
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp 
needle_cuda_shared_2_init_temp(enableSignal_init_temp_block0, blockDim, gridDim, blockIdx_block0, index_nw_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp 
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp2 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2_block0, blockDim, gridDim, blockIdx_block0, cols, index_w_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp2 
fetch_temp_temp_offset_block0=1;
fetch_temp_temp_X_0_block0=index_n_block0;
fetch_temp_temp_c_1_block0=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, matrix_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 cores=[1] end=false begin=true 
needle_cuda_shared_2_compute(enableSignal_compute_block0, blockDim, gridDim, blockIdx_block0, penalty, ref_block0, temp_block0);
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 cores=[1] end=true begin=false 
whileLoopGuard_3_block0=1;
ty_block0=0;
while (1)
{
whileLoopGuard_3_block0&=ty_block0<16;
if (( ! whileLoopGuard_3_block0))
{
break;
}
if (whileLoopGuard_3_block0)
{
write_temp_offset_block0=1;
write_temp_X_0_block0=(index_block0+(cols*ty_block0));
write_temp_c_1_block0=0;
}
needle_cuda_shared_2_write((enableSignal_write_block0&&whileLoopGuard_3_block0), blockDim, gridDim, matrix_cuda, temp_block0, write_temp_offset_block0, ty_block0, write_temp_X_0_block0, write_temp_c_1_block0);
if (whileLoopGuard_3_block0)
{
ty_block0 ++ ;
}
}
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
void fcuda2(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=referrence_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=referrence_addr 
#pragma HLS INTERFACE ap_none register port=matrix_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=matrix_cuda_addr 
#pragma HLS INTERFACE ap_none register port=cols 
#pragma HLS RESOURCE core=AXI4LiteS variable=cols 
#pragma HLS INTERFACE ap_none register port=penalty 
#pragma HLS RESOURCE core=AXI4LiteS variable=penalty 
#pragma HLS INTERFACE ap_none register port=i 
#pragma HLS RESOURCE core=AXI4LiteS variable=i 
#pragma HLS INTERFACE ap_none register port=block_width 
#pragma HLS RESOURCE core=AXI4LiteS variable=block_width 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
int * matrix_cuda_core0;
int * referrence_core0;
matrix_cuda_core0=( & memport_core0_p0[matrix_cuda_addr]);
referrence_core0=( & memport_core0_p0[referrence_addr]);
needle_cuda_shared_2(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}

void fcuda(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0_int, int en_fcuda1, int en_fcuda2)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS INTERFACE ap_none register port=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(referrence_addr, matrix_cuda_addr, cols, penalty, i, block_width, gridDim, blockDim, memport_core0_p0_int);
}
if ((en_fcuda2==1))
{
fcuda2(referrence_addr, matrix_cuda_addr, cols, penalty, i, block_width, gridDim, blockDim, memport_core0_p0_int);
}
}

