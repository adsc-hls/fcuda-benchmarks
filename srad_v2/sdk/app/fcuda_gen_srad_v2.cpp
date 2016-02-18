#include <fcuda.h>
#include "srad.h"
#include <string.h>
const int BLOCKDIM_X_srad_cuda_1 = 16, BLOCKDIM_Y_srad_cuda_1 = 16;
#pragma fcuda compute array_split=[temp_result] mpart=1 name=compute_w_s end=false cores=[1] unroll=1 begin=true 
void srad_cuda_1_compute_w_s(int enableSignal_compute_w_s, dim3 blockDim, dim3 gridDim, dim3 blockIdx, double * J_cuda, int cols, double east[16][16], double west[16][16])
{
dim3 threadIdx;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int index_e;
int index_w;
if (enableSignal_compute_w_s)
{
index_w=(((((cols*16)*blockIdx.y)+(16*blockIdx.x))+(cols*threadIdx.y))-1);
index_e=(((((cols*16)*blockIdx.y)+(16*blockIdx.x))+(cols*threadIdx.y))+16);
if ((blockIdx.x==0))
{
west[threadIdx.y][threadIdx.x]=J_cuda[(((cols*16)*blockIdx.y)+(cols*threadIdx.y))];
east[threadIdx.y][threadIdx.x]=J_cuda[index_e];
}
else
{
if ((blockIdx.x==(gridDim.x-1)))
{
east[threadIdx.y][threadIdx.x]=J_cuda[((((((cols*16)*blockIdx.y)+(16*(gridDim.x-1)))+(cols*threadIdx.y))+16)-1)];
west[threadIdx.y][threadIdx.x]=J_cuda[index_w];
}
else
{
west[threadIdx.y][threadIdx.x]=J_cuda[index_w];
east[threadIdx.y][threadIdx.x]=J_cuda[index_e];
}
}
}
}
}

