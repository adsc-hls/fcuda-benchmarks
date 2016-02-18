#include <fcuda.h>
#include "define.h"
#include <string.h>
float d_dist(int p1, int p2, int num, int dim, float * coord_d)
{
float retval = 0.0;
int i;
for (i=0; i<dim; i ++ )
{
float tmp = (coord_d[((i*num)+p1)]-coord_d[((i*num)+p2)]);
retval+=(tmp*tmp);
}
return retval;
}

const int BLOCKDIM_X_kernel_compute_cost = 512;
#pragma fcuda transfer array_split=[weight_shared|assign_shared|cost_shared] mpart=1 dir=[0|0|0] name=fetch pointer=[weight|assign|cost] type=burst cores=[1] end=false unroll=1 size=[512|512|512] begin=true 
void kernel_compute_cost_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, float * weight, float weight_shared[512], int fetch_weight_shared_offset, int fetch_weight_shared_X_0, int fetch_weight_shared_c_1, long long * assign, long long assign_shared[512], int fetch_assign_shared_offset, int fetch_assign_shared_X_0, int fetch_assign_shared_c_1, float * cost, float cost_shared[512], int fetch_cost_shared_offset, int fetch_cost_shared_X_0, int fetch_cost_shared_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch)
{
memcpy((fetch_weight_shared_offset+weight_shared), ((fetch_weight_shared_X_0+weight)+(threadIdx.y*fetch_weight_shared_c_1)), (512*sizeof (float)));
memcpy((assign_shared+fetch_assign_shared_offset), ((assign+fetch_assign_shared_X_0)+(threadIdx.y*fetch_assign_shared_c_1)), (512*sizeof (long long)));
memcpy((cost_shared+fetch_cost_shared_offset), ((cost+fetch_cost_shared_X_0)+(threadIdx.y*fetch_cost_shared_c_1)), (512*sizeof (float)));
}
}

#pragma fcuda compute array_split=[weight_shared|assign_shared|cost_shared] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void kernel_compute_cost_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int K, long long assign_shared[512], int bid, int * center_table_d, float * coord_d, float cost_shared[512], int dim, int num, int stride, DATATYPE * switch_membership_d, float weight_shared[512], float * work_mem_d, long long x)
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int tid;
if (enableSignal_compute)
{
tid=((blockDim.x*bid)+threadIdx.x);
if ((tid<num))
{
float x_cost;
x_cost=(d_dist(tid, x, num, dim, coord_d)*weight_shared[threadIdx.x]);
if ((x_cost<cost_shared[threadIdx.x]))
{
switch_membership_d[tid]=1;
work_mem_d[((tid*stride)+K)]+=(x_cost-cost_shared[threadIdx.x]);
}
else
{
work_mem_d[((tid*stride)+center_table_d[assign_shared[threadIdx.x]])]+=(cost_shared[threadIdx.x]-x_cost);
}
}
}
}
}

