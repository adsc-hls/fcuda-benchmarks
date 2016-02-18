#include <fcuda.h>
#include "backprop.h"
#include <math.h>
#include <string.h>
int custom_pow_base2(int i)
{
int k;
int result = 1;
for (k=0; k<i; k ++ )
{
result=(result*2);
}
return result;
}

const int BLOCKDIM_X_bpnn_layerforward_CUDA = 16, BLOCKDIM_Y_bpnn_layerforward_CUDA = 16;
#pragma fcuda compute array_split=[input_node|weight_matrix] mpart=1 name=compute_input_node end=false cores=[1] unroll=1 begin=true 
void bpnn_layerforward_CUDA_compute_input_node(int enableSignal_compute_input_node, dim3 blockDim, dim3 gridDim, dim3 blockIdx, float * input_cuda, float input_node[16])
{
dim3 threadIdx;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int index_in;
if (enableSignal_compute_input_node)
{
index_in=(((16*blockIdx.y)+threadIdx.y)+1);
if ((threadIdx.x==0))
{
input_node[threadIdx.y]=input_cuda[index_in];
}
}
}
}

#pragma fcuda transfer array_split=[input_node|weight_matrix] mpart=1 dir=[0] name=fetch_weight_matrix pointer=[input_hidden_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void bpnn_layerforward_CUDA_fetch_weight_matrix(int enableSignal_fetch_weight_matrix, dim3 blockDim, dim3 gridDim, float * input_hidden_cuda, float weight_matrix[16][16], int fetch_weight_matrix_weight_matrix_offset, int fetch_weight_matrix_weight_matrix_X_0, int fetch_weight_matrix_weight_matrix_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_weight_matrix)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_weight_matrix_weight_matrix_offset+weight_matrix[threadIdx.y]), ((fetch_weight_matrix_weight_matrix_X_0+input_hidden_cuda)+(threadIdx.y*fetch_weight_matrix_weight_matrix_c_1)), (16*sizeof (float)));
}
}
}

#pragma fcuda compute array_split=[input_node|weight_matrix] mpart=1 name=compute_weight_matrix1 end=false cores=[1] unroll=1 begin=true 
void bpnn_layerforward_CUDA_compute_weight_matrix1(int enableSignal_compute_weight_matrix1, dim3 blockDim, dim3 gridDim, dim3 blockIdx, float input_node[16], float weight_matrix1[16][16], float weight_matrix2[16][16], float weight_matrix[16][16])
{
dim3 threadIdx;
int i;
if (enableSignal_compute_weight_matrix1)
{
int xhxd;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
weight_matrix1[threadIdx.y][threadIdx.x]=(weight_matrix[threadIdx.y][threadIdx.x]*input_node[threadIdx.y]);
}
i=1;
xhxd=i<=log(16);
while (xhxd)
{
int power_two;
power_two=custom_pow_base2(i);
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (((threadIdx.y%power_two)==0))
{
weight_matrix1[threadIdx.y][threadIdx.x]=(weight_matrix1[threadIdx.y][threadIdx.x]+weight_matrix1[(threadIdx.y+(power_two/2))][threadIdx.x]);
}
}
i ++ ;
xhxd=i<=log(16);
}
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
weight_matrix2[threadIdx.y][threadIdx.x]=weight_matrix1[threadIdx.y][threadIdx.x];
}
}
}

#pragma fcuda transfer array_split=[input_node|weight_matrix] mpart=1 dir=[1] name=write_weight_matrix pointer=[input_hidden_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void bpnn_layerforward_CUDA_write_weight_matrix(int enableSignal_write_weight_matrix, dim3 blockDim, dim3 gridDim, float * input_hidden_cuda, float weight_matrix2[16][16], int write_weight_matrix_weight_matrix2_offset, int write_weight_matrix_weight_matrix2_X_0, int write_weight_matrix_weight_matrix2_c_1)
{
dim3 threadIdx;
if (enableSignal_write_weight_matrix)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy(((input_hidden_cuda+write_weight_matrix_weight_matrix2_X_0)+(threadIdx.y*write_weight_matrix_weight_matrix2_c_1)), (write_weight_matrix_weight_matrix2_offset+weight_matrix2[threadIdx.y]), (16*sizeof (float)));
}
}
}

