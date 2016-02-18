#include <fcuda.h>
#include "bfs.h"
const int BLOCKDIM_X_Kernel = 512;
#pragma fcuda compute name=computek1 end=false cores=[1] unroll=1 begin=true 
void Kernel_computek1(int enableSignal_computek1, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int * g_cost, int * g_graph_edges, DATATYPE * g_graph_mask, Node * g_graph_nodes, DATATYPE * g_graph_visited, DATATYPE * g_updating_graph_mask, int no_of_nodes)
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int i;
int tid;
if (enableSignal_computek1)
{
tid=((blockIdx.x*blockDim.x)+threadIdx.x);
if (((tid<no_of_nodes)&&g_graph_mask[tid]))
{
g_graph_mask[tid]=0;
for (i=g_graph_nodes[tid].starting; i<(g_graph_nodes[tid].no_of_edges+g_graph_nodes[tid].starting); i ++ )
{
int id;
id=g_graph_edges[i];
if (( ! g_graph_visited[id]))
{
g_cost[id]=(g_cost[tid]+1);
g_updating_graph_mask[id]=1;
}
}
}
}
}
}

#pragma fcuda grid x_dim=512 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void Kernel(Node * g_graph_nodes, int * g_graph_edges, DATATYPE * g_graph_mask, DATATYPE * g_updating_graph_mask, DATATYPE * g_graph_visited, int * g_cost, int no_of_nodes, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int enableSignal_computek1_block0;
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
enableSignal_computek1_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
#pragma fcuda compute unroll=1 cores=[1] end=false begin=true name=computek1 
Kernel_computek1(enableSignal_computek1_block0, blockDim, gridDim, blockIdx_block0, g_cost, g_graph_edges, g_graph_mask, g_graph_nodes, g_graph_visited, g_updating_graph_mask, no_of_nodes);
#pragma fcuda compute unroll=1 cores=[1] end=true begin=false name=computek1 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=g_graph_nodes_addr remove_port_name=g_graph_nodes_core0 port_core=0 
#pragma fcuda portmerge port_id=1 offset=g_graph_edges_addr remove_port_name=g_graph_edges_core0 port_core=0 
#pragma fcuda portmerge port_id=2 offset=g_graph_mask_addr remove_port_name=g_graph_mask_core0 port_core=0 
#pragma fcuda portmerge port_id=2 offset=g_updating_graph_mask_addr remove_port_name=g_updating_graph_mask_core0 port_core=0 
#pragma fcuda portmerge port_id=2 offset=g_graph_visited_addr remove_port_name=g_graph_visited_core0 port_core=0 
#pragma fcuda portmerge port_id=1 offset=g_cost_addr remove_port_name=g_cost_core0 port_core=0 
void fcuda1(int g_graph_nodes_addr, int g_graph_edges_addr, int g_graph_mask_addr, int g_updating_graph_mask_addr, int g_graph_visited_addr, int g_cost_addr, int no_of_nodes, dim3 gridDim, dim3 blockDim, Node * memport_core0_p0, int * memport_core0_p1, DATATYPE * memport_core0_p2)
{
#pragma HLS INTERFACE ap_none register port=g_graph_nodes_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_graph_nodes_addr 
#pragma HLS INTERFACE ap_none register port=g_graph_edges_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_graph_edges_addr 
#pragma HLS INTERFACE ap_none register port=g_graph_mask_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_graph_mask_addr 
#pragma HLS INTERFACE ap_none register port=g_updating_graph_mask_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_updating_graph_mask_addr 
#pragma HLS INTERFACE ap_none register port=g_graph_visited_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_graph_visited_addr 
#pragma HLS INTERFACE ap_none register port=g_cost_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_cost_addr 
#pragma HLS INTERFACE ap_none register port=no_of_nodes 
#pragma HLS RESOURCE core=AXI4LiteS variable=no_of_nodes 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
#pragma HLS interface ap_bus port=memport_core0_p1 
#pragma HLS RESOURCE variable=memport_core0_p1 core=AXI4M 
#pragma HLS interface ap_bus port=memport_core0_p2 
#pragma HLS RESOURCE variable=memport_core0_p2 core=AXI4M 
int * g_graph_edges_core0;
int * g_cost_core0;
DATATYPE * g_graph_mask_core0;
DATATYPE * g_updating_graph_mask_core0;
DATATYPE * g_graph_visited_core0;
Node * g_graph_nodes_core0;
g_graph_visited_core0=( & memport_core0_p2[g_graph_visited_addr]);
g_updating_graph_mask_core0=( & memport_core0_p2[g_updating_graph_mask_addr]);
g_graph_mask_core0=( & memport_core0_p2[g_graph_mask_addr]);
g_cost_core0=( & memport_core0_p1[g_cost_addr]);
g_graph_edges_core0=( & memport_core0_p1[g_graph_edges_addr]);
g_graph_nodes_core0=( & memport_core0_p0[g_graph_nodes_addr]);
Kernel(g_graph_nodes_core0, g_graph_edges_core0, g_graph_mask_core0, g_updating_graph_mask_core0, g_graph_visited_core0, g_cost_core0, no_of_nodes, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_Kernel2 = 512;
#pragma fcuda compute name=computek1 end=false cores=[1] unroll=1 begin=true 
void Kernel2_computek1(int enableSignal_computek1, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * g_over, DATATYPE * g_graph_mask, DATATYPE * g_graph_visited, DATATYPE * g_updating_graph_mask, int no_of_nodes)
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int tid;
if (enableSignal_computek1)
{
tid=((blockIdx.x*blockDim.x)+threadIdx.x);
if (((tid<no_of_nodes)&&g_updating_graph_mask[tid]))
{
g_graph_mask[tid]=1;
g_graph_visited[tid]=1;
( * g_over)=1;
g_updating_graph_mask[tid]=0;
}
}
}
}