#pragma fcuda grid x_dim=512 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void kernel_compute_cost(int num, int dim, long long x, float * weight, long long * assign, float * cost, int K, int stride, float * coord_d, float * work_mem_d, int * center_table_d, DATATYPE * switch_membership_d, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int bid_block0;
float weight_shared_block0[512];
long long assign_shared_block0[512];
float cost_shared_block0[512];
int enableSignal_fetch_block0;
int fetch_weight_shared_offset_block0;
int fetch_weight_shared_X_0_block0;
int fetch_weight_shared_c_1_block0;
int fetch_assign_shared_offset_block0;
int fetch_assign_shared_X_0_block0;
int fetch_assign_shared_c_1_block0;
int fetch_cost_shared_offset_block0;
int fetch_cost_shared_X_0_block0;
int fetch_cost_shared_c_1_block0;
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
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
bid_block0=(blockIdx_block0.x+(gridDim.x*blockIdx_block0.y));
fetch_weight_shared_offset_block0=0;
fetch_weight_shared_X_0_block0=(blockDim.x*bid_block0);
fetch_weight_shared_c_1_block0=0;
fetch_assign_shared_offset_block0=0;
fetch_assign_shared_X_0_block0=(blockDim.x*bid_block0);
fetch_assign_shared_c_1_block0=0;
fetch_cost_shared_offset_block0=0;
fetch_cost_shared_X_0_block0=(blockDim.x*bid_block0);
fetch_cost_shared_c_1_block0=0;
#pragma fcuda transfer array_split=[weight_shared|assign_shared|cost_shared] mpart=1 dir=[0|0|0] name=fetch pointer=[weight|assign|cost] type=burst unroll=1 end=false cores=[1] begin=true size=[512|512|512] 
kernel_compute_cost_fetch(enableSignal_fetch_block0, blockDim, gridDim, weight, weight_shared_block0, fetch_weight_shared_offset_block0, fetch_weight_shared_X_0_block0, fetch_weight_shared_c_1_block0, assign, assign_shared_block0, fetch_assign_shared_offset_block0, fetch_assign_shared_X_0_block0, fetch_assign_shared_c_1_block0, cost, cost_shared_block0, fetch_cost_shared_offset_block0, fetch_cost_shared_X_0_block0, fetch_cost_shared_c_1_block0);
#pragma fcuda transfer array_split=[weight_shared|assign_shared|cost_shared] mpart=1 dir=[0|0|0] name=fetch pointer=[weight|assign|cost] type=burst unroll=1 end=true cores=[1] begin=false size=[512|512|512] 
#pragma fcuda compute array_split=[weight_shared|assign_shared|cost_shared] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
kernel_compute_cost_compute(enableSignal_compute_block0, blockDim, gridDim, blockIdx_block0, K, assign_shared_block0, bid_block0, center_table_d, coord_d, cost_shared_block0, dim, num, stride, switch_membership_d, weight_shared_block0, work_mem_d, x);
#pragma fcuda compute array_split=[weight_shared|assign_shared|cost_shared] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=weight_addr remove_port_name=weight_core0 port_core=0 
#pragma fcuda portmerge port_id=1 offset=assign_addr remove_port_name=assign_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=cost_addr remove_port_name=cost_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=coord_d_addr remove_port_name=coord_d_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=work_mem_d_addr remove_port_name=work_mem_d_core0 port_core=0 
#pragma fcuda portmerge port_id=2 offset=center_table_d_addr remove_port_name=center_table_d_core0 port_core=0 
#pragma fcuda portmerge port_id=3 offset=switch_membership_d_addr remove_port_name=switch_membership_d_core0 port_core=0 
void fcuda1(int num, int dim, long long x, int weight_addr, int assign_addr, int cost_addr, int K, int stride, int coord_d_addr, int work_mem_d_addr, int center_table_d_addr, int switch_membership_d_addr, dim3 gridDim, dim3 blockDim, float * memport_core0_p0, DATATYPE * memport_core0_p3, long long * memport_core0_p1, int * memport_core0_p2)
{
#pragma HLS INTERFACE ap_none register port=num 
#pragma HLS RESOURCE core=AXI4LiteS variable=num 
#pragma HLS INTERFACE ap_none register port=dim 
#pragma HLS RESOURCE core=AXI4LiteS variable=dim 
#pragma HLS INTERFACE ap_none register port=x 
#pragma HLS RESOURCE core=AXI4LiteS variable=x 
#pragma HLS INTERFACE ap_none register port=weight_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=weight_addr 
#pragma HLS INTERFACE ap_none register port=assign_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=assign_addr 
#pragma HLS INTERFACE ap_none register port=cost_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=cost_addr 
#pragma HLS INTERFACE ap_none register port=K 
#pragma HLS RESOURCE core=AXI4LiteS variable=K 
#pragma HLS INTERFACE ap_none register port=stride 
#pragma HLS RESOURCE core=AXI4LiteS variable=stride 
#pragma HLS INTERFACE ap_none register port=coord_d_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=coord_d_addr 
#pragma HLS INTERFACE ap_none register port=work_mem_d_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=work_mem_d_addr 
#pragma HLS INTERFACE ap_none register port=center_table_d_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=center_table_d_addr 
#pragma HLS INTERFACE ap_none register port=switch_membership_d_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=switch_membership_d_addr 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
#pragma HLS interface ap_bus port=memport_core0_p3 
#pragma HLS RESOURCE variable=memport_core0_p3 core=AXI4M 
#pragma HLS interface ap_bus port=memport_core0_p1 
#pragma HLS RESOURCE variable=memport_core0_p1 core=AXI4M 
#pragma HLS interface ap_bus port=memport_core0_p2 
#pragma HLS RESOURCE variable=memport_core0_p2 core=AXI4M 
float * cost_core0;
float * coord_d_core0;
float * work_mem_d_core0;
DATATYPE * switch_membership_d_core0;
long long * assign_core0;
int * center_table_d_core0;
float * weight_core0;
center_table_d_core0=( & memport_core0_p2[center_table_d_addr]);
assign_core0=( & memport_core0_p1[assign_addr]);
switch_membership_d_core0=( & memport_core0_p3[switch_membership_d_addr]);
work_mem_d_core0=( & memport_core0_p0[work_mem_d_addr]);
coord_d_core0=( & memport_core0_p0[coord_d_addr]);
cost_core0=( & memport_core0_p0[cost_addr]);
weight_core0=( & memport_core0_p0[weight_addr]);
kernel_compute_cost(num, dim, x, weight_core0, assign_core0, cost_core0, K, stride, coord_d_core0, work_mem_d_core0, center_table_d_core0, switch_membership_d_core0, gridDim, blockDim, 1, 0);
}

void fcuda(int num, int dim, long long x, int weight_addr, int assign_addr, int cost_addr, int K, int stride, int coord_d_addr, int work_mem_d_addr, int center_table_d_addr, int switch_membership_d_addr, dim3 gridDim, dim3 blockDim, float * memport_core0_p0_float, DATATYPE * memport_core0_p3_DATATYPE, long long * memport_core0_p1_long_long, int * memport_core0_p2_int, int en_fcuda1)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(num, dim, x, weight_addr, assign_addr, cost_addr, K, stride, coord_d_addr, work_mem_d_addr, center_table_d_addr, switch_membership_d_addr, gridDim, blockDim, memport_core0_p0_float, memport_core0_p3_DATATYPE, memport_core0_p1_long_long, memport_core0_p2_int);
}
}