#pragma fcuda compute array_split=[input_node|weight_matrix] mpart=1 name=compute_hps end=false cores=[1] unroll=1 begin=true 
void bpnn_layerforward_CUDA_compute_hps(int enableSignal_compute_hps, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int hid, float * hidden_partial_sum, float weight_matrix1[16][16])
{
dim3 threadIdx;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_compute_hps)
{
if ((threadIdx.x==0))
{
hidden_partial_sum[((blockIdx.y*hid)+threadIdx.y)]=weight_matrix1[threadIdx.x][threadIdx.y];
}
}
}
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void bpnn_layerforward_CUDA(float * input_cuda, float * input_hidden_cuda, float * hidden_partial_sum, int in, int hid, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int index_block0;
float input_node_block0[16];
float weight_matrix_block0[16][16];
float weight_matrix1_block0[16][16];
float weight_matrix2_block0[16][16];
int enableSignal_compute_input_node_block0;
int enableSignal_fetch_weight_matrix_block0;
int fetch_weight_matrix_weight_matrix_offset_block0;
int fetch_weight_matrix_weight_matrix_X_0_block0;
int fetch_weight_matrix_weight_matrix_c_1_block0;
int enableSignal_compute_weight_matrix1_block0;
int enableSignal_write_weight_matrix_block0;
int write_weight_matrix_weight_matrix2_offset_block0;
int write_weight_matrix_weight_matrix2_X_0_block0;
int write_weight_matrix_weight_matrix2_c_1_block0;
int enableSignal_compute_hps_block0;
dim3 blockIdx_block0;
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
enableSignal_compute_hps_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_write_weight_matrix_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_weight_matrix1_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_weight_matrix_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_input_node_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
index_block0=(((((hid+1)*16)*blockIdx_block0.y)+1)+(hid+1));
#pragma fcuda compute array_split=[input_node|weight_matrix] mpart=1 name=compute_input_node unroll=1 cores=[1] end=false begin=true 
bpnn_layerforward_CUDA_compute_input_node(enableSignal_compute_input_node_block0, blockDim, gridDim, blockIdx_block0, input_cuda, input_node_block0);
#pragma fcuda compute array_split=[input_node|weight_matrix] mpart=1 name=compute_input_node unroll=1 cores=[1] end=true begin=false 
fetch_weight_matrix_weight_matrix_offset_block0=0;
fetch_weight_matrix_weight_matrix_X_0_block0=index_block0;
fetch_weight_matrix_weight_matrix_c_1_block0=(hid+1);
#pragma fcuda transfer array_split=[input_node|weight_matrix] mpart=1 dir=[0] name=fetch_weight_matrix pointer=[input_hidden_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
bpnn_layerforward_CUDA_fetch_weight_matrix(enableSignal_fetch_weight_matrix_block0, blockDim, gridDim, input_hidden_cuda, weight_matrix_block0, fetch_weight_matrix_weight_matrix_offset_block0, fetch_weight_matrix_weight_matrix_X_0_block0, fetch_weight_matrix_weight_matrix_c_1_block0);
#pragma fcuda transfer array_split=[input_node|weight_matrix] mpart=1 dir=[0] name=fetch_weight_matrix pointer=[input_hidden_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
#pragma fcuda compute array_split=[input_node|weight_matrix] mpart=1 name=compute_weight_matrix1 unroll=1 cores=[1] end=false begin=true 
bpnn_layerforward_CUDA_compute_weight_matrix1(enableSignal_compute_weight_matrix1_block0, blockDim, gridDim, blockIdx_block0, input_node_block0, weight_matrix1_block0, weight_matrix2_block0, weight_matrix_block0);
#pragma fcuda compute array_split=[input_node|weight_matrix] mpart=1 name=compute_weight_matrix1 unroll=1 cores=[1] end=true begin=false 
write_weight_matrix_weight_matrix2_offset_block0=0;
write_weight_matrix_weight_matrix2_X_0_block0=index_block0;
write_weight_matrix_weight_matrix2_c_1_block0=(hid+1);
#pragma fcuda transfer array_split=[input_node|weight_matrix] mpart=1 dir=[1] name=write_weight_matrix pointer=[input_hidden_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
bpnn_layerforward_CUDA_write_weight_matrix(enableSignal_write_weight_matrix_block0, blockDim, gridDim, input_hidden_cuda, weight_matrix2_block0, write_weight_matrix_weight_matrix2_offset_block0, write_weight_matrix_weight_matrix2_X_0_block0, write_weight_matrix_weight_matrix2_c_1_block0);
#pragma fcuda transfer array_split=[input_node|weight_matrix] mpart=1 dir=[1] name=write_weight_matrix pointer=[input_hidden_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
#pragma fcuda compute array_split=[input_node|weight_matrix] mpart=1 name=compute_hps unroll=1 cores=[1] end=false begin=true 
bpnn_layerforward_CUDA_compute_hps(enableSignal_compute_hps_block0, blockDim, gridDim, blockIdx_block0, hid, hidden_partial_sum, weight_matrix1_block0);
#pragma fcuda compute array_split=[input_node|weight_matrix] mpart=1 name=compute_hps unroll=1 cores=[1] end=true begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=input_cuda_addr remove_port_name=input_cuda_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=input_hidden_cuda_addr remove_port_name=input_hidden_cuda_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=hidden_partial_sum_addr remove_port_name=hidden_partial_sum_core0 port_core=0 
void fcuda1(int input_cuda_addr, int input_hidden_cuda_addr, int hidden_partial_sum_addr, int in, int hid, dim3 gridDim, dim3 blockDim, float * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=input_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=input_cuda_addr 
#pragma HLS INTERFACE ap_none register port=input_hidden_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=input_hidden_cuda_addr 
#pragma HLS INTERFACE ap_none register port=hidden_partial_sum_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=hidden_partial_sum_addr 
#pragma HLS INTERFACE ap_none register port=in 
#pragma HLS RESOURCE core=AXI4LiteS variable=in 
#pragma HLS INTERFACE ap_none register port=hid 
#pragma HLS RESOURCE core=AXI4LiteS variable=hid 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
float * input_hidden_cuda_core0;
float * hidden_partial_sum_core0;
float * input_cuda_core0;
hidden_partial_sum_core0=( & memport_core0_p0[hidden_partial_sum_addr]);
input_hidden_cuda_core0=( & memport_core0_p0[input_hidden_cuda_addr]);
input_cuda_core0=( & memport_core0_p0[input_cuda_addr]);
bpnn_layerforward_CUDA(input_cuda_core0, input_hidden_cuda_core0, hidden_partial_sum_core0, in, hid, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_bpnn_adjust_weights_cuda = 16, BLOCKDIM_Y_bpnn_adjust_weights_cuda = 16;
#pragma fcuda compute name=compute end=false cores=[1] unroll=1 begin=true 
void bpnn_adjust_weights_cuda_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, float * delta, int hid, float * ly, float * oldw, float * w)
{
dim3 threadIdx;
int index;
int index_x_block[BLOCKDIM_Y_bpnn_adjust_weights_cuda][BLOCKDIM_X_bpnn_adjust_weights_cuda];
int index_y;
if (enableSignal_compute)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
index=(((((((hid+1)*16)*blockIdx.y)+((hid+1)*threadIdx.y))+threadIdx.x)+1)+(hid+1));
index_y=(((16*blockIdx.y)+threadIdx.y)+1);
index_x_block[threadIdx.y][threadIdx.x]=(threadIdx.x+1);
w[index]+=(((0.3*delta[index_x_block[threadIdx.y][threadIdx.x]])*ly[index_y])+(0.3*oldw[index]));
oldw[index]=(((0.3*delta[index_x_block[threadIdx.y][threadIdx.x]])*ly[index_y])+(0.3*oldw[index]));
}
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (((threadIdx.y==0)&&(blockIdx.y==0)))
{
w[index_x_block[threadIdx.y][threadIdx.x]]+=((0.3*delta[index_x_block[threadIdx.y][threadIdx.x]])+(0.3*oldw[index_x_block[threadIdx.y][threadIdx.x]]));
oldw[index_x_block[threadIdx.y][threadIdx.x]]=((0.3*delta[index_x_block[threadIdx.y][threadIdx.x]])+(0.3*oldw[index_x_block[threadIdx.y][threadIdx.x]]));
}
}
}
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void bpnn_adjust_weights_cuda(float * delta, int hid, float * ly, int in, float * w, float * oldw, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int enableSignal_compute_block0;
dim3 blockIdx_block0;
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
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
#pragma fcuda compute unroll=1 cores=[1] end=false begin=true name=compute 
bpnn_adjust_weights_cuda_compute(enableSignal_compute_block0, blockDim, gridDim, blockIdx_block0, delta, hid, ly, oldw, w);
#pragma fcuda compute unroll=1 cores=[1] end=true begin=false name=compute 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=delta_addr remove_port_name=delta_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=ly_addr remove_port_name=ly_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=w_addr remove_port_name=w_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=oldw_addr remove_port_name=oldw_core0 port_core=0 
void fcuda2(int delta_addr, int hid, int ly_addr, int in, int w_addr, int oldw_addr, dim3 gridDim, dim3 blockDim, float * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=delta_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=delta_addr 
#pragma HLS INTERFACE ap_none register port=hid 
#pragma HLS RESOURCE core=AXI4LiteS variable=hid 
#pragma HLS INTERFACE ap_none register port=ly_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=ly_addr 
#pragma HLS INTERFACE ap_none register port=in 
#pragma HLS RESOURCE core=AXI4LiteS variable=in 
#pragma HLS INTERFACE ap_none register port=w_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=w_addr 
#pragma HLS INTERFACE ap_none register port=oldw_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=oldw_addr 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
float * ly_core0;
float * w_core0;
float * oldw_core0;
float * delta_core0;
oldw_core0=( & memport_core0_p0[oldw_addr]);
w_core0=( & memport_core0_p0[w_addr]);
ly_core0=( & memport_core0_p0[ly_addr]);
delta_core0=( & memport_core0_p0[delta_addr]);
bpnn_adjust_weights_cuda(delta_core0, hid, ly_core0, in, w_core0, oldw_core0, gridDim, blockDim, 1, 0);
}

void fcuda(int input_cuda_addr, int input_hidden_cuda_addr, int hidden_partial_sum_addr, int in, int hid, dim3 gridDim, dim3 blockDim, float * memport_core0_p0_float, int en_fcuda1, int delta_addr, int ly_addr, int w_addr, int oldw_addr, int en_fcuda2)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS INTERFACE ap_none register port=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(input_cuda_addr, input_hidden_cuda_addr, hidden_partial_sum_addr, in, hid, gridDim, blockDim, memport_core0_p0_float);
}
if ((en_fcuda2==1))
{
fcuda2(delta_addr, hid, ly_addr, in, w_addr, oldw_addr, gridDim, blockDim, memport_core0_p0_float);
}
}

