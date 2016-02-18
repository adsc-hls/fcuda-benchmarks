#include <fcuda.h>
#include "lud.h"
const int BLOCKDIM_X_lud_diagonal = 16;
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void lud_diagonal_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int i, double shadow[16][16])
{
dim3 threadIdx;
int j;
if (enableSignal_compute)
{
i=0;
while (i<(16-1))
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((threadIdx.x>i))
{
for (j=0; j<i; j ++ )
{
shadow[threadIdx.x][i]-=(shadow[threadIdx.x][j]*shadow[j][i]);
}
shadow[threadIdx.x][i]/=shadow[i][i];
}
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((threadIdx.x>i))
{
for (j=0; j<(i+1); j ++ )
{
shadow[(i+1)][threadIdx.x]-=(shadow[(i+1)][j]*shadow[j][threadIdx.x]);
}
}
}
i ++ ;
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch pointer=[m] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void lud_diagonal_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, double * m, double shadow[16][16], int fetch_shadow_offset, int i, int fetch_shadow_X_0, int fetch_shadow_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch)
{
{
memcpy((fetch_shadow_offset+shadow[i]), ((fetch_shadow_X_0+m)+(threadIdx.y*fetch_shadow_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[m] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void lud_diagonal_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, double * m, double shadow[16][16], int write_shadow_offset, int i, int write_shadow_X_0, int write_shadow_c_1)
{
dim3 threadIdx;
if (enableSignal_write)
{
{
memcpy(((m+write_shadow_X_0)+(threadIdx.y*write_shadow_c_1)), (write_shadow_offset+shadow[i]), (16*sizeof (double)));
}
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void lud_diagonal(double * m, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int i_block0;
int array_offset_block0;
double shadow_block0[16][16];
int enableSignal_fetch_block0;
int fetch_shadow_offset_block0;
int fetch_shadow_X_0_block0;
int fetch_shadow_c_1_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
int write_shadow_offset_block0;
int write_shadow_X_0_block0;
int write_shadow_c_1_block0;
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
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
array_offset_block0=((offset*matrix_dim)+offset);
whileLoopGuard_0_block0=1;
i_block0=0;
while (1)
{
whileLoopGuard_0_block0&=i_block0<16;
if (( ! whileLoopGuard_0_block0))
{
break;
}
if (whileLoopGuard_0_block0)
{
fetch_shadow_offset_block0=0;
fetch_shadow_X_0_block0=array_offset_block0;
fetch_shadow_c_1_block0=0;
}
lud_diagonal_fetch((enableSignal_fetch_block0&&whileLoopGuard_0_block0), blockDim, gridDim, m, shadow_block0, fetch_shadow_offset_block0, i_block0, fetch_shadow_X_0_block0, fetch_shadow_c_1_block0);
if (whileLoopGuard_0_block0)
{
array_offset_block0+=matrix_dim;
i_block0 ++ ;
}
}
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 cores=[1] end=false begin=true 
lud_diagonal_compute(enableSignal_compute_block0, blockDim, gridDim, blockIdx_block0, i_block0, shadow_block0);
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 cores=[1] end=true begin=false 
array_offset_block0=(((offset+1)*matrix_dim)+offset);
whileLoopGuard_1_block0=1;
i_block0=1;
while (1)
{
whileLoopGuard_1_block0&=i_block0<16;
if (( ! whileLoopGuard_1_block0))
{
break;
}
if (whileLoopGuard_1_block0)
{
write_shadow_offset_block0=0;
write_shadow_X_0_block0=array_offset_block0;
write_shadow_c_1_block0=0;
}
lud_diagonal_write((enableSignal_write_block0&&whileLoopGuard_1_block0), blockDim, gridDim, m, shadow_block0, write_shadow_offset_block0, i_block0, write_shadow_X_0_block0, write_shadow_c_1_block0);
if (whileLoopGuard_1_block0)
{
array_offset_block0+=matrix_dim;
i_block0 ++ ;
}
}
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=m_addr remove_port_name=m_core0 port_core=0 
void fcuda1(int m_addr, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, double * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=m_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=m_addr 
#pragma HLS INTERFACE ap_none register port=matrix_dim 
#pragma HLS RESOURCE core=AXI4LiteS variable=matrix_dim 
#pragma HLS INTERFACE ap_none register port=offset 
#pragma HLS RESOURCE core=AXI4LiteS variable=offset 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
double * m_core0;
m_core0=( & memport_core0_p0[m_addr]);
lud_diagonal(m_core0, matrix_dim, offset, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_lud_perimeter = 32;
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void lud_perimeter_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, double dia[32][32], int i, double peri_col[32][32], double peri_row[32][32])
{
dim3 threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int idx1;
int j;
if (enableSignal_compute)
{
if ((threadIdx.x<16))
{
idx1=threadIdx.x;
for (i=1; i<16; i ++ )
{
for (j=0; j<i; j ++ )
{
peri_row[i][idx1]-=(dia[i][j]*peri_row[j][idx1]);
}
}
}
else
{
idx1=(threadIdx.x-16);
for (i=0; i<16; i ++ )
{
for (j=0; j<i; j ++ )
{
peri_col[idx1][i]-=(peri_col[idx1][j]*dia[j][i]);
}
peri_col[idx1][i]/=dia[i][i];
}
}
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch1 pointer=[m] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void lud_perimeter_fetch1(int enableSignal_fetch1, dim3 blockDim, dim3 gridDim, double * m, double dia[32][32], int fetch1_dia_offset, int i, int fetch1_dia_X_0, int fetch1_dia_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch1)
{
{
memcpy((fetch1_dia_offset+dia[i]), ((fetch1_dia_X_0+m)+(threadIdx.y*fetch1_dia_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch2 pointer=[m] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void lud_perimeter_fetch2(int enableSignal_fetch2, dim3 blockDim, dim3 gridDim, double * m, double peri_row[32][32], int fetch2_peri_row_offset, int i, int fetch2_peri_row_X_0, int fetch2_peri_row_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch2)
{
{
memcpy((fetch2_peri_row_offset+peri_row[i]), ((fetch2_peri_row_X_0+m)+(threadIdx.y*fetch2_peri_row_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch3 pointer=[m] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void lud_perimeter_fetch3(int enableSignal_fetch3, dim3 blockDim, dim3 gridDim, double * m, double dia[32][32], int fetch3_dia_offset, int i, int fetch3_dia_X_0, int fetch3_dia_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch3)
{
{
memcpy((fetch3_dia_offset+dia[i]), ((fetch3_dia_X_0+m)+(threadIdx.y*fetch3_dia_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch4 pointer=[m] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void lud_perimeter_fetch4(int enableSignal_fetch4, dim3 blockDim, dim3 gridDim, double * m, double peri_col[32][32], int fetch4_peri_col_offset, int i, int fetch4_peri_col_X_0, int fetch4_peri_col_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch4)
{
{
memcpy((fetch4_peri_col_offset+peri_col[i]), ((fetch4_peri_col_X_0+m)+(threadIdx.y*fetch4_peri_col_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write1 pointer=[m] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void lud_perimeter_write1(int enableSignal_write1, dim3 blockDim, dim3 gridDim, double * m, double peri_row[32][32], int write1_peri_row_offset, int i, int write1_peri_row_X_0, int write1_peri_row_c_1)
{
dim3 threadIdx;
if (enableSignal_write1)
{
{
memcpy(((m+write1_peri_row_X_0)+(threadIdx.y*write1_peri_row_c_1)), (write1_peri_row_offset+peri_row[i]), (16*sizeof (double)));
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write2 pointer=[m] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void lud_perimeter_write2(int enableSignal_write2, dim3 blockDim, dim3 gridDim, double * m, double peri_col[32][32], int write2_peri_col_offset, int i, int write2_peri_col_X_0, int write2_peri_col_c_1)
{
dim3 threadIdx;
if (enableSignal_write2)
{
{
memcpy(((m+write2_peri_col_X_0)+(threadIdx.y*write2_peri_col_c_1)), (write2_peri_col_offset+peri_col[i]), (16*sizeof (double)));
}
}
}

#pragma fcuda grid x_dim=32 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void lud_perimeter(double * m, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
double dia_block0[32][32];
double peri_row_block0[32][32];
double peri_col_block0[32][32];
int i_block0;
int array_offset_block0;
int enableSignal_fetch1_block0;
int fetch1_dia_offset_block0;
int fetch1_dia_X_0_block0;
int fetch1_dia_c_1_block0;
int enableSignal_fetch2_block0;
int fetch2_peri_row_offset_block0;
int fetch2_peri_row_X_0_block0;
int fetch2_peri_row_c_1_block0;
int enableSignal_fetch3_block0;
int fetch3_dia_offset_block0;
int fetch3_dia_X_0_block0;
int fetch3_dia_c_1_block0;
int enableSignal_fetch4_block0;
int fetch4_peri_col_offset_block0;
int fetch4_peri_col_X_0_block0;
int fetch4_peri_col_c_1_block0;
int enableSignal_compute_block0;
int enableSignal_write1_block0;
int write1_peri_row_offset_block0;
int write1_peri_row_X_0_block0;
int write1_peri_row_c_1_block0;
int enableSignal_write2_block0;
int write2_peri_col_offset_block0;
int write2_peri_col_X_0_block0;
int write2_peri_col_c_1_block0;
dim3 blockIdx_block0;
int whileLoopGuard_2_block0;
int whileLoopGuard_3_block0;
int whileLoopGuard_4_block0;
int whileLoopGuard_5_block0;
int whileLoopGuard_6_block0;
int whileLoopGuard_7_block0;
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
enableSignal_write2_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_write1_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch4_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch3_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch2_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch1_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
array_offset_block0=((offset*matrix_dim)+offset);
whileLoopGuard_2_block0=1;
i_block0=0;
while (1)
{
whileLoopGuard_2_block0&=i_block0<(16/2);
if (( ! whileLoopGuard_2_block0))
{
break;
}
if (whileLoopGuard_2_block0)
{
fetch1_dia_offset_block0=0;
fetch1_dia_X_0_block0=array_offset_block0;
fetch1_dia_c_1_block0=0;
}
lud_perimeter_fetch1((enableSignal_fetch1_block0&&whileLoopGuard_2_block0), blockDim, gridDim, m, dia_block0, fetch1_dia_offset_block0, i_block0, fetch1_dia_X_0_block0, fetch1_dia_c_1_block0);
if (whileLoopGuard_2_block0)
{
array_offset_block0+=matrix_dim;
i_block0 ++ ;
}
}
array_offset_block0=((offset*matrix_dim)+offset);
whileLoopGuard_3_block0=1;
i_block0=0;
while (1)
{
whileLoopGuard_3_block0&=i_block0<16;
if (( ! whileLoopGuard_3_block0))
{
break;
}
if (whileLoopGuard_3_block0)
{
fetch2_peri_row_offset_block0=0;
fetch2_peri_row_X_0_block0=((16+array_offset_block0)+(16*blockIdx_block0.x));
fetch2_peri_row_c_1_block0=0;
}
lud_perimeter_fetch2((enableSignal_fetch2_block0&&whileLoopGuard_3_block0), blockDim, gridDim, m, peri_row_block0, fetch2_peri_row_offset_block0, i_block0, fetch2_peri_row_X_0_block0, fetch2_peri_row_c_1_block0);
if (whileLoopGuard_3_block0)
{
array_offset_block0+=matrix_dim;
i_block0 ++ ;
}
}
array_offset_block0=(((offset+(16/2))*matrix_dim)+offset);
whileLoopGuard_4_block0=1;
i_block0=(16/2);
while (1)
{
whileLoopGuard_4_block0&=i_block0<16;
if (( ! whileLoopGuard_4_block0))
{
break;
}
if (whileLoopGuard_4_block0)
{
fetch3_dia_offset_block0=0;
fetch3_dia_X_0_block0=array_offset_block0;
fetch3_dia_c_1_block0=0;
}
lud_perimeter_fetch3((enableSignal_fetch3_block0&&whileLoopGuard_4_block0), blockDim, gridDim, m, dia_block0, fetch3_dia_offset_block0, i_block0, fetch3_dia_X_0_block0, fetch3_dia_c_1_block0);
if (whileLoopGuard_4_block0)
{
array_offset_block0+=matrix_dim;
i_block0 ++ ;
}
}
array_offset_block0=(((offset+((blockIdx_block0.x+1)*16))*matrix_dim)+offset);
whileLoopGuard_5_block0=1;
i_block0=0;
while (1)
{
whileLoopGuard_5_block0&=i_block0<16;
if (( ! whileLoopGuard_5_block0))
{
break;
}
if (whileLoopGuard_5_block0)
{
fetch4_peri_col_offset_block0=0;
fetch4_peri_col_X_0_block0=array_offset_block0;
fetch4_peri_col_c_1_block0=0;
}
lud_perimeter_fetch4((enableSignal_fetch4_block0&&whileLoopGuard_5_block0), blockDim, gridDim, m, peri_col_block0, fetch4_peri_col_offset_block0, i_block0, fetch4_peri_col_X_0_block0, fetch4_peri_col_c_1_block0);
if (whileLoopGuard_5_block0)
{
array_offset_block0+=matrix_dim;
i_block0 ++ ;
}
}
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 cores=[1] end=false begin=true 
lud_perimeter_compute(enableSignal_compute_block0, blockDim, gridDim, blockIdx_block0, dia_block0, i_block0, peri_col_block0, peri_row_block0);
#pragma fcuda compute array_split=[] mpart=1 name=compute unroll=1 cores=[1] end=true begin=false 
array_offset_block0=(((offset+1)*matrix_dim)+offset);
whileLoopGuard_6_block0=1;
i_block0=1;
while (1)
{
whileLoopGuard_6_block0&=i_block0<16;
if (( ! whileLoopGuard_6_block0))
{
break;
}
if (whileLoopGuard_6_block0)
{
write1_peri_row_offset_block0=0;
write1_peri_row_X_0_block0=((16+array_offset_block0)+(16*blockIdx_block0.x));
write1_peri_row_c_1_block0=0;
}
lud_perimeter_write1((enableSignal_write1_block0&&whileLoopGuard_6_block0), blockDim, gridDim, m, peri_row_block0, write1_peri_row_offset_block0, i_block0, write1_peri_row_X_0_block0, write1_peri_row_c_1_block0);
if (whileLoopGuard_6_block0)
{
array_offset_block0+=matrix_dim;
i_block0 ++ ;
}
}
array_offset_block0=(((offset+((blockIdx_block0.x+1)*16))*matrix_dim)+offset);
whileLoopGuard_7_block0=1;
i_block0=0;
while (1)
{
whileLoopGuard_7_block0&=i_block0<16;
if (( ! whileLoopGuard_7_block0))
{
break;
}
if (whileLoopGuard_7_block0)
{
write2_peri_col_offset_block0=0;
write2_peri_col_X_0_block0=array_offset_block0;
write2_peri_col_c_1_block0=0;
}
lud_perimeter_write2((enableSignal_write2_block0&&whileLoopGuard_7_block0), blockDim, gridDim, m, peri_col_block0, write2_peri_col_offset_block0, i_block0, write2_peri_col_X_0_block0, write2_peri_col_c_1_block0);
if (whileLoopGuard_7_block0)
{
array_offset_block0+=matrix_dim;
i_block0 ++ ;
}
}
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=m_addr remove_port_name=m_core0 port_core=0 
void fcuda2(int m_addr, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, double * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=m_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=m_addr 
#pragma HLS INTERFACE ap_none register port=matrix_dim 
#pragma HLS RESOURCE core=AXI4LiteS variable=matrix_dim 
#pragma HLS INTERFACE ap_none register port=offset 
#pragma HLS RESOURCE core=AXI4LiteS variable=offset 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
double * m_core0;
m_core0=( & memport_core0_p0[m_addr]);
lud_perimeter(m_core0, matrix_dim, offset, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_lud_internal = 16, BLOCKDIM_Y_lud_internal = 16;
#pragma fcuda transfer array_split=[peri_col] mpart=1 dir=[0|0] name=fetch pointer=[m|m] type=burst end=false cores=[1] unroll=1 begin=true size=[16|16] 
void lud_internal_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, double * m, double peri_row[16][16], int fetch_peri_row_offset, int fetch_peri_row_X_0, int fetch_peri_row_c_1, double peri_col[16][16], int fetch_peri_col_offset, int fetch_peri_col_X_0, int fetch_peri_col_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch)
{
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_peri_row_offset+peri_row[threadIdx.y]), ((fetch_peri_row_X_0+m)+(threadIdx.y*fetch_peri_row_c_1)), (16*sizeof (double)));
}
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
{
memcpy((fetch_peri_col_offset+peri_col[threadIdx.y]), ((fetch_peri_col_X_0+m)+(threadIdx.y*fetch_peri_col_c_1)), (16*sizeof (double)));
}
}
}

#pragma fcuda compute array_split=[peri_col] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void lud_internal_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int global_col_id, int global_row_id, double * m, int matrix_dim, double peri_col[16][16], double peri_row[16][16])
{
dim3 threadIdx;
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int i;
double sum;
if (enableSignal_compute)
{
sum=0;
for (i=0; i<16; i ++ )
{
sum+=(peri_col[threadIdx.y][i]*peri_row[i][threadIdx.x]);
}
m[((((global_row_id+threadIdx.y)*matrix_dim)+global_col_id)+threadIdx.x)]-=sum;
}
}
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void lud_internal(double * m, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
double peri_row_block0[16][16];
double peri_col_block0[16][16];
int global_row_id_block0;
int global_col_id_block0;
int enableSignal_fetch_block0;
int fetch_peri_row_offset_block0;
int fetch_peri_row_X_0_block0;
int fetch_peri_row_c_1_block0;
int fetch_peri_col_offset_block0;
int fetch_peri_col_X_0_block0;
int fetch_peri_col_c_1_block0;
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
global_row_id_block0=(offset+((blockIdx_block0.y+1)*16));
global_col_id_block0=(offset+((blockIdx_block0.x+1)*16));
fetch_peri_row_offset_block0=0;
fetch_peri_row_X_0_block0=(global_col_id_block0+(matrix_dim*offset));
fetch_peri_row_c_1_block0=matrix_dim;
fetch_peri_col_offset_block0=0;
fetch_peri_col_X_0_block0=(offset+(global_row_id_block0*matrix_dim));
fetch_peri_col_c_1_block0=matrix_dim;
#pragma fcuda transfer array_split=[peri_col] mpart=1 dir=[0|0] name=fetch pointer=[m|m] type=burst unroll=1 cores=[1] end=false size=[16|16] begin=true 
lud_internal_fetch(enableSignal_fetch_block0, blockDim, gridDim, m, peri_row_block0, fetch_peri_row_offset_block0, fetch_peri_row_X_0_block0, fetch_peri_row_c_1_block0, peri_col_block0, fetch_peri_col_offset_block0, fetch_peri_col_X_0_block0, fetch_peri_col_c_1_block0);
#pragma fcuda transfer array_split=[peri_col] mpart=1 dir=[0|0] name=fetch pointer=[m|m] type=burst unroll=1 cores=[1] end=true size=[16|16] begin=false 
#pragma fcuda compute array_split=[peri_col] mpart=1 name=compute unroll=1 cores=[1] end=false begin=true 
lud_internal_compute(enableSignal_compute_block0, blockDim, gridDim, blockIdx_block0, global_col_id_block0, global_row_id_block0, m, matrix_dim, peri_col_block0, peri_row_block0);
#pragma fcuda compute array_split=[peri_col] mpart=1 name=compute unroll=1 cores=[1] end=true begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge port_id=0 offset=m_addr remove_port_name=m_core0 port_core=0 
void fcuda3(int m_addr, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, double * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=m_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=m_addr 
#pragma HLS INTERFACE ap_none register port=matrix_dim 
#pragma HLS RESOURCE core=AXI4LiteS variable=matrix_dim 
#pragma HLS INTERFACE ap_none register port=offset 
#pragma HLS RESOURCE core=AXI4LiteS variable=offset 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
double * m_core0;
m_core0=( & memport_core0_p0[m_addr]);
lud_internal(m_core0, matrix_dim, offset, gridDim, blockDim, 1, 0);
}

void fcuda(int m_addr, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, double * memport_core0_p0_double, int en_fcuda1, int en_fcuda2, int en_fcuda3)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS INTERFACE ap_none register port=en_fcuda2 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda2 
#pragma HLS INTERFACE ap_none register port=en_fcuda3 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda3 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(m_addr, matrix_dim, offset, gridDim, blockDim, memport_core0_p0_double);
}
if ((en_fcuda2==1))
{
fcuda2(m_addr, matrix_dim, offset, gridDim, blockDim, memport_core0_p0_double);
}
if ((en_fcuda3==1))
{
fcuda3(m_addr, matrix_dim, offset, gridDim, blockDim, memport_core0_p0_double);
}
}

