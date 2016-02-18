#include <fcuda.h>
#include "dwtHaar1D.h"
#include <string.h>
const int BLOCKDIM_X_dwtHaar1D = 512;
#pragma fcuda transfer array_split=[dataDiff1] mpart=1 dir=[0] name=fetchid pointer=[id] type=burst cores=[1] end=false unroll=1 size=[1024] begin=true 
void dwtHaar1D_fetchid(int enableSignal_fetchid, dim3 blockDim, dim3 gridDim, DATATYPE * id, DATATYPE shared[1024], int fetchid_shared_offset, int fetchid_shared_X_0, int fetchid_shared_c_1)
{
dim3 threadIdx;
if (enableSignal_fetchid)
{
memcpy((fetchid_shared_offset+shared), ((fetchid_shared_X_0+id)+(threadIdx.y*fetchid_shared_c_1)), (1024*sizeof (DATATYPE)));
}
}

#pragma fcuda compute array_split=[dataDiff1] mpart=1 name=dcomp0 cores=[1] end=false unroll=1 begin=true 
void dwtHaar1D_dcomp0(int enableSignal_dcomp0, dim3 blockDim, dim3 gridDim, dim3 blockIdx, const int bdim, DATATYPE dataDiff1[512], DATATYPE dataDiff2[512], const unsigned int dlevels, DATATYPE shared2[1024], DATATYPE shared[1024])
{
dim3 threadIdx;
unsigned int atid;
DATATYPE data0_block[BLOCKDIM_X_dwtHaar1D];
DATATYPE data1_block[BLOCKDIM_X_dwtHaar1D];
unsigned int dlv;
unsigned int num_threads;
unsigned int offset_neighbor;
unsigned int stride;
if (enableSignal_dcomp0)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
data0_block[threadIdx.x]=shared[(2*threadIdx.x)];
data1_block[threadIdx.x]=shared[((2*threadIdx.x)+1)];
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
dataDiff1[threadIdx.x]=((data0_block[threadIdx.x]-data1_block[threadIdx.x])*0.7071067811865476F);
atid=(threadIdx.x+(threadIdx.x>>4));
shared2[atid]=((data0_block[threadIdx.x]+data1_block[threadIdx.x])*0.7071067811865476F);
}
offset_neighbor=1;
num_threads=(bdim>>1);
stride=1;
dlv=1;
while (dlv<dlevels)
{
unsigned int idata0;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
idata0=(threadIdx.x<<stride);
if ((threadIdx.x<num_threads))
{
unsigned int idata1;
idata1=(idata0+offset_neighbor);
dataDiff2[(num_threads+threadIdx.x)]=((shared2[(idata0+(idata0>>4))]-shared2[(idata1+(idata1>>4))])*0.7071067811865476F);
shared2[(idata0+(idata0>>4))]=((shared2[(idata0+(idata0>>4))]+shared2[(idata1+(idata1>>4))])*0.7071067811865476F);
}
}
stride=(stride+1);
offset_neighbor<<=1;
num_threads=(num_threads>>1);
 ++ dlv;
}
}
}

#pragma fcuda compute array_split=[dataDiff1] mpart=1 name=dcomp1 cores=[1] end=false unroll=1 begin=true 
void dwtHaar1D_dcomp1(int enableSignal_dcomp1, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * approx_final, DATATYPE shared2[1024])
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_dcomp1)
{
if ((threadIdx.x==0))
{
approx_final[(blockIdx.x+threadIdx.x)]=shared2[threadIdx.x];
}
}
}
}

#pragma fcuda transfer array_split=[dataDiff1] mpart=1 dir=[1] name=writeod pointer=[od] type=burst cores=[1] end=false unroll=1 size=[bdim] begin=true 
void dwtHaar1D_writeod(int enableSignal_writeod, dim3 blockDim, dim3 gridDim, DATATYPE * od, const int bdim, DATATYPE dataDiff1[512], int writeod_dataDiff1_offset, int writeod_dataDiff1_X_0, int writeod_dataDiff1_c_1)
{
dim3 threadIdx;
if (enableSignal_writeod)
{
memcpy(((od+writeod_dataDiff1_X_0)+(threadIdx.y*writeod_dataDiff1_c_1)), (dataDiff1+writeod_dataDiff1_offset), (bdim*sizeof (DATATYPE)));
}
}