#pragma fcuda transfer array_split=[temp_result] mpart=1 dir=[0] name=fetch_temp pointer=[J_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void srad_cuda_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, double * J_cuda, double temp[16][16], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_temp)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_temp_temp_offset+temp[threadIdx.y]), ((J_cuda+fetch_temp_temp_X_0)+(threadIdx.y*fetch_temp_temp_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda compute array_split=[temp_result] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void srad_cuda_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, double * E_C, double * N_C, double * S_C, double * W_C, int cols, double east[16][16], int index, double north[16][16], double q0sqr, double south[16][16], double temp[16][16], double temp_result[16][16], double west[16][16])
{
dim3 threadIdx;
double c;
double den;
double e_block[BLOCKDIM_Y_srad_cuda_1][BLOCKDIM_X_srad_cuda_1];
double g2;
double jc;
double l;
double n_block[BLOCKDIM_Y_srad_cuda_1][BLOCKDIM_X_srad_cuda_1];
double num;
double qsqr;
double s_block[BLOCKDIM_Y_srad_cuda_1][BLOCKDIM_X_srad_cuda_1];
double w_block[BLOCKDIM_Y_srad_cuda_1][BLOCKDIM_X_srad_cuda_1];
if (enableSignal_compute)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
jc=temp[threadIdx.y][threadIdx.x];
if (((threadIdx.y==0)&&(threadIdx.x==0)))
{
n_block[threadIdx.y][threadIdx.x]=(north[threadIdx.y][threadIdx.x]-jc);
s_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y+1)][threadIdx.x]-jc);
w_block[threadIdx.y][threadIdx.x]=(west[threadIdx.y][threadIdx.x]-jc);
e_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x+1)]-jc);
}
else
{
if (((threadIdx.y==0)&&(threadIdx.x==(16-1))))
{
n_block[threadIdx.y][threadIdx.x]=(north[threadIdx.y][threadIdx.x]-jc);
s_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y+1)][threadIdx.x]-jc);
w_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x-1)]-jc);
e_block[threadIdx.y][threadIdx.x]=(east[threadIdx.y][threadIdx.x]-jc);
}
else
{
if (((threadIdx.y==(16-1))&&(threadIdx.x==(16-1))))
{
n_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y-1)][threadIdx.x]-jc);
s_block[threadIdx.y][threadIdx.x]=(south[threadIdx.y][threadIdx.x]-jc);
w_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x-1)]-jc);
e_block[threadIdx.y][threadIdx.x]=(east[threadIdx.y][threadIdx.x]-jc);
}
else
{
if (((threadIdx.y==(16-1))&&(threadIdx.x==0)))
{
n_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y-1)][threadIdx.x]-jc);
s_block[threadIdx.y][threadIdx.x]=(south[threadIdx.y][threadIdx.x]-jc);
w_block[threadIdx.y][threadIdx.x]=(west[threadIdx.y][threadIdx.x]-jc);
e_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x+1)]-jc);
}
else
{
if ((threadIdx.y==0))
{
n_block[threadIdx.y][threadIdx.x]=(north[threadIdx.y][threadIdx.x]-jc);
s_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y+1)][threadIdx.x]-jc);
w_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x-1)]-jc);
e_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x+1)]-jc);
}
else
{
if ((threadIdx.x==(16-1)))
{
n_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y-1)][threadIdx.x]-jc);
s_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y+1)][threadIdx.x]-jc);
w_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x-1)]-jc);
e_block[threadIdx.y][threadIdx.x]=(east[threadIdx.y][threadIdx.x]-jc);
}
else
{
if ((threadIdx.y==(16-1)))
{
n_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y-1)][threadIdx.x]-jc);
s_block[threadIdx.y][threadIdx.x]=(south[threadIdx.y][threadIdx.x]-jc);
w_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x-1)]-jc);
e_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x+1)]-jc);
}
else
{
if ((threadIdx.x==0))
{
n_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y-1)][threadIdx.x]-jc);
s_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y+1)][threadIdx.x]-jc);
w_block[threadIdx.y][threadIdx.x]=(west[threadIdx.y][threadIdx.x]-jc);
e_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x+1)]-jc);
}
else
{
n_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y-1)][threadIdx.x]-jc);
s_block[threadIdx.y][threadIdx.x]=(temp[(threadIdx.y+1)][threadIdx.x]-jc);
w_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x-1)]-jc);
e_block[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][(threadIdx.x+1)]-jc);
}
}
}
}
}
}
}
}
g2=(((((n_block[threadIdx.y][threadIdx.x]*n_block[threadIdx.y][threadIdx.x])+(s_block[threadIdx.y][threadIdx.x]*s_block[threadIdx.y][threadIdx.x]))+(w_block[threadIdx.y][threadIdx.x]*w_block[threadIdx.y][threadIdx.x]))+(e_block[threadIdx.y][threadIdx.x]*e_block[threadIdx.y][threadIdx.x]))/(jc*jc));
l=((((n_block[threadIdx.y][threadIdx.x]+s_block[threadIdx.y][threadIdx.x])+w_block[threadIdx.y][threadIdx.x])+e_block[threadIdx.y][threadIdx.x])/jc);
num=((0.5*g2)-((1.0/16.0)*(l*l)));
den=(1+(0.25*l));
qsqr=(num/(den*den));
den=((qsqr-q0sqr)/(q0sqr*(1+q0sqr)));
c=(1.0/(1.0+den));
if ((c<0))
{
temp_result[threadIdx.y][threadIdx.x]=0;
}
else
{
if ((c>1))
{
temp_result[threadIdx.y][threadIdx.x]=1;
}
else
{
temp_result[threadIdx.y][threadIdx.x]=c;
}
}
}
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
E_C[((index+(cols*threadIdx.y))+threadIdx.x)]=e_block[threadIdx.y][threadIdx.x];
W_C[((index+(cols*threadIdx.y))+threadIdx.x)]=w_block[threadIdx.y][threadIdx.x];
S_C[((index+(cols*threadIdx.y))+threadIdx.x)]=s_block[threadIdx.y][threadIdx.x];
N_C[((index+(cols*threadIdx.y))+threadIdx.x)]=n_block[threadIdx.y][threadIdx.x];
}
}
}

