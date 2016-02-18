#include <fcuda.h>
#include <math.h>
#include "nn.h"
const int BLOCKDIM_X_euclid = 256, BLOCKDIM_Y_euclid = 256;
#pragma fcuda compute array_split=[] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void euclid_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, float * d_distances, LatLong * d_locations, float lat, float lng, int numRecords)
{
dim3 threadIdx;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int globalId;
LatLong * latLong;
if (enableSignal_compute)
{
globalId=((blockDim.x*((gridDim.x*blockIdx.y)+blockIdx.x))+threadIdx.x);
latLong=( & d_locations[globalId]);
if ((globalId<numRecords))
{
float * dist;
dist=( & d_distances[globalId]);
( * dist)=((float)sqrt((((lat-latLong->lat)*(lat-latLong->lat))+((lng-latLong->lng)*(lng-latLong->lng)))));
}
}
}
}

#pragma fcuda grid y_dim=256 x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void euclid(LatLong * d_locations, float * d_distances, int numRecords, float lat, float lng, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
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
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
euclid_compute(enableSignal_compute_block0, blockDim, gridDim, blockIdx_block0, d_distances, d_locations, lat, lng, numRecords);
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=d_locations_addr remove_port_name=d_locations_core0 port_core=0 
#pragma fcuda portmerge port_id=1 offset=d_distances_addr remove_port_name=d_distances_core0 port_core=0 
void fcuda1(int d_locations_addr, int d_distances_addr, int numRecords, float lat, float lng, dim3 gridDim, dim3 blockDim, LatLong * memport_core0_p0, float * memport_core0_p1)
{
#pragma HLS INTERFACE ap_none register port=d_locations_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=d_locations_addr 
#pragma HLS INTERFACE ap_none register port=d_distances_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=d_distances_addr 
#pragma HLS INTERFACE ap_none register port=numRecords 
#pragma HLS RESOURCE core=AXI4LiteS variable=numRecords 
#pragma HLS INTERFACE ap_none register port=lat 
#pragma HLS RESOURCE core=AXI4LiteS variable=lat 
#pragma HLS INTERFACE ap_none register port=lng 
#pragma HLS RESOURCE core=AXI4LiteS variable=lng 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
#pragma HLS interface ap_bus port=memport_core0_p1 
#pragma HLS RESOURCE variable=memport_core0_p1 core=AXI4M 
float * d_distances_core0;
LatLong * d_locations_core0;
d_distances_core0=( & memport_core0_p1[d_distances_addr]);
d_locations_core0=( & memport_core0_p0[d_locations_addr]);
euclid(d_locations_core0, d_distances_core0, numRecords, lat, lng, gridDim, blockDim, 1, 0);
}

void fcuda(int d_locations_addr, int d_distances_addr, int numRecords, float lat, float lng, dim3 gridDim, dim3 blockDim, LatLong * memport_core0_p0_LatLong, float * memport_core0_p1_float, int en_fcuda1)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(d_locations_addr, d_distances_addr, numRecords, lat, lng, gridDim, blockDim, memport_core0_p0_LatLong, memport_core0_p1_float);
}
}