#pragma fcuda grid x_dim=512 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void Kernel2(DATATYPE * g_graph_mask, DATATYPE * g_updating_graph_mask, DATATYPE * g_graph_visited, DATATYPE * g_over, int no_of_nodes, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int enableSignal_computek1_block0;
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
enableSignal_computek1_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
#pragma fcuda compute unroll=1 cores=[1] end=false begin=true name=computek1 
Kernel2_computek1(enableSignal_computek1_block0, blockDim, gridDim, blockIdx_block0, g_over, g_graph_mask, g_graph_visited, g_updating_graph_mask, no_of_nodes);
#pragma fcuda compute unroll=1 cores=[1] end=true begin=false name=computek1 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=2 offset=g_graph_mask_addr remove_port_name=g_graph_mask_core0 port_core=0 
#pragma fcuda portmerge port_id=2 offset=g_updating_graph_mask_addr remove_port_name=g_updating_graph_mask_core0 port_core=0 
#pragma fcuda portmerge port_id=2 offset=g_graph_visited_addr remove_port_name=g_graph_visited_core0 port_core=0 
#pragma fcuda portmerge port_id=2 offset=g_over_addr remove_port_name=g_over_core0 port_core=0 
void fcuda2(int g_graph_mask_addr, int g_updating_graph_mask_addr, int g_graph_visited_addr, int g_over_addr, int no_of_nodes, dim3 gridDim, dim3 blockDim, DATATYPE * memport_core0_p2)
{
#pragma HLS INTERFACE ap_none register port=g_graph_mask_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_graph_mask_addr 
#pragma HLS INTERFACE ap_none register port=g_updating_graph_mask_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_updating_graph_mask_addr 
#pragma HLS INTERFACE ap_none register port=g_graph_visited_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_graph_visited_addr 
#pragma HLS INTERFACE ap_none register port=g_over_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=g_over_addr 
#pragma HLS INTERFACE ap_none register port=no_of_nodes 
#pragma HLS RESOURCE core=AXI4LiteS variable=no_of_nodes 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p2 
#pragma HLS RESOURCE variable=memport_core0_p2 core=AXI4M 
DATATYPE * g_updating_graph_mask_core0;
DATATYPE * g_graph_visited_core0;
DATATYPE * g_over_core0;
DATATYPE * g_graph_mask_core0;
g_over_core0=( & memport_core0_p2[g_over_addr]);
g_graph_visited_core0=( & memport_core0_p2[g_graph_visited_addr]);
g_updating_graph_mask_core0=( & memport_core0_p2[g_updating_graph_mask_addr]);
g_graph_mask_core0=( & memport_core0_p2[g_graph_mask_addr]);
Kernel2(g_graph_mask_core0, g_updating_graph_mask_core0, g_graph_visited_core0, g_over_core0, no_of_nodes, gridDim, blockDim, 1, 0);
}

void fcuda(int g_graph_nodes_addr, int g_graph_edges_addr, int g_graph_mask_addr, int g_updating_graph_mask_addr, int g_graph_visited_addr, int g_cost_addr, int no_of_nodes, dim3 gridDim, dim3 blockDim, Node * memport_core0_p0_Node, int * memport_core0_p1_int, DATATYPE * memport_core0_p2_DATATYPE, int en_fcuda1, int g_over_addr, int en_fcuda2)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS INTERFACE ap_none register port=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(g_graph_nodes_addr, g_graph_edges_addr, g_graph_mask_addr, g_updating_graph_mask_addr, g_graph_visited_addr, g_cost_addr, no_of_nodes, gridDim, blockDim, memport_core0_p0_Node, memport_core0_p1_int, memport_core0_p2_DATATYPE);
}
if ((en_fcuda2==1))
{
fcuda2(g_graph_mask_addr, g_updating_graph_mask_addr, g_graph_visited_addr, g_over_addr, no_of_nodes, gridDim, blockDim, memport_core0_p2_DATATYPE);
}
}