#pragma fcuda transfer array_split=[temp_result] mpart=1 dir=[1] name=write pointer=[C_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void srad_cuda_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, double * C_cuda, double temp_result[16][16], int write_temp_result_offset, int write_temp_result_X_0, int write_temp_result_c_1)
{
dim3 threadIdx;
if (enableSignal_write)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy(((C_cuda+write_temp_result_X_0)+(threadIdx.y*write_temp_result_c_1)), (write_temp_result_offset+temp_result[threadIdx.y]), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[temp_result] mpart=1 dir=[0|0] name=fetch_n pointer=[J_cuda|J_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16|16] 
void srad_cuda_1_fetch_n(int enableSignal_fetch_n, dim3 blockDim, dim3 gridDim, double * J_cuda, double north[16][16], int fetch_n_north_offset, int fetch_n_north_X_0, int fetch_n_north_c_1, double south[16][16], int fetch_n_south_offset, int fetch_n_south_X_0, int fetch_n_south_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_n)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_n_north_offset+north[threadIdx.y]), ((J_cuda+fetch_n_north_X_0)+(threadIdx.y*fetch_n_north_c_1)), (16*sizeof (double)));
}
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_n_south_offset+south[threadIdx.y]), ((J_cuda+fetch_n_south_X_0)+(threadIdx.y*fetch_n_south_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[temp_result] mpart=1 dir=[0|0] name=fetch_s pointer=[J_cuda|J_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16|16] 
void srad_cuda_1_fetch_s(int enableSignal_fetch_s, dim3 blockDim, dim3 gridDim, double * J_cuda, double south[16][16], int fetch_s_south_offset, int fetch_s_south_X_0, int fetch_s_south_c_1, double north[16][16], int fetch_s_north_offset, int fetch_s_north_X_0, int fetch_s_north_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_s)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_s_south_offset+south[threadIdx.y]), ((J_cuda+fetch_s_south_X_0)+(threadIdx.y*fetch_s_south_c_1)), (16*sizeof (double)));
}
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_s_north_offset+north[threadIdx.y]), ((J_cuda+fetch_s_north_X_0)+(threadIdx.y*fetch_s_north_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[temp_result] mpart=1 dir=[0|0] name=fetch_n_s pointer=[J_cuda|J_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16|16] 
void srad_cuda_1_fetch_n_s(int enableSignal_fetch_n_s, dim3 blockDim, dim3 gridDim, double * J_cuda, double north[16][16], int fetch_n_s_north_offset, int fetch_n_s_north_X_0, int fetch_n_s_north_c_1, double south[16][16], int fetch_n_s_south_offset, int fetch_n_s_south_X_0, int fetch_n_s_south_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_n_s)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_n_s_north_offset+north[threadIdx.y]), ((J_cuda+fetch_n_s_north_X_0)+(threadIdx.y*fetch_n_s_north_c_1)), (16*sizeof (double)));
}
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_n_s_south_offset+south[threadIdx.y]), ((J_cuda+fetch_n_s_south_X_0)+(threadIdx.y*fetch_n_s_south_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void srad_cuda_1(double * E_C, double * W_C, double * N_C, double * S_C, double * J_cuda, double * C_cuda, int cols, int rows, double q0sqr, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int index_block0;
int index_n_block0;
int index_s_block0;
double temp_block0[16][16];
double temp_result_block0[16][16];
double north_block0[16][16];
double south_block0[16][16];
double east_block0[16][16];
double west_block0[16][16];
int enableSignal_fetch_n_block0;
int fetch_n_north_offset_block0;
int fetch_n_north_X_0_block0;
int fetch_n_north_c_1_block0;
int fetch_n_south_offset_block0;
int fetch_n_south_X_0_block0;
int fetch_n_south_c_1_block0;
int enableSignal_fetch_s_block0;
int fetch_s_south_offset_block0;
int fetch_s_south_X_0_block0;
int fetch_s_south_c_1_block0;
int fetch_s_north_offset_block0;
int fetch_s_north_X_0_block0;
int fetch_s_north_c_1_block0;
int enableSignal_fetch_n_s_block0;
int fetch_n_s_north_offset_block0;
int fetch_n_s_north_X_0_block0;
int fetch_n_s_north_c_1_block0;
int fetch_n_s_south_offset_block0;
int fetch_n_s_south_X_0_block0;
int fetch_n_s_south_c_1_block0;
int enableSignal_compute_w_s_block0;
int enableSignal_fetch_temp_block0;
int fetch_temp_temp_offset_block0;
int fetch_temp_temp_X_0_block0;
int fetch_temp_temp_c_1_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
int write_temp_result_offset_block0;
int write_temp_result_X_0_block0;
int write_temp_result_c_1_block0;
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
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_temp_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_w_s_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_n_s_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_s_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_n_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
index_block0=(((cols*16)*blockIdx_block0.y)+(16*blockIdx_block0.x));
index_n_block0=((((cols*16)*blockIdx_block0.y)+(16*blockIdx_block0.x))-cols);
index_s_block0=((((cols*16)*blockIdx_block0.y)+(16*blockIdx_block0.x))+(cols*16));
if ((blockIdx_block0.y==0))
{
fetch_n_north_offset_block0=0;
fetch_n_north_X_0_block0=(16*blockIdx_block0.x);
fetch_n_north_c_1_block0=0;
fetch_n_south_offset_block0=0;
fetch_n_south_X_0_block0=index_s_block0;
fetch_n_south_c_1_block0=0;
}
else
{
if ((blockIdx_block0.y==(gridDim.y-1)))
{
fetch_s_south_offset_block0=0;
fetch_s_south_X_0_block0=(((-1*cols)+(16*blockIdx_block0.x))+((16*cols)*gridDim.y));
fetch_s_south_c_1_block0=0;
fetch_s_north_offset_block0=0;
fetch_s_north_X_0_block0=index_n_block0;
fetch_s_north_c_1_block0=0;
}
else
{
fetch_n_s_north_offset_block0=0;
fetch_n_s_north_X_0_block0=index_n_block0;
fetch_n_s_north_c_1_block0=0;
fetch_n_s_south_offset_block0=0;
fetch_n_s_south_X_0_block0=index_s_block0;
fetch_n_s_south_c_1_block0=0;
}
}
srad_cuda_1_fetch_n_s(((enableSignal_fetch_n_s_block0&&(((1+blockIdx_block0.y)+(-1*gridDim.y))!=0))&&(blockIdx_block0.y!=0)), blockDim, gridDim, J_cuda, north_block0, fetch_n_s_north_offset_block0, fetch_n_s_north_X_0_block0, fetch_n_s_north_c_1_block0, south_block0, fetch_n_s_south_offset_block0, fetch_n_s_south_X_0_block0, fetch_n_s_south_c_1_block0);
srad_cuda_1_fetch_s(((enableSignal_fetch_s_block0&&(blockIdx_block0.y==(gridDim.y-1)))&&(blockIdx_block0.y!=0)), blockDim, gridDim, J_cuda, south_block0, fetch_s_south_offset_block0, fetch_s_south_X_0_block0, fetch_s_south_c_1_block0, north_block0, fetch_s_north_offset_block0, fetch_s_north_X_0_block0, fetch_s_north_c_1_block0);
srad_cuda_1_fetch_n((enableSignal_fetch_n_block0&&(blockIdx_block0.y==0)), blockDim, gridDim, J_cuda, north_block0, fetch_n_north_offset_block0, fetch_n_north_X_0_block0, fetch_n_north_c_1_block0, south_block0, fetch_n_south_offset_block0, fetch_n_south_X_0_block0, fetch_n_south_c_1_block0);
#pragma fcuda compute array_split=[temp_result] mpart=1 name=compute_w_s unroll=1 cores=[1] end=false begin=true 
srad_cuda_1_compute_w_s(enableSignal_compute_w_s_block0, blockDim, gridDim, blockIdx_block0, J_cuda, cols, east_block0, west_block0);
#pragma fcuda compute array_split=[temp_result] mpart=1 name=compute_w_s unroll=1 cores=[1] end=true begin=false 
fetch_temp_temp_offset_block0=0;
fetch_temp_temp_X_0_block0=index_block0;
fetch_temp_temp_c_1_block0=cols;
#pragma fcuda transfer array_split=[temp_result] mpart=1 dir=[0] name=fetch_temp pointer=[J_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
srad_cuda_1_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, J_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[temp_result] mpart=1 dir=[0] name=fetch_temp pointer=[J_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
#pragma fcuda compute array_split=[temp_result] mpart=1 name=compute unroll=1 cores=[1] end=false begin=true 
srad_cuda_1_compute(enableSignal_compute_block0, blockDim, gridDim, blockIdx_block0, E_C, N_C, S_C, W_C, cols, east_block0, index_block0, north_block0, q0sqr, south_block0, temp_block0, temp_result_block0, west_block0);
#pragma fcuda compute array_split=[temp_result] mpart=1 name=compute unroll=1 cores=[1] end=true begin=false 
write_temp_result_offset_block0=0;
write_temp_result_X_0_block0=index_block0;
write_temp_result_c_1_block0=cols;
#pragma fcuda transfer array_split=[temp_result] mpart=1 dir=[1] name=write pointer=[C_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
srad_cuda_1_write(enableSignal_write_block0, blockDim, gridDim, C_cuda, temp_result_block0, write_temp_result_offset_block0, write_temp_result_X_0_block0, write_temp_result_c_1_block0);
#pragma fcuda transfer array_split=[temp_result] mpart=1 dir=[1] name=write pointer=[C_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=E_C_addr remove_port_name=E_C_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=W_C_addr remove_port_name=W_C_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=N_C_addr remove_port_name=N_C_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=S_C_addr remove_port_name=S_C_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=J_cuda_addr remove_port_name=J_cuda_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=C_cuda_addr remove_port_name=C_cuda_core0 port_core=0 
void fcuda1(int E_C_addr, int W_C_addr, int N_C_addr, int S_C_addr, int J_cuda_addr, int C_cuda_addr, int cols, int rows, double q0sqr, dim3 gridDim, dim3 blockDim, double * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=E_C_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=E_C_addr 
#pragma HLS INTERFACE ap_none register port=W_C_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=W_C_addr 
#pragma HLS INTERFACE ap_none register port=N_C_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=N_C_addr 
#pragma HLS INTERFACE ap_none register port=S_C_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=S_C_addr 
#pragma HLS INTERFACE ap_none register port=J_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=J_cuda_addr 
#pragma HLS INTERFACE ap_none register port=C_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=C_cuda_addr 
#pragma HLS INTERFACE ap_none register port=cols 
#pragma HLS RESOURCE core=AXI4LiteS variable=cols 
#pragma HLS INTERFACE ap_none register port=rows 
#pragma HLS RESOURCE core=AXI4LiteS variable=rows 
#pragma HLS INTERFACE ap_none register port=q0sqr 
#pragma HLS RESOURCE core=AXI4LiteS variable=q0sqr 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
double * W_C_core0;
double * N_C_core0;
double * S_C_core0;
double * J_cuda_core0;
double * C_cuda_core0;
double * E_C_core0;
C_cuda_core0=( & memport_core0_p0[C_cuda_addr]);
J_cuda_core0=( & memport_core0_p0[J_cuda_addr]);
S_C_core0=( & memport_core0_p0[S_C_addr]);
N_C_core0=( & memport_core0_p0[N_C_addr]);
W_C_core0=( & memport_core0_p0[W_C_addr]);
E_C_core0=( & memport_core0_p0[E_C_addr]);
srad_cuda_1(E_C_core0, W_C_core0, N_C_core0, S_C_core0, J_cuda_core0, C_cuda_core0, cols, rows, q0sqr, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_srad_cuda_2 = 16, BLOCKDIM_Y_srad_cuda_2 = 16;
#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[0] name=fetch_temp pointer=[J_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void srad_cuda_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, double * J_cuda, double temp[16][16], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_temp)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_temp_temp_offset+temp[threadIdx.y]), ((J_cuda+fetch_temp_temp_X_0)+(threadIdx.y*fetch_temp_temp_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda compute array_split=[c_cuda_result] mpart=1 name=compute1 end=false cores=[1] unroll=1 begin=true 
void srad_cuda_2_compute1(int enableSignal_compute1, dim3 blockDim, dim3 gridDim, dim3 blockIdx, double * C_cuda, int cols, double east_c[16][16])
{
dim3 threadIdx;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int index_e;
if (enableSignal_compute1)
{
index_e=(((((cols*16)*blockIdx.y)+(16*blockIdx.x))+(cols*threadIdx.y))+16);
if ((blockIdx.x==(gridDim.x-1)))
{
east_c[threadIdx.y][threadIdx.x]=C_cuda[((((((cols*16)*blockIdx.y)+(16*(gridDim.x-1)))+(cols*threadIdx.y))+16)-1)];
}
else
{
east_c[threadIdx.y][threadIdx.x]=C_cuda[index_e];
}
}
}
}

#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[0] name=fetch_c_cuda_temp pointer=[C_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void srad_cuda_2_fetch_c_cuda_temp(int enableSignal_fetch_c_cuda_temp, dim3 blockDim, dim3 gridDim, double * C_cuda, double c_cuda_temp[16][16], int fetch_c_cuda_temp_c_cuda_temp_offset, int fetch_c_cuda_temp_c_cuda_temp_X_0, int fetch_c_cuda_temp_c_cuda_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_c_cuda_temp)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_c_cuda_temp_c_cuda_temp_offset+c_cuda_temp[threadIdx.y]), ((C_cuda+fetch_c_cuda_temp_c_cuda_temp_X_0)+(threadIdx.y*fetch_c_cuda_temp_c_cuda_temp_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda compute array_split=[c_cuda_result] mpart=1 name=compute2 end=false cores=[1] unroll=1 begin=true 
void srad_cuda_2_compute2(int enableSignal_compute2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, double * E_C, double * N_C, double * S_C, double * W_C, double c_cuda_result[16][16], double c_cuda_temp[16][16], int cols, double east_c[16][16], int index, double lambda, double south_c[16][16], double temp[16][16])
{
dim3 threadIdx;
double cc;
double ce_block[BLOCKDIM_Y_srad_cuda_2][BLOCKDIM_X_srad_cuda_2];
double cn_block[BLOCKDIM_Y_srad_cuda_2][BLOCKDIM_X_srad_cuda_2];
double cs_block[BLOCKDIM_Y_srad_cuda_2][BLOCKDIM_X_srad_cuda_2];
double cw_block[BLOCKDIM_Y_srad_cuda_2][BLOCKDIM_X_srad_cuda_2];
double d_sum;
if (enableSignal_compute2)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
cc=c_cuda_temp[threadIdx.y][threadIdx.x];
if (((threadIdx.y==(16-1))&&(threadIdx.x==(16-1))))
{
cn_block[threadIdx.y][threadIdx.x]=cc;
cs_block[threadIdx.y][threadIdx.x]=south_c[threadIdx.y][threadIdx.x];
cw_block[threadIdx.y][threadIdx.x]=cc;
ce_block[threadIdx.y][threadIdx.x]=east_c[threadIdx.y][threadIdx.x];
}
else
{
if ((threadIdx.x==(16-1)))
{
cn_block[threadIdx.y][threadIdx.x]=cc;
cs_block[threadIdx.y][threadIdx.x]=c_cuda_temp[(threadIdx.y+1)][threadIdx.x];
cw_block[threadIdx.y][threadIdx.x]=cc;
ce_block[threadIdx.y][threadIdx.x]=east_c[threadIdx.y][threadIdx.x];
}
else
{
if ((threadIdx.y==(16-1)))
{
cn_block[threadIdx.y][threadIdx.x]=cc;
cs_block[threadIdx.y][threadIdx.x]=south_c[threadIdx.y][threadIdx.x];
cw_block[threadIdx.y][threadIdx.x]=cc;
ce_block[threadIdx.y][threadIdx.x]=c_cuda_temp[threadIdx.y][(threadIdx.x+1)];
}
else
{
cn_block[threadIdx.y][threadIdx.x]=cc;
cs_block[threadIdx.y][threadIdx.x]=c_cuda_temp[(threadIdx.y+1)][threadIdx.x];
cw_block[threadIdx.y][threadIdx.x]=cc;
ce_block[threadIdx.y][threadIdx.x]=c_cuda_temp[threadIdx.y][(threadIdx.x+1)];
}
}
}
}
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
d_sum=((((cn_block[threadIdx.y][threadIdx.x]*N_C[((index+(cols*threadIdx.y))+threadIdx.x)])+(cs_block[threadIdx.y][threadIdx.x]*S_C[((index+(cols*threadIdx.y))+threadIdx.x)]))+(cw_block[threadIdx.y][threadIdx.x]*W_C[((index+(cols*threadIdx.y))+threadIdx.x)]))+(ce_block[threadIdx.y][threadIdx.x]*E_C[((index+(cols*threadIdx.y))+threadIdx.x)]));
c_cuda_result[threadIdx.y][threadIdx.x]=(temp[threadIdx.y][threadIdx.x]+((0.25*lambda)*d_sum));
}
}
}

#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[1] name=write pointer=[J_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void srad_cuda_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, double * J_cuda, double c_cuda_result[16][16], int write_c_cuda_result_offset, int write_c_cuda_result_X_0, int write_c_cuda_result_c_1)
{
dim3 threadIdx;
if (enableSignal_write)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy(((J_cuda+write_c_cuda_result_X_0)+(threadIdx.y*write_c_cuda_result_c_1)), (write_c_cuda_result_offset+c_cuda_result[threadIdx.y]), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[0] name=fetch_south_c_2 pointer=[C_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void srad_cuda_2_fetch_south_c_2(int enableSignal_fetch_south_c_2, dim3 blockDim, dim3 gridDim, double * C_cuda, double south_c[16][16], int fetch_south_c_2_south_c_offset, int fetch_south_c_2_south_c_X_0, int fetch_south_c_2_south_c_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_south_c_2)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_south_c_2_south_c_offset+south_c[threadIdx.y]), ((C_cuda+fetch_south_c_2_south_c_X_0)+(threadIdx.y*fetch_south_c_2_south_c_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[0] name=fetch_south_c_1 pointer=[C_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void srad_cuda_2_fetch_south_c_1(int enableSignal_fetch_south_c_1, dim3 blockDim, dim3 gridDim, double * C_cuda, double south_c[16][16], int fetch_south_c_1_south_c_offset, int fetch_south_c_1_south_c_X_0, int fetch_south_c_1_south_c_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_south_c_1)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_south_c_1_south_c_offset+south_c[threadIdx.y]), ((C_cuda+fetch_south_c_1_south_c_X_0)+(threadIdx.y*fetch_south_c_1_south_c_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void srad_cuda_2(double * E_C, double * W_C, double * N_C, double * S_C, double * J_cuda, double * C_cuda, int cols, int rows, double lambda, double q0sqr, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int index_block0;
int index_s_block0;
double south_c_block0[16][16];
double east_c_block0[16][16];
double c_cuda_temp_block0[16][16];
double c_cuda_result_block0[16][16];
double temp_block0[16][16];
int enableSignal_fetch_temp_block0;
int fetch_temp_temp_offset_block0;
int fetch_temp_temp_X_0_block0;
int fetch_temp_temp_c_1_block0;
int enableSignal_fetch_south_c_2_block0;
int fetch_south_c_2_south_c_offset_block0;
int fetch_south_c_2_south_c_X_0_block0;
int fetch_south_c_2_south_c_c_1_block0;
int enableSignal_fetch_south_c_1_block0;
int fetch_south_c_1_south_c_offset_block0;
int fetch_south_c_1_south_c_X_0_block0;
int fetch_south_c_1_south_c_c_1_block0;
int enableSignal_compute1_block0;
int enableSignal_fetch_c_cuda_temp_block0;
int fetch_c_cuda_temp_c_cuda_temp_offset_block0;
int fetch_c_cuda_temp_c_cuda_temp_X_0_block0;
int fetch_c_cuda_temp_c_cuda_temp_c_1_block0;
int enableSignal_compute2_block0;
int enableSignal_write_block0;
int write_c_cuda_result_offset_block0;
int write_c_cuda_result_X_0_block0;
int write_c_cuda_result_c_1_block0;
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
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute2_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_c_cuda_temp_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute1_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_south_c_1_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_south_c_2_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_temp_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
index_block0=(((cols*16)*blockIdx_block0.y)+(16*blockIdx_block0.x));
index_s_block0=((((cols*16)*blockIdx_block0.y)+(16*blockIdx_block0.x))+(cols*16));
fetch_temp_temp_offset_block0=0;
fetch_temp_temp_X_0_block0=index_block0;
fetch_temp_temp_c_1_block0=cols;
#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[0] name=fetch_temp pointer=[J_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
srad_cuda_2_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, J_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[0] name=fetch_temp pointer=[J_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
if ((blockIdx_block0.y==(gridDim.y-1)))
{
fetch_south_c_2_south_c_offset_block0=0;
fetch_south_c_2_south_c_X_0_block0=(((-1*cols)+(16*blockIdx_block0.x))+((16*cols)*gridDim.y));
fetch_south_c_2_south_c_c_1_block0=0;
}
else
{
fetch_south_c_1_south_c_offset_block0=0;
fetch_south_c_1_south_c_X_0_block0=index_s_block0;
fetch_south_c_1_south_c_c_1_block0=0;
}
srad_cuda_2_fetch_south_c_1((enableSignal_fetch_south_c_1_block0&&(((1+blockIdx_block0.y)+(-1*gridDim.y))!=0)), blockDim, gridDim, C_cuda, south_c_block0, fetch_south_c_1_south_c_offset_block0, fetch_south_c_1_south_c_X_0_block0, fetch_south_c_1_south_c_c_1_block0);
srad_cuda_2_fetch_south_c_2((enableSignal_fetch_south_c_2_block0&&(blockIdx_block0.y==(gridDim.y-1))), blockDim, gridDim, C_cuda, south_c_block0, fetch_south_c_2_south_c_offset_block0, fetch_south_c_2_south_c_X_0_block0, fetch_south_c_2_south_c_c_1_block0);
#pragma fcuda compute array_split=[c_cuda_result] mpart=1 name=compute1 unroll=1 cores=[1] end=false begin=true 
srad_cuda_2_compute1(enableSignal_compute1_block0, blockDim, gridDim, blockIdx_block0, C_cuda, cols, east_c_block0);
#pragma fcuda compute array_split=[c_cuda_result] mpart=1 name=compute1 unroll=1 cores=[1] end=true begin=false 
fetch_c_cuda_temp_c_cuda_temp_offset_block0=0;
fetch_c_cuda_temp_c_cuda_temp_X_0_block0=index_block0;
fetch_c_cuda_temp_c_cuda_temp_c_1_block0=cols;
#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[0] name=fetch_c_cuda_temp pointer=[C_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
srad_cuda_2_fetch_c_cuda_temp(enableSignal_fetch_c_cuda_temp_block0, blockDim, gridDim, C_cuda, c_cuda_temp_block0, fetch_c_cuda_temp_c_cuda_temp_offset_block0, fetch_c_cuda_temp_c_cuda_temp_X_0_block0, fetch_c_cuda_temp_c_cuda_temp_c_1_block0);
#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[0] name=fetch_c_cuda_temp pointer=[C_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
#pragma fcuda compute array_split=[c_cuda_result] mpart=1 name=compute2 unroll=1 cores=[1] end=false begin=true 
srad_cuda_2_compute2(enableSignal_compute2_block0, blockDim, gridDim, blockIdx_block0, E_C, N_C, S_C, W_C, c_cuda_result_block0, c_cuda_temp_block0, cols, east_c_block0, index_block0, lambda, south_c_block0, temp_block0);
#pragma fcuda compute array_split=[c_cuda_result] mpart=1 name=compute2 unroll=1 cores=[1] end=true begin=false 
write_c_cuda_result_offset_block0=0;
write_c_cuda_result_X_0_block0=index_block0;
write_c_cuda_result_c_1_block0=cols;
#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[1] name=write pointer=[J_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
srad_cuda_2_write(enableSignal_write_block0, blockDim, gridDim, J_cuda, c_cuda_result_block0, write_c_cuda_result_offset_block0, write_c_cuda_result_X_0_block0, write_c_cuda_result_c_1_block0);
#pragma fcuda transfer array_split=[c_cuda_result] mpart=1 dir=[1] name=write pointer=[J_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=E_C_addr remove_port_name=E_C_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=W_C_addr remove_port_name=W_C_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=N_C_addr remove_port_name=N_C_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=S_C_addr remove_port_name=S_C_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=J_cuda_addr remove_port_name=J_cuda_core0 port_core=0 
#pragma fcuda portmerge port_id=0 offset=C_cuda_addr remove_port_name=C_cuda_core0 port_core=0 
void fcuda2(int E_C_addr, int W_C_addr, int N_C_addr, int S_C_addr, int J_cuda_addr, int C_cuda_addr, int cols, int rows, double lambda, double q0sqr, dim3 gridDim, dim3 blockDim, double * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=E_C_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=E_C_addr 
#pragma HLS INTERFACE ap_none register port=W_C_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=W_C_addr 
#pragma HLS INTERFACE ap_none register port=N_C_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=N_C_addr 
#pragma HLS INTERFACE ap_none register port=S_C_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=S_C_addr 
#pragma HLS INTERFACE ap_none register port=J_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=J_cuda_addr 
#pragma HLS INTERFACE ap_none register port=C_cuda_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=C_cuda_addr 
#pragma HLS INTERFACE ap_none register port=cols 
#pragma HLS RESOURCE core=AXI4LiteS variable=cols 
#pragma HLS INTERFACE ap_none register port=rows 
#pragma HLS RESOURCE core=AXI4LiteS variable=rows 
#pragma HLS INTERFACE ap_none register port=lambda 
#pragma HLS RESOURCE core=AXI4LiteS variable=lambda 
#pragma HLS INTERFACE ap_none register port=q0sqr 
#pragma HLS RESOURCE core=AXI4LiteS variable=q0sqr 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
double * W_C_core0;
double * N_C_core0;
double * S_C_core0;
double * J_cuda_core0;
double * C_cuda_core0;
double * E_C_core0;
C_cuda_core0=( & memport_core0_p0[C_cuda_addr]);
J_cuda_core0=( & memport_core0_p0[J_cuda_addr]);
S_C_core0=( & memport_core0_p0[S_C_addr]);
N_C_core0=( & memport_core0_p0[N_C_addr]);
W_C_core0=( & memport_core0_p0[W_C_addr]);
E_C_core0=( & memport_core0_p0[E_C_addr]);
srad_cuda_2(E_C_core0, W_C_core0, N_C_core0, S_C_core0, J_cuda_core0, C_cuda_core0, cols, rows, lambda, q0sqr, gridDim, blockDim, 1, 0);
}

void fcuda(int E_C_addr, int W_C_addr, int N_C_addr, int S_C_addr, int J_cuda_addr, int C_cuda_addr, int cols, int rows, double q0sqr, dim3 gridDim, dim3 blockDim, double * memport_core0_p0_double, int en_fcuda1, double lambda, int en_fcuda2)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS INTERFACE ap_none register port=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(E_C_addr, W_C_addr, N_C_addr, S_C_addr, J_cuda_addr, C_cuda_addr, cols, rows, q0sqr, gridDim, blockDim, memport_core0_p0_double);
}
if ((en_fcuda2==1))
{
fcuda2(E_C_addr, W_C_addr, N_C_addr, S_C_addr, J_cuda_addr, C_cuda_addr, cols, rows, lambda, q0sqr, gridDim, blockDim, memport_core0_p0_double);
}
}