#pragma fcuda transfer array_split=[dataDiff1] mpart=1 dir=[1] name=writeod2 pointer=[od] type=burst cores=[1] end=false unroll=1 size=[num_threads2] begin=true 
void dwtHaar1D_writeod2(int enableSignal_writeod2, dim3 blockDim, dim3 gridDim, DATATYPE * od, unsigned int num_threads2, DATATYPE dataDiff2[512], int writeod2_dataDiff2_offset, int writeod2_dataDiff2_X_0, int writeod2_dataDiff2_c_1)
{
dim3 threadIdx;
if (enableSignal_writeod2)
{
memcpy(((od+writeod2_dataDiff2_X_0)+(threadIdx.y*writeod2_dataDiff2_c_1)), (dataDiff2+writeod2_dataDiff2_offset), (num_threads2*sizeof (DATATYPE)));
}
}

#pragma fcuda grid x_dim=512 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void dwtHaar1D(DATATYPE * id, DATATYPE * od, DATATYPE * approx_final, const unsigned int dlevels, const unsigned int slength_step_half, const int bdim, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
DATATYPE shared_block0[1024];
DATATYPE shared2_block0[1024];
DATATYPE dataDiff1_block0[512];
DATATYPE dataDiff2_block0[512];
unsigned int num_threads2_block0;
unsigned int g_wpos_block0;
int tid_global_block0;
unsigned int idata_block0;
int enableSignal_fetchid_block0;
int fetchid_shared_offset_block0;
int fetchid_shared_X_0_block0;
int fetchid_shared_c_1_block0;
int enableSignal_dcomp0_block0;
int enableSignal_dcomp1_block0;
int enableSignal_writeod_block0;
int writeod_dataDiff1_offset_block0;
int writeod_dataDiff1_X_0_block0;
int writeod_dataDiff1_c_1_block0;
int enableSignal_writeod2_block0;
int writeod2_dataDiff2_offset_block0;
int writeod2_dataDiff2_X_0_block0;
int writeod2_dataDiff2_c_1_block0;
dim3 blockIdx_block0;
int whileLoopGuard_0_block0;
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
enableSignal_writeod2_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_writeod_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_dcomp1_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_dcomp0_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetchid_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
tid_global_block0=(blockIdx_block0.x*bdim);
idata_block0=(blockIdx_block0.x*(2*bdim));
fetchid_shared_offset_block0=0;
fetchid_shared_X_0_block0=idata_block0;
fetchid_shared_c_1_block0=0;
#pragma fcuda transfer array_split=[dataDiff1] mpart=1 dir=[0] name=fetchid pointer=[id] type=burst unroll=1 end=false cores=[1] begin=true size=[1024] 
dwtHaar1D_fetchid(enableSignal_fetchid_block0, blockDim, gridDim, id, shared_block0, fetchid_shared_offset_block0, fetchid_shared_X_0_block0, fetchid_shared_c_1_block0);
#pragma fcuda transfer array_split=[dataDiff1] mpart=1 dir=[0] name=fetchid pointer=[id] type=burst unroll=1 end=true cores=[1] begin=false size=[1024] 
#pragma fcuda compute array_split=[dataDiff1] mpart=1 name=dcomp0 unroll=1 end=false cores=[1] begin=true 
dwtHaar1D_dcomp0(enableSignal_dcomp0_block0, blockDim, gridDim, blockIdx_block0, bdim, dataDiff1_block0, dataDiff2_block0, dlevels, shared2_block0, shared_block0);
#pragma fcuda compute array_split=[dataDiff1] mpart=1 name=dcomp0 unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[dataDiff1] mpart=1 name=dcomp1 unroll=1 end=false cores=[1] begin=true 
dwtHaar1D_dcomp1(enableSignal_dcomp1_block0, blockDim, gridDim, blockIdx_block0, approx_final, shared2_block0);
#pragma fcuda compute array_split=[dataDiff1] mpart=1 name=dcomp1 unroll=1 end=true cores=[1] begin=false 
writeod_dataDiff1_offset_block0=0;
writeod_dataDiff1_X_0_block0=(slength_step_half+tid_global_block0);
writeod_dataDiff1_c_1_block0=0;
#pragma fcuda transfer array_split=[dataDiff1] mpart=1 dir=[1] name=writeod pointer=[od] type=burst unroll=1 end=false cores=[1] begin=true size=[bdim] 
dwtHaar1D_writeod(enableSignal_writeod_block0, blockDim, gridDim, od, bdim, dataDiff1_block0, writeod_dataDiff1_offset_block0, writeod_dataDiff1_X_0_block0, writeod_dataDiff1_c_1_block0);
#pragma fcuda transfer array_split=[dataDiff1] mpart=1 dir=[1] name=writeod pointer=[od] type=burst unroll=1 end=true cores=[1] begin=false size=[bdim] 
whileLoopGuard_0_block0=1;
num_threads2_block0=(bdim>>1);
while (1)
{
whileLoopGuard_0_block0&=num_threads2_block0>0;
if (( ! whileLoopGuard_0_block0))
{
break;
}
if (whileLoopGuard_0_block0)
{
g_wpos_block0=((num_threads2_block0*gridDim.x)+(blockIdx_block0.x*num_threads2_block0));
writeod2_dataDiff2_offset_block0=num_threads2_block0;
writeod2_dataDiff2_X_0_block0=g_wpos_block0;
writeod2_dataDiff2_c_1_block0=0;
}
dwtHaar1D_writeod2((enableSignal_writeod2_block0&&whileLoopGuard_0_block0), blockDim, gridDim, od, num_threads2_block0, dataDiff2_block0, writeod2_dataDiff2_offset_block0, writeod2_dataDiff2_X_0_block0, writeod2_dataDiff2_c_1_block0);
if (whileLoopGuard_0_block0)
{
num_threads2_block0>>=1;
}
}
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=id_addr remove_port_name=id_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=od_addr remove_port_name=od_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=approx_final_addr remove_port_name=approx_final_core0 port_core=0 
void fcuda1(int id_addr, int od_addr, int approx_final_addr, const unsigned int dlevels, const unsigned int slength_step_half, const int bdim, dim3 gridDim, dim3 blockDim, DATATYPE * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=id_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=id_addr 
#pragma HLS INTERFACE ap_none register port=od_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=od_addr 
#pragma HLS INTERFACE ap_none register port=approx_final_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=approx_final_addr 
#pragma HLS INTERFACE ap_none register port=dlevels 
#pragma HLS RESOURCE core=AXI4LiteS variable=dlevels 
#pragma HLS INTERFACE ap_none register port=slength_step_half 
#pragma HLS RESOURCE core=AXI4LiteS variable=slength_step_half 
#pragma HLS INTERFACE ap_none register port=bdim 
#pragma HLS RESOURCE core=AXI4LiteS variable=bdim 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
DATATYPE * od_core0;
DATATYPE * approx_final_core0;
DATATYPE * id_core0;
approx_final_core0=( & memport_core0_p0[approx_final_addr]);
od_core0=( & memport_core0_p0[od_addr]);
id_core0=( & memport_core0_p0[id_addr]);
dwtHaar1D(id_core0, od_core0, approx_final_core0, dlevels, slength_step_half, bdim, gridDim, blockDim, 1, 0);
}

void fcuda(int id_addr, int od_addr, int approx_final_addr, const unsigned int dlevels, const unsigned int slength_step_half, const int bdim, dim3 gridDim, dim3 blockDim, DATATYPE * memport_core0_p0_DATATYPE, int en_fcuda1)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(id_addr, od_addr, approx_final_addr, dlevels, slength_step_half, bdim, gridDim, blockDim, memport_core0_p0_DATATYPE);
}
}

