#include <fcuda.h>
const int BLOCKDIM_X_Fan1 = 512;
#pragma fcuda compute name=cmp_fan1 cores=[1] end=false unroll=1 begin=true 
void Fan1_cmp_fan1(int enableSignal_cmp_fan1, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int Size, float * a_cuda, float * m_cuda, int t)
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int index;
if (enableSignal_cmp_fan1)
{
index=(threadIdx.x+(blockIdx.x*blockDim.x));
if ((index<((Size-1)-t)))
{
m_cuda[((Size*((index+t)+1))+t)]=(a_cuda[((Size*((index+t)+1))+t)]/a_cuda[((Size*t)+t)]);
}
}
}
}

#pragma fcuda grid x_dim=512 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void Fan1(float * m_cuda, float * a_cuda, int Size, int t, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int enableSignal_cmp_fan1_block0;
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
enableSignal_cmp_fan1_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
#pragma fcuda compute unroll=1 end=false cores=[1] begin=true name=cmp_fan1 
Fan1_cmp_fan1(enableSignal_cmp_fan1_block0, blockDim, gridDim, blockIdx_block0, Size, a_cuda, m_cuda, t);
#pragma fcuda compute unroll=1 end=true cores=[1] begin=false name=cmp_fan1 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=m_cuda_addr remove_port_name=m_cuda_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=a_cuda_addr remove_port_name=a_cuda_core0 port_core=0 
void fcuda1(int m_cuda_addr, int a_cuda_addr, int Size, int t, dim3 gridDim, dim3 blockDim, float * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=m_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=m_cuda_addr 
#pragma HLS INTERFACE ap_none register port=a_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=a_cuda_addr 
#pragma HLS INTERFACE ap_none register port=Size 
#pragma HLS RESOURCE core=AXI4LiteS variable=Size 
#pragma HLS INTERFACE ap_none register port=t 
#pragma HLS RESOURCE core=AXI4LiteS variable=t 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
float * a_cuda_core0;
float * m_cuda_core0;
a_cuda_core0=( & memport_core0_p0[a_cuda_addr]);
m_cuda_core0=( & memport_core0_p0[m_cuda_addr]);
Fan1(m_cuda_core0, a_cuda_core0, Size, t, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_Fan2 = 512, BLOCKDIM_Y_Fan2 = 512;
#pragma fcuda compute name=cmp_fan2 cores=[1] end=false unroll=1 begin=true 
void Fan2_cmp_fan2(int enableSignal_cmp_fan2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int Size, float * a_cuda, float * b_cuda, float * m_cuda, int t)
{
dim3 threadIdx;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int xidx;
int yidx;
if (enableSignal_cmp_fan2)
{
xidx=((blockIdx.x*blockDim.x)+threadIdx.x);
yidx=((blockIdx.y*blockDim.y)+threadIdx.y);
if ((xidx<((Size-1)-t)))
{
if ((yidx<(Size-t)))
{
a_cuda[((Size*((xidx+1)+t))+(yidx+t))]-=(m_cuda[((Size*((xidx+1)+t))+t)]*a_cuda[((Size*t)+(yidx+t))]);
if ((yidx==0))
{
b_cuda[((xidx+1)+t)]-=(m_cuda[((Size*((xidx+1)+t))+(yidx+t))]*b_cuda[t]);
}
}
}
}
}
}

#pragma fcuda grid y_dim=512 x_dim=512 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void Fan2(float * m_cuda, float * a_cuda, float * b_cuda, int Size, int j1, int t, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int enableSignal_cmp_fan2_block0;
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
enableSignal_cmp_fan2_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
#pragma fcuda compute unroll=1 end=false cores=[1] begin=true name=cmp_fan2 
Fan2_cmp_fan2(enableSignal_cmp_fan2_block0, blockDim, gridDim, blockIdx_block0, Size, a_cuda, b_cuda, m_cuda, t);
#pragma fcuda compute unroll=1 end=true cores=[1] begin=false name=cmp_fan2 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=m_cuda_addr remove_port_name=m_cuda_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=a_cuda_addr remove_port_name=a_cuda_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=b_cuda_addr remove_port_name=b_cuda_core0 port_core=0 
void fcuda2(int m_cuda_addr, int a_cuda_addr, int b_cuda_addr, int Size, int j1, int t, dim3 gridDim, dim3 blockDim, float * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=m_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=m_cuda_addr 
#pragma HLS INTERFACE ap_none register port=a_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=a_cuda_addr 
#pragma HLS INTERFACE ap_none register port=b_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=b_cuda_addr 
#pragma HLS INTERFACE ap_none register port=Size 
#pragma HLS RESOURCE core=AXI4LiteS variable=Size 
#pragma HLS INTERFACE ap_none register port=j1 
#pragma HLS RESOURCE core=AXI4LiteS variable=j1 
#pragma HLS INTERFACE ap_none register port=t 
#pragma HLS RESOURCE core=AXI4LiteS variable=t 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
float * a_cuda_core0;
float * b_cuda_core0;
float * m_cuda_core0;
b_cuda_core0=( & memport_core0_p0[b_cuda_addr]);
a_cuda_core0=( & memport_core0_p0[a_cuda_addr]);
m_cuda_core0=( & memport_core0_p0[m_cuda_addr]);
Fan2(m_cuda_core0, a_cuda_core0, b_cuda_core0, Size, j1, t, gridDim, blockDim, 1, 0);
}

void fcuda(int m_cuda_addr, int a_cuda_addr, int Size, int t, dim3 gridDim, dim3 blockDim, float * memport_core0_p0_float, int en_fcuda1, int b_cuda_addr, int j1, int en_fcuda2)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS INTERFACE ap_none register port=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(m_cuda_addr, a_cuda_addr, Size, t, gridDim, blockDim, memport_core0_p0_float);
}
if ((en_fcuda2==1))
{
fcuda2(m_cuda_addr, a_cuda_addr, b_cuda_addr, Size, j1, t, gridDim, blockDim, memport_core0_p0_float);
}
}

