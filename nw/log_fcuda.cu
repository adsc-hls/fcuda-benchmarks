[LinkSymbol] 246 updates in 0.01 seconds
[AnnotParser] begin
PreAnnotation: #pragma startinclude #include "needle.h"

Parent: TranslationUnit 

PreAnnotation: #pragma endinclude

Parent: TranslationUnit 

PreAnnotation: #pragma startinclude #include <stdio.h>

Parent: TranslationUnit 

PreAnnotation: #pragma endinclude

Parent: TranslationUnit 

PreAnnotation: #pragma startinclude #include "fcuda.h"

Parent: TranslationUnit 

PreAnnotation: #pragma endinclude

Parent: TranslationUnit 

PreAnnotation: #pragma startinclude #include <string.h>

Parent: TranslationUnit 

PreAnnotation: #pragma endinclude

Parent: TranslationUnit 

PreAnnotation: #pragma FCUDA GRID x_dim=16

Token #
Token pragma
Token FCUDA
Token GRID
Token x_dim=16
#pragma fcuda grid x_dim=16 
attached=1

PreAnnotation: #pragma FCUDA COREINFO num_cores=1 pipeline=no

Token #
Token pragma
Token FCUDA
Token COREINFO
Token num_cores=1
Token pipeline=no
#pragma fcuda coreinfo num_cores=1 pipeline=no 
attached=1

PreAnnotation: #pragma FCUDA PORTMERGE remove_port_name=referrence port_id=0

Token #
Token pragma
Token FCUDA
Token PORTMERGE
Token remove_port_name=referrence
Token port_id=0
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
attached=1

PreAnnotation: #pragma FCUDA PORTMERGE remove_port_name=matrix_cuda port_id=0

Token #
Token pragma
Token FCUDA
Token PORTMERGE
Token remove_port_name=matrix_cuda
Token port_id=0
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
attached=1

DeclarationStatement: #pragma FCUDA COMPUTE begin name=init_temp cores=[1] ;

PreAnnotation: #pragma FCUDA COMPUTE begin name=init_temp cores=[1]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token begin
Token name=init_temp
Token cores=[1]
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE end name=init_temp cores=[1] ;

PreAnnotation: #pragma FCUDA COMPUTE end name=init_temp cores=[1]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token end
Token name=init_temp
Token cores=[1]
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER begin name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER begin name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token begin
Token name=fetch_ref
Token type=burst
Token dir=[0]
Token pointer=[referrence]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER end name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER end name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token end
Token name=fetch_ref
Token type=burst
Token dir=[0]
Token pointer=[referrence]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE begin name=init_temp2 cores=[1] ;

PreAnnotation: #pragma FCUDA COMPUTE begin name=init_temp2 cores=[1]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token begin
Token name=init_temp2
Token cores=[1]
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE end name=init_temp2 cores=[1] ;

PreAnnotation: #pragma FCUDA COMPUTE end name=init_temp2 cores=[1]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token end
Token name=init_temp2
Token cores=[1]
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER begin name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER begin name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token begin
Token name=fetch_temp
Token type=burst
Token dir=[0]
Token pointer=[matrix_cuda]
Token size=[16]
Token cores=[1]
Token array_split=[]
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER end name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER end name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token end
Token name=fetch_temp
Token type=burst
Token dir=[0]
Token pointer=[matrix_cuda]
Token size=[16]
Token cores=[1]
Token array_split=[]
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token begin
Token name=compute
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token end
Token name=compute
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER begin name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER begin name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token begin
Token name=write
Token type=burst
Token dir=[1]
Token pointer=[matrix_cuda]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER end name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER end name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token end
Token name=write
Token type=burst
Token dir=[1]
Token pointer=[matrix_cuda]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
attached=0

Parent: DeclarationStatement 

PreAnnotation: #pragma FCUDA GRID x_dim=16

Token #
Token pragma
Token FCUDA
Token GRID
Token x_dim=16
#pragma fcuda grid x_dim=16 
attached=1

PreAnnotation: #pragma FCUDA COREINFO num_cores=1 pipeline=no

Token #
Token pragma
Token FCUDA
Token COREINFO
Token num_cores=1
Token pipeline=no
#pragma fcuda coreinfo num_cores=1 pipeline=no 
attached=1

PreAnnotation: #pragma FCUDA PORTMERGE remove_port_name=referrence port_id=0

Token #
Token pragma
Token FCUDA
Token PORTMERGE
Token remove_port_name=referrence
Token port_id=0
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
attached=1

PreAnnotation: #pragma FCUDA PORTMERGE remove_port_name=matrix_cuda port_id=0

Token #
Token pragma
Token FCUDA
Token PORTMERGE
Token remove_port_name=matrix_cuda
Token port_id=0
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
attached=1

DeclarationStatement: #pragma FCUDA TRANSFER begin name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER begin name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token begin
Token name=fetch_ref
Token type=burst
Token dir=[0]
Token pointer=[referrence]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER end name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER end name=fetch_ref type=burst dir=[0] pointer=[referrence] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token end
Token name=fetch_ref
Token type=burst
Token dir=[0]
Token pointer=[referrence]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE begin name=init_temp cores=[1] ;

PreAnnotation: #pragma FCUDA COMPUTE begin name=init_temp cores=[1]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token begin
Token name=init_temp
Token cores=[1]
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE end name=init_temp cores=[1] ;

PreAnnotation: #pragma FCUDA COMPUTE end name=init_temp cores=[1]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token end
Token name=init_temp
Token cores=[1]
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE begin name=init_temp2 cores=[1] ;

PreAnnotation: #pragma FCUDA COMPUTE begin name=init_temp2 cores=[1]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token begin
Token name=init_temp2
Token cores=[1]
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE end name=init_temp2 cores=[1] ;

PreAnnotation: #pragma FCUDA COMPUTE end name=init_temp2 cores=[1]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token end
Token name=init_temp2
Token cores=[1]
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER begin name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER begin name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token begin
Token name=fetch_temp
Token type=burst
Token dir=[0]
Token pointer=[matrix_cuda]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER end name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER end name=fetch_temp type=burst dir=[0] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token end
Token name=fetch_temp
Token type=burst
Token dir=[0]
Token pointer=[matrix_cuda]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token begin
Token name=compute
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token end
Token name=compute
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER begin name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER begin name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token begin
Token name=write
Token type=burst
Token dir=[1]
Token pointer=[matrix_cuda]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA TRANSFER end name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[] ;

PreAnnotation: #pragma FCUDA TRANSFER end name=write type=burst dir=[1] pointer=[matrix_cuda] size=[16] cores=[1] unroll=1 mpart=1 array_split=[]

Token #
Token pragma
Token FCUDA
Token TRANSFER
Token end
Token name=write
Token type=burst
Token dir=[1]
Token pointer=[matrix_cuda]
Token size=[16]
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[]
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
attached=0

Parent: DeclarationStatement 

[AnnotParser] end in 0.03 seconds

*** Before Any Passes  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx = blockIdx.x;
int tx = threadIdx.x;
int b_index_x = bx;
int b_index_y = ((i-1)-bx);
int index = ((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n = ((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w = ((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw = (((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
int ty;
int m;
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+tx)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x = (tx+1);
int t_index_y = ((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x = ((tx+16)-m);
int t_index_y = (16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx = blockIdx.x;
int tx = threadIdx.x;
int b_index_x = ((bx+block_width)-i);
int b_index_y = ((block_width-bx)-1);
int index = ((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n = ((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w = ((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw = (((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+(cols*ty))+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x = (tx+1);
int t_index_y = ((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x = ((tx+16)-m);
int t_index_y = (16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[LinkSymbol] 246 updates in 0.00 seconds
[AnnotParser] begin
[AnnotParser] end in 0.00 seconds

*** After AnnotationParser  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx = blockIdx.x;
int tx = threadIdx.x;
int b_index_x = bx;
int b_index_y = ((i-1)-bx);
int index = ((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n = ((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w = ((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw = (((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
int ty;
int m;
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+tx)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x = (tx+1);
int t_index_y = ((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x = ((tx+16)-m);
int t_index_y = (16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx = blockIdx.x;
int tx = threadIdx.x;
int b_index_x = ((bx+block_width)-i);
int b_index_y = ((block_width-bx)-1);
int index = ((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n = ((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w = ((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw = (((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+(cols*ty))+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x = (tx+1);
int t_index_y = ((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x = ((tx+16)-m);
int t_index_y = (16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[SingleDeclarator] begin
[SingleDeclarator] end in 0.00 seconds
[LinkSymbol] 246 updates in 0.00 seconds

*** After SingleDeclarator  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx = blockIdx.x;
int tx = threadIdx.x;
int b_index_x = bx;
int b_index_y = ((i-1)-bx);
int index = ((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n = ((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w = ((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw = (((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
int ty;
int m;
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+tx)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x = (tx+1);
int t_index_y = ((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x = ((tx+16)-m);
int t_index_y = (16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx = blockIdx.x;
int tx = threadIdx.x;
int b_index_x = ((bx+block_width)-i);
int b_index_y = ((block_width-bx)-1);
int index = ((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n = ((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w = ((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw = (((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+(cols*ty))+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x = (tx+1);
int t_index_y = ((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x = ((tx+16)-m);
int t_index_y = (16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================

*** After InlineDeviceFunctions  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx = blockIdx.x;
int tx = threadIdx.x;
int b_index_x = bx;
int b_index_y = ((i-1)-bx);
int index = ((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n = ((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w = ((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw = (((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
int ty;
int m;
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+tx)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x = (tx+1);
int t_index_y = ((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x = ((tx+16)-m);
int t_index_y = (16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx = blockIdx.x;
int tx = threadIdx.x;
int b_index_x = ((bx+block_width)-i);
int b_index_y = ((block_width-bx)-1);
int index = ((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n = ((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w = ((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw = (((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+(cols*ty))+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x = (tx+1);
int t_index_y = ((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x = ((tx+16)-m);
int t_index_y = (16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[SeparateInitializers] begin
[SeparateInitializers] examining procedure needle_cuda_shared_1
[SeparateInitializers] examining procedure needle_cuda_shared_2
[SeparateInitializers] end in 0.01 seconds
[LinkSymbol] 246 updates in 0.00 seconds

*** After SeparateInitializers  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx;
bx=blockIdx.x;
int tx;
tx=threadIdx.x;
int b_index_x;
b_index_x=bx;
int b_index_y;
b_index_y=((i-1)-bx);
int index;
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n;
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w;
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw;
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
int ty;
int m;
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+tx)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x;
t_index_x=(tx+1);
int t_index_y;
t_index_y=((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x;
t_index_x=((tx+16)-m);
int t_index_y;
t_index_y=(16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx;
bx=blockIdx.x;
int tx;
tx=threadIdx.x;
int b_index_x;
b_index_x=((bx+block_width)-i);
int b_index_y;
b_index_y=((block_width-bx)-1);
int index;
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
int index_n;
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
int index_w;
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
int index_nw;
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+(cols*ty))+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x;
t_index_x=(tx+1);
int t_index_y;
t_index_y=((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x;
t_index_x=((tx+16)-m);
int t_index_y;
t_index_y=(16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[AnsiDeclarations] begin
[AnsiDeclarations] end in 0.00 seconds
[LinkSymbol] 246 updates in 0.00 seconds

*** After AnsiDeclarations  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx;
int tx;
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
bx=blockIdx.x;
tx=threadIdx.x;
b_index_x=bx;
b_index_y=((i-1)-bx);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+tx)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(tx+1);
t_index_y=((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((tx+16)-m);
t_index_y=(16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx;
int tx;
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
bx=blockIdx.x;
tx=threadIdx.x;
b_index_x=((bx+block_width)-i);
b_index_y=((block_width-bx)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+(cols*ty))+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(tx+1);
t_index_y=((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((tx+16)-m);
t_index_y=(16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[StreamInsertion-FCUDA] begin
[StreamInsertion-FCUDA] examining procedure needle_cuda_shared_1
[StreamInsertion-FCUDA] examining procedure needle_cuda_shared_2
[StreamInsertion-FCUDA] end in 0.01 seconds
[LinkSymbol] 246 updates in 0.00 seconds

*** After StreamInsertion  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx;
int tx;
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
bx=blockIdx.x;
tx=threadIdx.x;
b_index_x=bx;
b_index_y=((i-1)-bx);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+tx)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(tx+1);
t_index_y=((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((tx+16)-m);
t_index_y=(16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int bx;
int tx;
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
bx=blockIdx.x;
tx=threadIdx.x;
b_index_x=((bx+block_width)-i);
b_index_y=((block_width-bx)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][tx]=referrence[((index+(cols*ty))+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((tx==0))
{
temp[tx][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(tx+1)][0]=matrix_cuda[(index_w+(cols*tx))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(tx+1)]=matrix_cuda[(index_n+tx)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((tx<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(tx+1);
t_index_y=((m-tx)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((tx<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((tx+16)-m);
t_index_y=(16-tx);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+tx)+(ty*cols))]=temp[(ty+1)][(tx+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[RemoveThrDepLoops-FCUDA] begin
[RemoveThrDepLoops-FCUDA] examining procedure needle_cuda_shared_1
mVar2Var:
{index=[cols, b_index_y, blockIdx, i], cols=[], matrix_cuda=[ty, cols, b_index_y, index, threadIdx, blockIdx, i], m=[m], i=[], index_nw=[cols, b_index_y, blockIdx, i], ty=[ty], referrence=[], ref=[ty, cols, b_index_y, index, threadIdx, blockIdx, i], b_index_y=[blockIdx, i], index_w=[b_index_y, cols, blockIdx, i], threadIdx=[], temp=[index_nw, cols, b_index_y, index_w, threadIdx, t_index_x, m, t_index_y, penalty, blockIdx, i, index_n], t_index_x=[threadIdx, m], t_index_y=[threadIdx, m], penalty=[], blockIdx=[], index_n=[b_index_y, cols, blockIdx, i]}
[RemoveThrDepLoops-FCUDA] examining procedure needle_cuda_shared_2
mVar2Var:
{cols=[], index=[cols, b_index_y, b_index_x, blockIdx, block_width, i], matrix_cuda=[ty, cols, b_index_y, index, b_index_x, threadIdx, blockIdx, block_width, i], m=[m], i=[], index_nw=[cols, b_index_y, b_index_x, blockIdx, block_width, i], ty=[ty], referrence=[], ref=[ty, cols, b_index_y, index, b_index_x, threadIdx, blockIdx, block_width, i], b_index_y=[blockIdx, block_width], b_index_x=[blockIdx, block_width, i], index_w=[b_index_y, cols, b_index_x, blockIdx, block_width, i], threadIdx=[], temp=[cols, m, i, index_nw, b_index_y, b_index_x, index_w, threadIdx, t_index_x, t_index_y, penalty, block_width, blockIdx, index_n], t_index_x=[threadIdx, m], t_index_y=[threadIdx, m], penalty=[], block_width=[], blockIdx=[], index_n=[b_index_y, cols, b_index_x, blockIdx, block_width, i]}
[RemoveThrDepLoops-FCUDA] end in 0.03 seconds
[LinkSymbol] 276 updates in 0.00 seconds

*** After RemoveThrDepLoops  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+threadIdx.x)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+(cols*ty))+threadIdx.x)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[MakeArraysInCompute-FCUDA] begin
[MakeArraysInCompute-FCUDA] examining procedure needle_cuda_shared_1
Statement: {
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+threadIdx.x)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}
Statement: int b_index_y;
Statement: int index;
Statement: int index_n;
Statement: int index_w;
Statement: int index_nw;
Statement: __shared__ int temp[(16+1)][(16+1)];
Statement: __shared__ int ref[16][16];
Statement: int ty;
Statement: int m;
Statement: b_index_y=((i-1)-blockIdx.x);
Statement: index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
Statement: index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
Statement: index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
Statement: index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
Statement: #pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
Statement: if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
Inside compute: if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
Statement: #pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
Statement: for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+threadIdx.x)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
Statement: __syncthreads();
Statement: #pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
Statement: temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
Inside compute: temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
Statement: #pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
Statement: __syncthreads();
Statement: #pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
Statement: temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
Statement: #pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
Statement: __syncthreads();
Statement: #pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
Statement: for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Inside compute: for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Statement: for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Inside compute: for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Statement: #pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
IDEXPR t_index_x
[MakeArrays]: t_index_x is scalar:true used:false
IDEXPR t_index_y
[MakeArrays]: t_index_y is scalar:true used:false
IDEXPR m
[MakeArrays]: m is scalar:true used:false
Statement: for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
Statement: {
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
Statement: ty=0;
Statement: {
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+threadIdx.x)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
Statement: m=0;
Statement: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Statement: m=(16-2);
Statement: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Statement: ty=0;
Statement: {
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
Statement: temp[threadIdx.x][0]=matrix_cuda[index_nw];
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Statement: ref[ty][threadIdx.x]=referrence[((index+threadIdx.x)+(cols*ty))];
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
Statement: if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
Statement: __syncthreads();
Statement: if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
Statement: __syncthreads();
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Statement: matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
Statement: {
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
Statement: {
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
Statement: int t_index_x;
Statement: int t_index_y;
Statement: t_index_x=(threadIdx.x+1);
Statement: t_index_y=((m-threadIdx.x)+1);
Statement: temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
Statement: int t_index_x;
Statement: int t_index_y;
Statement: t_index_x=((threadIdx.x+16)-m);
Statement: t_index_y=(16-threadIdx.x);
Statement: temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
[MakeArraysInCompute-FCUDA] examining procedure needle_cuda_shared_2
Statement: {
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+(cols*ty))+threadIdx.x)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}
Statement: int b_index_x;
Statement: int b_index_y;
Statement: int index;
Statement: int index_n;
Statement: int index_w;
Statement: int index_nw;
Statement: __shared__ int temp[(16+1)][(16+1)];
Statement: __shared__ int ref[16][16];
Statement: int ty;
Statement: int m;
Statement: b_index_x=((blockIdx.x+block_width)-i);
Statement: b_index_y=((block_width-blockIdx.x)-1);
Statement: index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
Statement: index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
Statement: index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
Statement: index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
Statement: for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+(cols*ty))+threadIdx.x)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
Statement: __syncthreads();
Statement: #pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
Statement: if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
Inside compute: if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
Statement: #pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
Statement: #pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
Statement: temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
Inside compute: temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
Statement: #pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
Statement: __syncthreads();
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Statement: temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
Statement: __syncthreads();
Statement: #pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
Statement: for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Inside compute: for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Statement: for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Inside compute: for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Statement: #pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
IDEXPR t_index_x
[MakeArrays]: t_index_x is scalar:true used:false
IDEXPR t_index_y
[MakeArrays]: t_index_y is scalar:true used:false
IDEXPR m
[MakeArrays]: m is scalar:true used:false
Statement: for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
Statement: ty=0;
Statement: {
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+(cols*ty))+threadIdx.x)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
Statement: {
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
Statement: m=0;
Statement: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Statement: m=(16-2);
Statement: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
Statement: ty=0;
Statement: {
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Statement: ref[ty][threadIdx.x]=referrence[((index+(cols*ty))+threadIdx.x)];
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
Statement: temp[threadIdx.x][0]=matrix_cuda[index_nw];
Statement: if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
Statement: __syncthreads();
Statement: if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
Statement: __syncthreads();
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Statement: matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
Statement: #pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
Statement: {
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
Statement: {
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
Statement: int t_index_x;
Statement: int t_index_y;
Statement: t_index_x=(threadIdx.x+1);
Statement: t_index_y=((m-threadIdx.x)+1);
Statement: temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
Statement: int t_index_x;
Statement: int t_index_y;
Statement: t_index_x=((threadIdx.x+16)-m);
Statement: t_index_y=(16-threadIdx.x);
Statement: temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
[MakeArraysInCompute-FCUDA] end in 0.02 seconds
[LinkSymbol] 276 updates in 0.00 seconds

*** After MakeArraysInCompute  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+threadIdx.x)+(cols*ty))];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
ref[ty][threadIdx.x]=referrence[((index+(cols*ty))+threadIdx.x)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[SplitFcudaTasks-FCUDA] begin
[SplitFcudaTasks-FCUDA] examining procedure needle_cuda_shared_1
BRAM:temp  specs: [[(16+1)][(16+1)]] size:2
BRAM:ref  specs: [[16][16]] size:2

 ... Preprocessing pragma: 
	#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
Creating new FcudaCoreData for core: needle_cuda_shared_1_init_temp()

 ... Preprocessing pragma: 
	#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Creating new FcudaCoreData for core: needle_cuda_shared_1_fetch_ref()

 ... Handling transfer params for 
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
transferStmt: ref[ty][threadIdx.x]=referrence[((index+threadIdx.x)+(cols*ty))];
[findBRAM]: Annotated Statement --> ref[ty][threadIdx.x]=referrence[((index+threadIdx.x)+(cols*ty))];
---Assignments---  [ref[ty][threadIdx.x]=referrence[((index+threadIdx.x)+(cols*ty))]]
BRAM: ref  Dim: 2
Parsing threadIdx.x
Terms [threadIdx.x]
Base expr null
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null
Parsing ((index+threadIdx.x)+(cols*ty))
Terms [index, threadIdx.x, (cols*ty)]
Base expr (index+(cols*ty))
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 

 ... Preprocessing pragma: 
	#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
Creating new FcudaCoreData for core: needle_cuda_shared_1_init_temp2()

 ... Preprocessing pragma: 
	#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
Creating new FcudaCoreData for core: needle_cuda_shared_1_fetch_temp()

 ... Handling transfer params for 
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
transferStmt: temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
[findBRAM]: Annotated Statement --> temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
---Assignments---  [temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)]]
BRAM: temp  Dim: 2
Parsing (threadIdx.x+1)
Terms [threadIdx.x, 1]
Base expr 1
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null
Parsing (index_n+threadIdx.x)
Terms [index_n, threadIdx.x]
Base expr index_n
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
Creating new FcudaCoreData for core: needle_cuda_shared_1_compute()

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Creating new FcudaCoreData for core: needle_cuda_shared_1_write()

 ... Handling transfer params for 
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
transferStmt: matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
[findBRAM]: Annotated Statement --> matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
---Assignments---  [matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)]]
BRAM: temp  Dim: 2
Parsing (threadIdx.x+1)
Terms [threadIdx.x, 1]
Base expr 1
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null
Parsing ((index+threadIdx.x)+(ty*cols))
Terms [index, threadIdx.x, (ty*cols)]
Base expr (index+(cols*ty))
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
fcudaCores (splitTasks-start):
[needle_cuda_shared_1_init_temp(), needle_cuda_shared_1_fetch_ref(), needle_cuda_shared_1_init_temp2(), needle_cuda_shared_1_fetch_temp(), needle_cuda_shared_1_compute(), needle_cuda_shared_1_write()]
coreNames: 
[needle_cuda_shared_1_compute(), needle_cuda_shared_1_fetch_ref(), needle_cuda_shared_1_fetch_temp(), needle_cuda_shared_1_init_temp(), needle_cuda_shared_1_init_temp2(), needle_cuda_shared_1_write()]
Checking Annotation Statement: [#pragma fcuda compute name=init_temp end=false cores=[1] begin=true ]
FCUDA compute begin=true level=1
Task stmt: if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
of type: class cetus.hir.IfStatement
Task stmt: #pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda compute name=init_temp end=true cores=[1] begin=false ]
FCUDA compute begin=false level=1
Task use set: [index_nw, matrix_cuda[index_nw], threadIdx.x]
Task def set: [temp[threadIdx.x][0]]
Task maydef set: []
tmpExpr: index_nw
  of class: class cetus.hir.Identifier
decl: int index_nw
defStmt: none
tmpExpr: matrix_cuda[index_nw]
  of class: class cetus.hir.ArrayAccess
decl: int * matrix_cuda
defStmt: none
tmpExpr: temp[threadIdx.x][0]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: threadIdx.x
  of class: class cetus.hir.AccessExpression
WARNING: currently do not handle RHS elements of AccessExpression threadIdx.x in buildTaskVars()
taskArgs: [enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp]
taskDecls: [int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)]]
defStmts: []
Checking Annotation Statement: [#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true ]
FCUDA compute begin=true level=1
Task stmt: temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
of type: class cetus.hir.ExpressionStatement
Task stmt: #pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false ]
FCUDA compute begin=false level=1
Task use set: [cols, index_w, matrix_cuda[(index_w+(cols*threadIdx.x))], threadIdx.x]
Task def set: [temp[(threadIdx.x+1)][0]]
Task maydef set: []
tmpExpr: cols
  of class: class cetus.hir.Identifier
decl: int cols
defStmt: none
tmpExpr: index_w
  of class: class cetus.hir.Identifier
decl: int index_w
defStmt: none
tmpExpr: matrix_cuda[(index_w+(cols*threadIdx.x))]
  of class: class cetus.hir.ArrayAccess
decl: int * matrix_cuda
defStmt: none
tmpExpr: temp[(threadIdx.x+1)][0]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: threadIdx.x
  of class: class cetus.hir.AccessExpression
WARNING: currently do not handle RHS elements of AccessExpression threadIdx.x in buildTaskVars()
taskArgs: [enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp]
taskDecls: [int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)]]
defStmts: []
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] ]
FCUDA transfer begin=true level=1
Task stmt: #pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] ]
FCUDA transfer begin=false level=1
Task use set: []
Task def set: []
Task maydef set: []
taskArgs: [enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1]
taskDecls: [int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1]
defStmts: []
Checking Annotation Statement: [#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true ]
FCUDA compute begin=true level=1
Task stmt: for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
of type: class cetus.hir.ForLoop
Task stmt: for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
of type: class cetus.hir.ForLoop
Task stmt: #pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false ]
FCUDA compute begin=false level=1
Task use set: [m, penalty, ref[(t_index_y-1)][(t_index_x-1)], t_index_x, t_index_y, temp[(t_index_y-1)][(t_index_x-1)], temp[(t_index_y-1)][t_index_x], temp[t_index_y][(t_index_x-1)], threadIdx.x]
Task def set: [m, t_index_x, t_index_y, temp[t_index_y][t_index_x]]
Task maydef set: []
tmpExpr: m
  of class: class cetus.hir.Identifier
decl: int m
defStmt: none
tmpExpr: penalty
  of class: class cetus.hir.Identifier
decl: int penalty
defStmt: none
tmpExpr: ref[(t_index_y-1)][(t_index_x-1)]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int ref[16][16]
defStmt: none
tmpExpr: t_index_x
  of class: class cetus.hir.Identifier
tmpExpr: t_index_y
  of class: class cetus.hir.Identifier
tmpExpr: temp[(t_index_y-1)][(t_index_x-1)]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: temp[(t_index_y-1)][t_index_x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: temp[t_index_y][(t_index_x-1)]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: temp[t_index_y][t_index_x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: threadIdx.x
  of class: class cetus.hir.AccessExpression
WARNING: currently do not handle RHS elements of AccessExpression threadIdx.x in buildTaskVars()
taskArgs: [enableSignal_compute, blockDim, gridDim, blockIdx, m, penalty, ref, temp]
taskDecls: [int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int m, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)]]
defStmts: []
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] ]
FCUDA transfer begin=true level=2
Task stmt: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] ]
FCUDA transfer begin=false level=2
Task use set: []
Task def set: []
Task maydef set: []
taskArgs: [enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1]
taskDecls: [int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1]
defStmts: []
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] ]
FCUDA transfer begin=true level=2
Task stmt: #pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] ]
FCUDA transfer begin=false level=2
Task use set: []
Task def set: []
Task maydef set: []
taskArgs: [enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1]
taskDecls: [int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1]
defStmts: []
[SplitFcudaTasks-FCUDA] examining procedure needle_cuda_shared_2
BRAM:temp  specs: [[(16+1)][(16+1)]] size:2
BRAM:ref  specs: [[16][16]] size:2

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Creating new FcudaCoreData for core: needle_cuda_shared_2_fetch_ref()

 ... Handling transfer params for 
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
transferStmt: ref[ty][threadIdx.x]=referrence[((index+(cols*ty))+threadIdx.x)];
[findBRAM]: Annotated Statement --> ref[ty][threadIdx.x]=referrence[((index+(cols*ty))+threadIdx.x)];
---Assignments---  [ref[ty][threadIdx.x]=referrence[((index+(cols*ty))+threadIdx.x)]]
BRAM: ref  Dim: 2
Parsing threadIdx.x
Terms [threadIdx.x]
Base expr null
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null
Parsing ((index+(cols*ty))+threadIdx.x)
Terms [index, (cols*ty), threadIdx.x]
Base expr (index+(cols*ty))
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 

 ... Preprocessing pragma: 
	#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
Creating new FcudaCoreData for core: needle_cuda_shared_2_init_temp()

 ... Preprocessing pragma: 
	#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 

 ... Preprocessing pragma: 
	#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
Creating new FcudaCoreData for core: needle_cuda_shared_2_init_temp2()

 ... Preprocessing pragma: 
	#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Creating new FcudaCoreData for core: needle_cuda_shared_2_fetch_temp()

 ... Handling transfer params for 
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
transferStmt: temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
[findBRAM]: Annotated Statement --> temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)];
---Assignments---  [temp[0][(threadIdx.x+1)]=matrix_cuda[(index_n+threadIdx.x)]]
BRAM: temp  Dim: 2
Parsing (threadIdx.x+1)
Terms [threadIdx.x, 1]
Base expr 1
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null
Parsing (index_n+threadIdx.x)
Terms [index_n, threadIdx.x]
Base expr index_n
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
Creating new FcudaCoreData for core: needle_cuda_shared_2_compute()

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
Creating new FcudaCoreData for core: needle_cuda_shared_2_write()

 ... Handling transfer params for 
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
transferStmt: matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
[findBRAM]: Annotated Statement --> matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)];
---Assignments---  [matrix_cuda[((index+threadIdx.x)+(ty*cols))]=temp[(ty+1)][(threadIdx.x+1)]]
BRAM: temp  Dim: 2
Parsing (threadIdx.x+1)
Terms [threadIdx.x, 1]
Base expr 1
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null
Parsing ((index+threadIdx.x)+(ty*cols))
Terms [index, threadIdx.x, (ty*cols)]
Base expr (index+(cols*ty))
c1 = null
c2 = null
c3 = 1
c4 = null
c5 = null

 ... Preprocessing pragma: 
	#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
fcudaCores (splitTasks-start):
[needle_cuda_shared_2_fetch_ref(), needle_cuda_shared_2_init_temp(), needle_cuda_shared_2_init_temp2(), needle_cuda_shared_2_fetch_temp(), needle_cuda_shared_2_compute(), needle_cuda_shared_2_write()]
coreNames: 
[needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, m, penalty, ref, temp), needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1), needle_cuda_shared_2_compute(), needle_cuda_shared_2_fetch_ref(), needle_cuda_shared_2_fetch_temp(), needle_cuda_shared_2_init_temp(), needle_cuda_shared_2_init_temp2(), needle_cuda_shared_2_write()]
Checking Annotation Statement: [#pragma fcuda compute name=init_temp end=false cores=[1] begin=true ]
FCUDA compute begin=true level=1
Task stmt: if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
of type: class cetus.hir.IfStatement
Task stmt: #pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda compute name=init_temp end=true cores=[1] begin=false ]
FCUDA compute begin=false level=1
Task use set: [index_nw, matrix_cuda[index_nw], threadIdx.x]
Task def set: [temp[threadIdx.x][0]]
Task maydef set: []
tmpExpr: index_nw
  of class: class cetus.hir.Identifier
decl: int index_nw
defStmt: none
tmpExpr: matrix_cuda[index_nw]
  of class: class cetus.hir.ArrayAccess
decl: int * matrix_cuda
defStmt: none
tmpExpr: temp[threadIdx.x][0]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: threadIdx.x
  of class: class cetus.hir.AccessExpression
WARNING: currently do not handle RHS elements of AccessExpression threadIdx.x in buildTaskVars()
taskArgs: [enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp]
taskDecls: [int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)]]
defStmts: []
Checking Annotation Statement: [#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true ]
FCUDA compute begin=true level=1
Task stmt: temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
of type: class cetus.hir.ExpressionStatement
Task stmt: #pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false ]
FCUDA compute begin=false level=1
Task use set: [cols, index_w, matrix_cuda[(index_w+(cols*threadIdx.x))], threadIdx.x]
Task def set: [temp[(threadIdx.x+1)][0]]
Task maydef set: []
tmpExpr: cols
  of class: class cetus.hir.Identifier
decl: int cols
defStmt: none
tmpExpr: index_w
  of class: class cetus.hir.Identifier
decl: int index_w
defStmt: none
tmpExpr: matrix_cuda[(index_w+(cols*threadIdx.x))]
  of class: class cetus.hir.ArrayAccess
decl: int * matrix_cuda
defStmt: none
tmpExpr: temp[(threadIdx.x+1)][0]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: threadIdx.x
  of class: class cetus.hir.AccessExpression
WARNING: currently do not handle RHS elements of AccessExpression threadIdx.x in buildTaskVars()
taskArgs: [enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp]
taskDecls: [int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)]]
defStmts: []
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] ]
FCUDA transfer begin=true level=1
Task stmt: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] ]
FCUDA transfer begin=false level=1
Task use set: []
Task def set: []
Task maydef set: []
taskArgs: [enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1]
taskDecls: [int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1]
defStmts: []
Checking Annotation Statement: [#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true ]
FCUDA compute begin=true level=1
Task stmt: for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
of type: class cetus.hir.ForLoop
Task stmt: for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
of type: class cetus.hir.ForLoop
Task stmt: #pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false ]
FCUDA compute begin=false level=1
Task use set: [m, penalty, ref[(t_index_y-1)][(t_index_x-1)], t_index_x, t_index_y, temp[(t_index_y-1)][(t_index_x-1)], temp[(t_index_y-1)][t_index_x], temp[t_index_y][(t_index_x-1)], threadIdx.x]
Task def set: [m, t_index_x, t_index_y, temp[t_index_y][t_index_x]]
Task maydef set: []
tmpExpr: m
  of class: class cetus.hir.Identifier
decl: int m
defStmt: none
tmpExpr: penalty
  of class: class cetus.hir.Identifier
decl: int penalty
defStmt: none
tmpExpr: ref[(t_index_y-1)][(t_index_x-1)]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int ref[16][16]
defStmt: none
tmpExpr: t_index_x
  of class: class cetus.hir.Identifier
tmpExpr: t_index_y
  of class: class cetus.hir.Identifier
tmpExpr: temp[(t_index_y-1)][(t_index_x-1)]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: temp[(t_index_y-1)][t_index_x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: temp[t_index_y][(t_index_x-1)]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: temp[t_index_y][t_index_x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int temp[(16+1)][(16+1)]
defStmt: none
tmpExpr: threadIdx.x
  of class: class cetus.hir.AccessExpression
WARNING: currently do not handle RHS elements of AccessExpression threadIdx.x in buildTaskVars()
taskArgs: [enableSignal_compute, blockDim, gridDim, blockIdx, m, penalty, ref, temp]
taskDecls: [int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int m, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)]]
defStmts: []
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] ]
FCUDA transfer begin=true level=2
Task stmt: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] ]
FCUDA transfer begin=false level=2
Task use set: []
Task def set: []
Task maydef set: []
taskArgs: [enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1]
taskDecls: [int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1]
defStmts: []
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] ]
FCUDA transfer begin=true level=2
Task stmt: #pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] ]
FCUDA transfer begin=false level=2
Task use set: []
Task def set: []
Task maydef set: []
taskArgs: [enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1]
taskDecls: [int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1]
defStmts: []
[SplitFcudaTasks-FCUDA] end in 0.05 seconds
[LinkSymbol] 380 updates in 0.01 seconds

*** After SplitFcudaTasks  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_init_temp)
{
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
}
}

#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int m, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_compute)
{
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, m, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_init_temp)
{
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
}
}

#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int m, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_compute)
{
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int m;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, m, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[CleanKernelDecls-FCUDA] begin
[CleanKernelDecls-FCUDA] examining procedure needle_cuda_shared_1
cur_level:0
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_write, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_compute, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_fetch_temp, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_init_temp2, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_fetch_ref, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_init_temp, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[b_index_y, blockIdx, blockIdx.x, i]
Defs+Uses:[b_index_y, blockIdx, blockIdx.x, cols, index]
Defs+Uses:[b_index_y, blockIdx, blockIdx.x, cols, index_n]
Defs+Uses:[b_index_y, blockIdx, blockIdx.x, cols, index_w]
Defs+Uses:[b_index_y, blockIdx, blockIdx.x, cols, index_nw]
Defs+Uses:[]
Defs+Uses:[blockDim, blockIdx, enableSignal_init_temp, gridDim, index_nw, matrix_cuda, needle_cuda_shared_1_init_temp, temp]
Defs+Uses:[]
cur_level:1
Defs+Uses:[fetch_ref_ref_offset]
Defs+Uses:[cols, fetch_ref_ref_X_0, index, ty]
Defs+Uses:[fetch_ref_ref_c_1]
Defs+Uses:[]
Defs+Uses:[blockDim, enableSignal_fetch_ref, fetch_ref_ref_X_0, fetch_ref_ref_c_1, fetch_ref_ref_offset, gridDim, needle_cuda_shared_1_fetch_ref, ref, referrence, ty]
Defs+Uses:[]
cur_level:1
var2freqMap{}
funcCallParams[blockDim, blockIdx, enableSignal_fetch_ref, enableSignal_init_temp, fetch_ref_ref_X_0, fetch_ref_ref_c_1, fetch_ref_ref_offset, gridDim, index_nw, matrix_cuda, ref, referrence, temp, ty]
Defs+Uses:[__syncthreads]
Defs+Uses:[]
Defs+Uses:[blockDim, blockIdx, cols, enableSignal_init_temp2, gridDim, index_w, matrix_cuda, needle_cuda_shared_1_init_temp2, temp]
Defs+Uses:[]
Defs+Uses:[__syncthreads]
Defs+Uses:[fetch_temp_temp_offset]
Defs+Uses:[fetch_temp_temp_X_0, index_n]
Defs+Uses:[fetch_temp_temp_c_1]
Defs+Uses:[]
Defs+Uses:[blockDim, enableSignal_fetch_temp, fetch_temp_temp_X_0, fetch_temp_temp_c_1, fetch_temp_temp_offset, gridDim, matrix_cuda, needle_cuda_shared_1_fetch_temp, temp]
Defs+Uses:[]
Defs+Uses:[__syncthreads]
Defs+Uses:[]
Defs+Uses:[blockDim, blockIdx, enableSignal_compute, gridDim, m, needle_cuda_shared_1_compute, penalty, ref, temp]
Defs+Uses:[]
cur_level:1
Defs+Uses:[write_temp_offset]
Defs+Uses:[cols, index, ty, write_temp_X_0]
Defs+Uses:[write_temp_c_1]
Defs+Uses:[]
Defs+Uses:[blockDim, enableSignal_write, gridDim, matrix_cuda, needle_cuda_shared_1_write, temp, ty, write_temp_X_0, write_temp_c_1, write_temp_offset]
Defs+Uses:[]
cur_level:1
var2freqMap{}
funcCallParams[blockDim, blockIdx, cols, enableSignal_compute, enableSignal_fetch_ref, enableSignal_fetch_temp, enableSignal_init_temp, enableSignal_init_temp2, enableSignal_write, fetch_ref_ref_X_0, fetch_ref_ref_c_1, fetch_ref_ref_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1, fetch_temp_temp_offset, gridDim, index_nw, index_w, m, matrix_cuda, penalty, ref, referrence, temp, ty, write_temp_X_0, write_temp_c_1, write_temp_offset]
cur_level:0
var2freqMap{b_index_y=5, enableSignal_compute=2, enableSignal_fetch_ref=2, enableSignal_fetch_temp=2, enableSignal_init_temp=2, enableSignal_init_temp2=2, enableSignal_write=2, fetch_ref_ref_X_0=2, fetch_ref_ref_c_1=2, fetch_ref_ref_offset=2, fetch_temp_temp_X_0=2, fetch_temp_temp_c_1=2, fetch_temp_temp_offset=2, index=3, index_n=2, index_nw=2, index_w=2, m=1, ref=2, temp=5, ty=10, write_temp_X_0=2, write_temp_c_1=2, write_temp_offset=2}
funcCallParams[blockDim, blockIdx, cols, enableSignal_compute, enableSignal_fetch_ref, enableSignal_fetch_temp, enableSignal_init_temp, enableSignal_init_temp2, enableSignal_write, fetch_ref_ref_X_0, fetch_ref_ref_c_1, fetch_ref_ref_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1, fetch_temp_temp_offset, gridDim, index_nw, index_w, m, matrix_cuda, penalty, ref, referrence, temp, ty, write_temp_X_0, write_temp_c_1, write_temp_offset]
fcall:needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp)
fcall:needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1)
fcall:__syncthreads()
fcall:needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp)
fcall:__syncthreads()
fcall:needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1)
fcall:__syncthreads()
fcall:needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, m, penalty, ref, temp)
-arg:m contains m
- and are equal
- declList b4 = [int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int m, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)]]
- declList after = [int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)]]
[CleanKernelDecls-FCUDA] examining procedure needle_cuda_shared_2
cur_level:0
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_write, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_compute, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_fetch_temp, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_init_temp2, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_init_temp, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_fetch_ref, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[b_index_x, blockIdx, blockIdx.x, block_width, i]
Defs+Uses:[b_index_y, blockIdx, blockIdx.x, block_width]
Defs+Uses:[b_index_x, b_index_y, cols, index]
Defs+Uses:[b_index_x, b_index_y, cols, index_n]
Defs+Uses:[b_index_x, b_index_y, cols, index_w]
Defs+Uses:[b_index_x, b_index_y, cols, index_nw]
cur_level:1
Defs+Uses:[fetch_ref_ref_offset]
Defs+Uses:[cols, fetch_ref_ref_X_0, index, ty]
Defs+Uses:[fetch_ref_ref_c_1]
Defs+Uses:[]
Defs+Uses:[blockDim, enableSignal_fetch_ref, fetch_ref_ref_X_0, fetch_ref_ref_c_1, fetch_ref_ref_offset, gridDim, needle_cuda_shared_2_fetch_ref, ref, referrence, ty]
Defs+Uses:[]
cur_level:1
var2freqMap{}
funcCallParams[blockDim, enableSignal_fetch_ref, fetch_ref_ref_X_0, fetch_ref_ref_c_1, fetch_ref_ref_offset, gridDim, ref, referrence, ty]
Defs+Uses:[__syncthreads]
Defs+Uses:[]
Defs+Uses:[blockDim, blockIdx, enableSignal_init_temp, gridDim, index_nw, matrix_cuda, needle_cuda_shared_2_init_temp, temp]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[blockDim, blockIdx, cols, enableSignal_init_temp2, gridDim, index_w, matrix_cuda, needle_cuda_shared_2_init_temp2, temp]
Defs+Uses:[]
Defs+Uses:[__syncthreads]
Defs+Uses:[fetch_temp_temp_offset]
Defs+Uses:[fetch_temp_temp_X_0, index_n]
Defs+Uses:[fetch_temp_temp_c_1]
Defs+Uses:[]
Defs+Uses:[blockDim, enableSignal_fetch_temp, fetch_temp_temp_X_0, fetch_temp_temp_c_1, fetch_temp_temp_offset, gridDim, matrix_cuda, needle_cuda_shared_2_fetch_temp, temp]
Defs+Uses:[]
Defs+Uses:[__syncthreads]
Defs+Uses:[]
Defs+Uses:[blockDim, blockIdx, enableSignal_compute, gridDim, m, needle_cuda_shared_2_compute, penalty, ref, temp]
Defs+Uses:[]
cur_level:1
Defs+Uses:[write_temp_offset]
Defs+Uses:[cols, index, ty, write_temp_X_0]
Defs+Uses:[write_temp_c_1]
Defs+Uses:[]
Defs+Uses:[blockDim, enableSignal_write, gridDim, matrix_cuda, needle_cuda_shared_2_write, temp, ty, write_temp_X_0, write_temp_c_1, write_temp_offset]
Defs+Uses:[]
cur_level:1
var2freqMap{}
funcCallParams[blockDim, blockIdx, cols, enableSignal_compute, enableSignal_fetch_ref, enableSignal_fetch_temp, enableSignal_init_temp, enableSignal_init_temp2, enableSignal_write, fetch_ref_ref_X_0, fetch_ref_ref_c_1, fetch_ref_ref_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1, fetch_temp_temp_offset, gridDim, index_nw, index_w, m, matrix_cuda, penalty, ref, referrence, temp, ty, write_temp_X_0, write_temp_c_1, write_temp_offset]
cur_level:0
var2freqMap{b_index_x=5, b_index_y=5, enableSignal_compute=2, enableSignal_fetch_ref=2, enableSignal_fetch_temp=2, enableSignal_init_temp=2, enableSignal_init_temp2=2, enableSignal_write=2, fetch_ref_ref_X_0=2, fetch_ref_ref_c_1=2, fetch_ref_ref_offset=2, fetch_temp_temp_X_0=2, fetch_temp_temp_c_1=2, fetch_temp_temp_offset=2, index=3, index_n=2, index_nw=2, index_w=2, m=1, ref=2, temp=5, ty=10, write_temp_X_0=2, write_temp_c_1=2, write_temp_offset=2}
funcCallParams[blockDim, blockIdx, cols, enableSignal_compute, enableSignal_fetch_ref, enableSignal_fetch_temp, enableSignal_init_temp, enableSignal_init_temp2, enableSignal_write, fetch_ref_ref_X_0, fetch_ref_ref_c_1, fetch_ref_ref_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1, fetch_temp_temp_offset, gridDim, index_nw, index_w, m, matrix_cuda, penalty, ref, referrence, temp, ty, write_temp_X_0, write_temp_c_1, write_temp_offset]
fcall:needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1)
fcall:__syncthreads()
fcall:needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp)
fcall:needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp)
fcall:__syncthreads()
fcall:needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1)
fcall:__syncthreads()
fcall:needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, m, penalty, ref, temp)
-arg:m contains m
- and are equal
- declList b4 = [int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int m, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)]]
- declList after = [int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)]]
[CleanKernelDecls-FCUDA] end in 0.02 seconds
[LinkSymbol] 378 updates in 0.00 seconds

*** After CleanKernelDecls  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_init_temp)
{
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
}
}

#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
int m;
if (enableSignal_compute)
{
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_init_temp)
{
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
}
}

#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
int m;
if (enableSignal_compute)
{
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[SerializeThreads-MCUDA] begin
[SerializeThreads-MCUDA] examining procedure needle_cuda_shared_1
[SerializeThreads-MCUDA] examining procedure needle_cuda_shared_2
[SerializeThreads-MCUDA] end in 0.01 seconds
[LinkSymbol] 378 updates in 0.00 seconds

*** After SerializeThreads  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int m;
if (enableSignal_compute)
{
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int m;
if (enableSignal_compute)
{
for (m=0; m<16; m ++ )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
for (m=(16-2); m>=0; m -- )
{
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
__syncthreads();
}
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[EnforceSyncs-MCUDA] begin
[EnforceSyncs-MCUDA] examining procedure needle_cuda_shared_1
[EnforceSyncs-MCUDA] examining procedure needle_cuda_shared_2
[EnforceSyncs-MCUDA] end in 0.00 seconds
[LinkSymbol] 378 updates in 0.00 seconds

*** After EnforceSyncs  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[PrivatizeScalarsInThreadLoops - FCUDA] begin
[PrivatizeScalarsInThreadLoops - FCUDA] examining procedure needle_cuda_shared_1
THREADLOOP: {
if (enableSignal_init_temp)
{
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
}
}
THREADLOOP: {
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
THREADLOOP: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
THREADLOOP: {
m=0;
}
THREADLOOP: {
m -- ;
}
THREADLOOP: {
m ++ ;
}
THREADLOOP: {
m=(16-2);
}
THREADLOOP: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
DEFSET: [t_index_x, t_index_y]
Find UseSet of: {
m=0;
}
USESET: []
DEFSET WITHIN LOOP: [m]
REMAINSET: []
Find UseSet of: {
m -- ;
}
USESET: [m]
DEFSET WITHIN LOOP: [m]
REMAINSET: []
Find UseSet of: {
m ++ ;
}
USESET: [m]
DEFSET WITHIN LOOP: [m]
REMAINSET: []
Find UseSet of: {
m=(16-2);
}
USESET: []
DEFSET WITHIN LOOP: [m]
REMAINSET: []
Find UseSet of: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
USESET: [t_index_y, ref[16][16], temp[(16+1)][(16+1)], <threadIdx.x>, m, t_index_x, penalty]
DEFSET WITHIN LOOP: [t_index_x, t_index_y, temp[(16+1)][(16+1)]]
REMAINSET: []
DEFSET: [t_index_x, t_index_y]
Find UseSet of: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
USESET: [t_index_x, ref[16][16], temp[(16+1)][(16+1)], <threadIdx.x>, t_index_y, m, penalty]
DEFSET WITHIN LOOP: [t_index_x, t_index_y]
REMAINSET: []
Find UseSet of: {
m=0;
}
USESET: []
DEFSET WITHIN LOOP: []
REMAINSET: []
Find UseSet of: {
m -- ;
}
USESET: []
DEFSET WITHIN LOOP: []
REMAINSET: []
Find UseSet of: {
m ++ ;
}
USESET: []
DEFSET WITHIN LOOP: []
REMAINSET: []
Find UseSet of: {
m=(16-2);
}
USESET: []
DEFSET WITHIN LOOP: []
REMAINSET: []
Scalars to be privatized: []
[PrivatizeScalarsInThreadLoops - FCUDA] examining procedure needle_cuda_shared_2
THREADLOOP: {
if (enableSignal_init_temp)
{
if ((threadIdx.x==0))
{
temp[threadIdx.x][0]=matrix_cuda[index_nw];
}
}
}
THREADLOOP: {
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
THREADLOOP: {
m -- ;
}
THREADLOOP: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
THREADLOOP: {
m=0;
}
THREADLOOP: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
THREADLOOP: {
m=(16-2);
}
THREADLOOP: {
m ++ ;
}
DEFSET: [t_index_x, t_index_y]
Find UseSet of: {
m -- ;
}
USESET: [m]
DEFSET WITHIN LOOP: []
REMAINSET: []
Find UseSet of: {
m=0;
}
USESET: []
DEFSET WITHIN LOOP: [m]
REMAINSET: []
Find UseSet of: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=(threadIdx.x+1);
t_index_y=((m-threadIdx.x)+1);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
USESET: [penalty, m, temp[(16+1)][(16+1)], <threadIdx.x>, t_index_y, t_index_x, ref[16][16]]
DEFSET WITHIN LOOP: [t_index_x, t_index_y, temp[(16+1)][(16+1)]]
REMAINSET: []
Find UseSet of: {
m=(16-2);
}
USESET: []
DEFSET WITHIN LOOP: [m]
REMAINSET: []
Find UseSet of: {
m ++ ;
}
USESET: [m]
DEFSET WITHIN LOOP: [m]
REMAINSET: []
DEFSET: [t_index_x, t_index_y]
Find UseSet of: {
m -- ;
}
USESET: [m]
DEFSET WITHIN LOOP: []
REMAINSET: []
Find UseSet of: {
if ((threadIdx.x<=m))
{
int t_index_x;
int t_index_y;
t_index_x=((threadIdx.x+16)-m);
t_index_y=(16-threadIdx.x);
temp[t_index_y][t_index_x]=maximum((temp[(t_index_y-1)][(t_index_x-1)]+ref[(t_index_y-1)][(t_index_x-1)]), (temp[t_index_y][(t_index_x-1)]-penalty), (temp[(t_index_y-1)][t_index_x]-penalty));
}
}
USESET: [penalty, m, temp[(16+1)][(16+1)], <threadIdx.x>, t_index_y, t_index_x, ref[16][16]]
DEFSET WITHIN LOOP: [t_index_x, t_index_y]
REMAINSET: []
Find UseSet of: {
m=0;
}
USESET: []
DEFSET WITHIN LOOP: []
REMAINSET: []
Find UseSet of: {
m=(16-2);
}
USESET: []
DEFSET WITHIN LOOP: [m]
REMAINSET: []
Find UseSet of: {
m ++ ;
}
USESET: []
DEFSET WITHIN LOOP: [m]
REMAINSET: []
Scalars to be privatized: []
[PrivatizeScalarsInThreadLoops - FCUDA] end in 0.03 seconds
[LinkSymbol] 378 updates in 0.00 seconds

*** After PrivatizeScalarsInThreadLoop  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[UnrollThreadLoops-MCUDA] begin
[UnrollThreadLoops-MCUDA] examining procedure needle_cuda_shared_1

[Unrolling] : needle_cuda_shared_1_init_temp
[Proc]: #pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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


[unrollFactor] 1

[Unrolling] : needle_cuda_shared_1_init_temp2
[Proc]: #pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}


[unrollFactor] 1

[Unrolling] : needle_cuda_shared_1_compute
[Proc]: #pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}


[unrollFactor] 1
mUnrolledIDs: 
{}
[UnrollThreadLoops-MCUDA] examining procedure needle_cuda_shared_2

[Unrolling] : needle_cuda_shared_2_init_temp
[Proc]: #pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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


[unrollFactor] 1

[Unrolling] : needle_cuda_shared_2_init_temp2
[Proc]: #pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}


[unrollFactor] 1

[Unrolling] : needle_cuda_shared_2_compute
[Proc]: #pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}


[unrollFactor] 1
mUnrolledIDs: 
{}
[UnrollThreadLoops-MCUDA] end in 0.00 seconds
[LinkSymbol] 378 updates in 0.00 seconds

*** After UnrollThreadLoops  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[PartitionArrays-MCUDA] begin
[PartitionArrays-MCUDA] examining procedure needle_cuda_shared_1
[numDims]1
[Memory partition] : needle_cuda_shared_1_init_temp

[Proc]: #pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_1_init_temp2

[Proc]: #pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_1_fetch_temp

[Proc]: #pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_temp)
{
{
memcpy((fetch_temp_temp_offset+temp[0]), ((fetch_temp_temp_X_0+matrix_cuda)+(threadIdx.y*fetch_temp_temp_c_1)), (16*sizeof (int)));
}
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_1_compute

[Proc]: #pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_1_fetch_ref

[Proc]: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_ref)
{
{
memcpy((fetch_ref_ref_offset+ref[ty]), ((fetch_ref_ref_X_0+referrence)+(threadIdx.y*fetch_ref_ref_c_1)), (16*sizeof (int)));
}
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_1_write

[Proc]: #pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_write)
{
{
memcpy(((matrix_cuda+write_temp_X_0)+(threadIdx.y*write_temp_c_1)), (write_temp_offset+temp[(1+ty)]), (16*sizeof (int)));
}
}
}


[mempartFactor]1
[Memory partition] : needle_cuda_shared_1

HAA 1 {
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}
[PartitionArrays-MCUDA] examining procedure needle_cuda_shared_2
[numDims]1
[Memory partition] : needle_cuda_shared_2_init_temp

[Proc]: #pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_2_init_temp2

[Proc]: #pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_2_fetch_temp

[Proc]: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_temp)
{
{
memcpy((fetch_temp_temp_offset+temp[0]), ((fetch_temp_temp_X_0+matrix_cuda)+(threadIdx.y*fetch_temp_temp_c_1)), (16*sizeof (int)));
}
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_2_compute

[Proc]: #pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_2_fetch_ref

[Proc]: #pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
{
dim3 threadIdx;
if (enableSignal_fetch_ref)
{
{
memcpy((fetch_ref_ref_offset+ref[ty]), ((fetch_ref_ref_X_0+referrence)+(threadIdx.y*fetch_ref_ref_c_1)), (16*sizeof (int)));
}
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : needle_cuda_shared_2_write

[Proc]: #pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
{
dim3 threadIdx;
if (enableSignal_write)
{
{
memcpy(((matrix_cuda+write_temp_X_0)+(threadIdx.y*write_temp_c_1)), (write_temp_offset+temp[(1+ty)]), (16*sizeof (int)));
}
}
}


[mempartFactor]1
[Memory partition] : needle_cuda_shared_2

HAA 1 {
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}
[PartitionArrays-MCUDA] end in 0.00 seconds
[LinkSymbol] 378 updates in 0.00 seconds

*** After PartitionArrays  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
for (ty=0; ty<16; ty ++ )
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
for (ty=0; ty<16; ty ++ )
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[1] name=write pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
}
}



===========================================
[IfSplitPass-FCUDA] begin
[IfSplitPass-FCUDA] examining procedure needle_cuda_shared_1
fcudaCores:
[needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)]
coreNames: 
[needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1), needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)]
Handling control flow for needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp)
mCurrEnableSignal: enableSignal_init_temp
Handling control flow for needle_cuda_shared_1_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1)
mCurrEnableSignal: enableSignal_fetch_ref
In if stmt, lead list {
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}

In if stmt, trail list {
ty ++ ;
}
Handling control flow for needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp)
mCurrEnableSignal: enableSignal_init_temp2
Handling control flow for needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1)
mCurrEnableSignal: enableSignal_fetch_temp
Handling control flow for needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp)
mCurrEnableSignal: enableSignal_compute
Handling control flow for needle_cuda_shared_1_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)
mCurrEnableSignal: enableSignal_write
In if stmt, lead list {
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}

In if stmt, trail list {
ty ++ ;
}
[IfSplitPass-FCUDA] examining procedure needle_cuda_shared_2
fcudaCores:
[needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)]
coreNames: 
[needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_1_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_0), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_1_write((enableSignal_write&&whileLoopGuard_1), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1), needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)]
Handling control flow for needle_cuda_shared_2_fetch_ref(enableSignal_fetch_ref, blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1)
mCurrEnableSignal: enableSignal_fetch_ref
In if stmt, lead list {
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}

In if stmt, trail list {
ty ++ ;
}
Handling control flow for needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp)
mCurrEnableSignal: enableSignal_init_temp
Handling control flow for needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp)
mCurrEnableSignal: enableSignal_init_temp2
Handling control flow for needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1)
mCurrEnableSignal: enableSignal_fetch_temp
Handling control flow for needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp)
mCurrEnableSignal: enableSignal_compute
Handling control flow for needle_cuda_shared_2_write(enableSignal_write, blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)
mCurrEnableSignal: enableSignal_write
In if stmt, lead list {
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}

In if stmt, trail list {
ty ++ ;
}
[IfSplitPass-FCUDA] end in 0.00 seconds
[LinkSymbol] 402 updates in 0.00 seconds

*** After IfSplitPass  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
int whileLoopGuard_0;
int whileLoopGuard_1;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
whileLoopGuard_0=1;
ty=0;
while (1)
{
whileLoopGuard_0&=ty<16;
if (( ! whileLoopGuard_0))
{
break;
}
if (whileLoopGuard_0)
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}
needle_cuda_shared_1_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_0), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
if (whileLoopGuard_0)
{
ty ++ ;
}
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
whileLoopGuard_1=1;
ty=0;
while (1)
{
whileLoopGuard_1&=ty<16;
if (( ! whileLoopGuard_1))
{
break;
}
if (whileLoopGuard_1)
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}
needle_cuda_shared_1_write((enableSignal_write&&whileLoopGuard_1), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
if (whileLoopGuard_1)
{
ty ++ ;
}
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
int whileLoopGuard_2;
int whileLoopGuard_3;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
whileLoopGuard_2=1;
ty=0;
while (1)
{
whileLoopGuard_2&=ty<16;
if (( ! whileLoopGuard_2))
{
break;
}
if (whileLoopGuard_2)
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}
needle_cuda_shared_2_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_2), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
if (whileLoopGuard_2)
{
ty ++ ;
}
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
whileLoopGuard_3=1;
ty=0;
while (1)
{
whileLoopGuard_3&=ty<16;
if (( ! whileLoopGuard_3))
{
break;
}
if (whileLoopGuard_3)
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}
needle_cuda_shared_2_write((enableSignal_write&&whileLoopGuard_3), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
if (whileLoopGuard_3)
{
ty ++ ;
}
}
}



===========================================
[WrapBlockIdxLoop-FCUDA] begin
[WrapBlockIdxLoop-FCUDA] examining procedure needle_cuda_shared_1
[WrapBlockIdxLoop-FCUDA] examining procedure needle_cuda_shared_2
[WrapBlockIdxLoop-FCUDA] end in 0.00 seconds
[LinkSymbol] 402 updates in 0.00 seconds

*** After WrapBlockIdxLoop  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
int whileLoopGuard_0;
int whileLoopGuard_1;
blockIdx.y=0;
blockIdx.x=core_id;
while (1)
{
while (blockIdx.x>=gridDim.x)
{
blockIdx.x=(blockIdx.x-gridDim.x);
blockIdx.y=(blockIdx.y+1);
}
if ((blockIdx.y>=gridDim.y))
{
break;
}
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
whileLoopGuard_0=1;
ty=0;
while (1)
{
whileLoopGuard_0&=ty<16;
if (( ! whileLoopGuard_0))
{
break;
}
if (whileLoopGuard_0)
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}
needle_cuda_shared_1_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_0), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
if (whileLoopGuard_0)
{
ty ++ ;
}
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
whileLoopGuard_1=1;
ty=0;
while (1)
{
whileLoopGuard_1&=ty<16;
if (( ! whileLoopGuard_1))
{
break;
}
if (whileLoopGuard_1)
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}
needle_cuda_shared_1_write((enableSignal_write&&whileLoopGuard_1), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
if (whileLoopGuard_1)
{
ty ++ ;
}
}
blockIdx.x=(blockIdx.x+num_cores);
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
int whileLoopGuard_2;
int whileLoopGuard_3;
blockIdx.y=0;
blockIdx.x=core_id;
while (1)
{
while (blockIdx.x>=gridDim.x)
{
blockIdx.x=(blockIdx.x-gridDim.x);
blockIdx.y=(blockIdx.y+1);
}
if ((blockIdx.y>=gridDim.y))
{
break;
}
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
whileLoopGuard_2=1;
ty=0;
while (1)
{
whileLoopGuard_2&=ty<16;
if (( ! whileLoopGuard_2))
{
break;
}
if (whileLoopGuard_2)
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}
needle_cuda_shared_2_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_2), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
if (whileLoopGuard_2)
{
ty ++ ;
}
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
whileLoopGuard_3=1;
ty=0;
while (1)
{
whileLoopGuard_3&=ty<16;
if (( ! whileLoopGuard_3))
{
break;
}
if (whileLoopGuard_3)
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}
needle_cuda_shared_2_write((enableSignal_write&&whileLoopGuard_3), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
if (whileLoopGuard_3)
{
ty ++ ;
}
}
blockIdx.x=(blockIdx.x+num_cores);
}
}



===========================================
[PipelineFCUDACores-FCUDA] begin
[PipelineFCUDACores-FCUDA] examining procedure needle_cuda_shared_1
[PipelineFCUDACores-FCUDA] examining procedure needle_cuda_shared_2
[PipelineFCUDACores-FCUDA] end in 0.00 seconds
[LinkSymbol] 402 updates in 0.00 seconds

*** After PipelineFCUDACores  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
int whileLoopGuard_0;
int whileLoopGuard_1;
blockIdx.y=0;
blockIdx.x=core_id;
while (1)
{
while (blockIdx.x>=gridDim.x)
{
blockIdx.x=(blockIdx.x-gridDim.x);
blockIdx.y=(blockIdx.y+1);
}
if ((blockIdx.y>=gridDim.y))
{
break;
}
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
whileLoopGuard_0=1;
ty=0;
while (1)
{
whileLoopGuard_0&=ty<16;
if (( ! whileLoopGuard_0))
{
break;
}
if (whileLoopGuard_0)
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}
needle_cuda_shared_1_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_0), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
if (whileLoopGuard_0)
{
ty ++ ;
}
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
whileLoopGuard_1=1;
ty=0;
while (1)
{
whileLoopGuard_1&=ty<16;
if (( ! whileLoopGuard_1))
{
break;
}
if (whileLoopGuard_1)
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}
needle_cuda_shared_1_write((enableSignal_write&&whileLoopGuard_1), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
if (whileLoopGuard_1)
{
ty ++ ;
}
}
blockIdx.x=(blockIdx.x+num_cores);
}
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
int whileLoopGuard_2;
int whileLoopGuard_3;
blockIdx.y=0;
blockIdx.x=core_id;
while (1)
{
while (blockIdx.x>=gridDim.x)
{
blockIdx.x=(blockIdx.x-gridDim.x);
blockIdx.y=(blockIdx.y+1);
}
if ((blockIdx.y>=gridDim.y))
{
break;
}
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
whileLoopGuard_2=1;
ty=0;
while (1)
{
whileLoopGuard_2&=ty<16;
if (( ! whileLoopGuard_2))
{
break;
}
if (whileLoopGuard_2)
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}
needle_cuda_shared_2_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_2), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
if (whileLoopGuard_2)
{
ty ++ ;
}
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
whileLoopGuard_3=1;
ty=0;
while (1)
{
whileLoopGuard_3&=ty<16;
if (( ! whileLoopGuard_3))
{
break;
}
if (whileLoopGuard_3)
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}
needle_cuda_shared_2_write((enableSignal_write&&whileLoopGuard_3), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
if (whileLoopGuard_3)
{
ty ++ ;
}
}
blockIdx.x=(blockIdx.x+num_cores);
}
}



===========================================
[DuplicateForFCUDA-FCUDA] begin
[DuplicateForFCUDA-FCUDA] examining procedure needle_cuda_shared_1
cData getNumCores#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_init_temp;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
int whileLoopGuard_0;
int whileLoopGuard_1;
blockIdx.y=0;
blockIdx.x=core_id;
while (1)
{
while (blockIdx.x>=gridDim.x)
{
blockIdx.x=(blockIdx.x-gridDim.x);
blockIdx.y=(blockIdx.y+1);
}
if ((blockIdx.y>=gridDim.y))
{
break;
}
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_y=((i-1)-blockIdx.x);
index=((((cols*16)*b_index_y)+(16*blockIdx.x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*blockIdx.x))+1);
index_w=((((cols*16)*b_index_y)+(16*blockIdx.x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*blockIdx.x));
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
whileLoopGuard_0=1;
ty=0;
while (1)
{
whileLoopGuard_0&=ty<16;
if (( ! whileLoopGuard_0))
{
break;
}
if (whileLoopGuard_0)
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}
needle_cuda_shared_1_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_0), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
if (whileLoopGuard_0)
{
ty ++ ;
}
}
__syncthreads();
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
whileLoopGuard_1=1;
ty=0;
while (1)
{
whileLoopGuard_1&=ty<16;
if (( ! whileLoopGuard_1))
{
break;
}
if (whileLoopGuard_1)
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}
needle_cuda_shared_1_write((enableSignal_write&&whileLoopGuard_1), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
if (whileLoopGuard_1)
{
ty ++ ;
}
}
blockIdx.x=(blockIdx.x+num_cores);
}
}
1
numParallelThreadBlocks:1
needle_cuda_shared_1 is inStreamProc: false
fcudaCores:
[needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_1_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_0), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_1_write((enableSignal_write&&whileLoopGuard_1), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)]
coreNames: 
[needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_1_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_0), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_1_write((enableSignal_write&&whileLoopGuard_1), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1), needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_2_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_2), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_2_write((enableSignal_write&&whileLoopGuard_3), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)]
------------------------
mVarsToDuplicate: []
mId2sym: {b_index_y_block0=b_index_y_block0, blockIdx_block0=blockIdx_block0, enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_fetch_ref_block0=enableSignal_fetch_ref_block0, enableSignal_fetch_temp_block0=enableSignal_fetch_temp_block0, enableSignal_init_temp2_block0=enableSignal_init_temp2_block0, enableSignal_init_temp_block0=enableSignal_init_temp_block0, enableSignal_write_block0=enableSignal_write_block0, fetch_ref_ref_X_0_block0=fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0=fetch_ref_ref_c_1_block0, fetch_ref_ref_offset_block0=fetch_ref_ref_offset_block0, fetch_temp_temp_X_0_block0=fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0=fetch_temp_temp_c_1_block0, fetch_temp_temp_offset_block0=fetch_temp_temp_offset_block0, index_block0=index_block0, index_n_block0=index_n_block0, index_nw_block0=index_nw_block0, index_w_block0=index_w_block0, ref_block0=ref_block0[16][16], temp_block0=temp_block0[(16+1)][(16+1)], ty_block0=ty_block0, whileLoopGuard_0_block0=whileLoopGuard_0_block0, whileLoopGuard_1_block0=whileLoopGuard_1_block0, write_temp_X_0_block0=write_temp_X_0_block0, write_temp_c_1_block0=write_temp_c_1_block0, write_temp_offset_block0=write_temp_offset_block0}
mId2sym: {b_index_y_block0=b_index_y_block0, blockIdx_block0=blockIdx_block0, enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_fetch_ref_block0=enableSignal_fetch_ref_block0, enableSignal_fetch_temp_block0=enableSignal_fetch_temp_block0, enableSignal_init_temp2_block0=enableSignal_init_temp2_block0, enableSignal_init_temp_block0=enableSignal_init_temp_block0, enableSignal_write_block0=enableSignal_write_block0, fetch_ref_ref_X_0_block0=fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0=fetch_ref_ref_c_1_block0, fetch_ref_ref_offset_block0=fetch_ref_ref_offset_block0, fetch_temp_temp_X_0_block0=fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0=fetch_temp_temp_c_1_block0, fetch_temp_temp_offset_block0=fetch_temp_temp_offset_block0, index_block0=index_block0, index_n_block0=index_n_block0, index_nw_block0=index_nw_block0, index_w_block0=index_w_block0, ref_block0=ref_block0[16][16], temp_block0=temp_block0[(16+1)][(16+1)], ty_block0=ty_block0, whileLoopGuard_0_block0=whileLoopGuard_0_block0, whileLoopGuard_1_block0=whileLoopGuard_1_block0, write_temp_X_0_block0=write_temp_X_0_block0, write_temp_c_1_block0=write_temp_c_1_block0, write_temp_offset_block0=write_temp_offset_block0}
mId2sym: {b_index_y_block0=b_index_y_block0, blockIdx_block0=blockIdx_block0, enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_fetch_ref_block0=enableSignal_fetch_ref_block0, enableSignal_fetch_temp_block0=enableSignal_fetch_temp_block0, enableSignal_init_temp2_block0=enableSignal_init_temp2_block0, enableSignal_init_temp_block0=enableSignal_init_temp_block0, enableSignal_write_block0=enableSignal_write_block0, fetch_ref_ref_X_0_block0=fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0=fetch_ref_ref_c_1_block0, fetch_ref_ref_offset_block0=fetch_ref_ref_offset_block0, fetch_temp_temp_X_0_block0=fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0=fetch_temp_temp_c_1_block0, fetch_temp_temp_offset_block0=fetch_temp_temp_offset_block0, index_block0=index_block0, index_n_block0=index_n_block0, index_nw_block0=index_nw_block0, index_w_block0=index_w_block0, ref_block0=ref_block0[16][16], temp_block0=temp_block0[(16+1)][(16+1)], ty_block0=ty_block0, whileLoopGuard_0_block0=whileLoopGuard_0_block0, whileLoopGuard_1_block0=whileLoopGuard_1_block0, write_temp_X_0_block0=write_temp_X_0_block0, write_temp_c_1_block0=write_temp_c_1_block0, write_temp_offset_block0=write_temp_offset_block0}
... handleCompoundStatement finished! 
[DuplicateForFCUDA-FCUDA] examining procedure needle_cuda_shared_2
cData getNumCores#pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x;
int b_index_y;
int index;
int index_n;
int index_w;
int index_nw;
__shared__ int temp[(16+1)][(16+1)];
__shared__ int ref[16][16];
int ty;
int enableSignal_fetch_ref;
int fetch_ref_ref_offset;
int fetch_ref_ref_X_0;
int fetch_ref_ref_c_1;
int enableSignal_init_temp;
int enableSignal_init_temp2;
int enableSignal_fetch_temp;
int fetch_temp_temp_offset;
int fetch_temp_temp_X_0;
int fetch_temp_temp_c_1;
int enableSignal_compute;
int enableSignal_write;
int write_temp_offset;
int write_temp_X_0;
int write_temp_c_1;
dim3 blockIdx;
int whileLoopGuard_2;
int whileLoopGuard_3;
blockIdx.y=0;
blockIdx.x=core_id;
while (1)
{
while (blockIdx.x>=gridDim.x)
{
blockIdx.x=(blockIdx.x-gridDim.x);
blockIdx.y=(blockIdx.y+1);
}
if ((blockIdx.y>=gridDim.y))
{
break;
}
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp2=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_init_temp=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch_ref=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
b_index_x=((blockIdx.x+block_width)-i);
b_index_y=((block_width-blockIdx.x)-1);
index=((((cols*16)*b_index_y)+(16*b_index_x))+(cols+1));
index_n=((((cols*16)*b_index_y)+(16*b_index_x))+1);
index_w=((((cols*16)*b_index_y)+(16*b_index_x))+cols);
index_nw=(((cols*16)*b_index_y)+(16*b_index_x));
whileLoopGuard_2=1;
ty=0;
while (1)
{
whileLoopGuard_2&=ty<16;
if (( ! whileLoopGuard_2))
{
break;
}
if (whileLoopGuard_2)
{
fetch_ref_ref_offset=0;
fetch_ref_ref_X_0=(index+(cols*ty));
fetch_ref_ref_c_1=0;
}
needle_cuda_shared_2_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_2), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1);
if (whileLoopGuard_2)
{
ty ++ ;
}
}
__syncthreads();
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp);
#pragma fcuda compute name=init_temp end=true cores=[1] begin=false 
#pragma fcuda compute name=init_temp2 end=false cores=[1] begin=true 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp);
#pragma fcuda compute name=init_temp2 end=true cores=[1] begin=false 
__syncthreads();
fetch_temp_temp_offset=1;
fetch_temp_temp_X_0=index_n;
fetch_temp_temp_c_1=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=true cores=[1] unroll=1 begin=false size=[16] 
__syncthreads();
#pragma fcuda compute array_split=[] mpart=1 name=compute end=false cores=[1] unroll=1 begin=true 
needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp);
#pragma fcuda compute array_split=[] mpart=1 name=compute end=true cores=[1] unroll=1 begin=false 
whileLoopGuard_3=1;
ty=0;
while (1)
{
whileLoopGuard_3&=ty<16;
if (( ! whileLoopGuard_3))
{
break;
}
if (whileLoopGuard_3)
{
write_temp_offset=1;
write_temp_X_0=(index+(cols*ty));
write_temp_c_1=0;
}
needle_cuda_shared_2_write((enableSignal_write&&whileLoopGuard_3), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1);
if (whileLoopGuard_3)
{
ty ++ ;
}
}
blockIdx.x=(blockIdx.x+num_cores);
}
}
1
numParallelThreadBlocks:1
needle_cuda_shared_2 is inStreamProc: false
fcudaCores:
[needle_cuda_shared_2_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_2), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_2_write((enableSignal_write&&whileLoopGuard_3), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)]
coreNames: 
[needle_cuda_shared_1_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_1_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_0), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_1_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_1_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_1_write((enableSignal_write&&whileLoopGuard_1), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1), needle_cuda_shared_2_compute(enableSignal_compute, blockDim, gridDim, blockIdx, penalty, ref, temp), needle_cuda_shared_2_fetch_ref((enableSignal_fetch_ref&&whileLoopGuard_2), blockDim, gridDim, referrence, ref, fetch_ref_ref_offset, ty, fetch_ref_ref_X_0, fetch_ref_ref_c_1), needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp, blockDim, gridDim, matrix_cuda, temp, fetch_temp_temp_offset, fetch_temp_temp_X_0, fetch_temp_temp_c_1), needle_cuda_shared_2_init_temp(enableSignal_init_temp, blockDim, gridDim, blockIdx, index_nw, matrix_cuda, temp), needle_cuda_shared_2_init_temp2(enableSignal_init_temp2, blockDim, gridDim, blockIdx, cols, index_w, matrix_cuda, temp), needle_cuda_shared_2_write((enableSignal_write&&whileLoopGuard_3), blockDim, gridDim, matrix_cuda, temp, write_temp_offset, ty, write_temp_X_0, write_temp_c_1)]
------------------------
mVarsToDuplicate: []
mId2sym: {b_index_x_block0=b_index_x_block0, b_index_y_block0=b_index_y_block0, blockIdx_block0=blockIdx_block0, enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_fetch_ref_block0=enableSignal_fetch_ref_block0, enableSignal_fetch_temp_block0=enableSignal_fetch_temp_block0, enableSignal_init_temp2_block0=enableSignal_init_temp2_block0, enableSignal_init_temp_block0=enableSignal_init_temp_block0, enableSignal_write_block0=enableSignal_write_block0, fetch_ref_ref_X_0_block0=fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0=fetch_ref_ref_c_1_block0, fetch_ref_ref_offset_block0=fetch_ref_ref_offset_block0, fetch_temp_temp_X_0_block0=fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0=fetch_temp_temp_c_1_block0, fetch_temp_temp_offset_block0=fetch_temp_temp_offset_block0, index_block0=index_block0, index_n_block0=index_n_block0, index_nw_block0=index_nw_block0, index_w_block0=index_w_block0, ref_block0=ref_block0[16][16], temp_block0=temp_block0[(16+1)][(16+1)], ty_block0=ty_block0, whileLoopGuard_0_block0=whileLoopGuard_0_block0, whileLoopGuard_1_block0=whileLoopGuard_1_block0, whileLoopGuard_2_block0=whileLoopGuard_2_block0, whileLoopGuard_3_block0=whileLoopGuard_3_block0, write_temp_X_0_block0=write_temp_X_0_block0, write_temp_c_1_block0=write_temp_c_1_block0, write_temp_offset_block0=write_temp_offset_block0}
mId2sym: {b_index_x_block0=b_index_x_block0, b_index_y_block0=b_index_y_block0, blockIdx_block0=blockIdx_block0, enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_fetch_ref_block0=enableSignal_fetch_ref_block0, enableSignal_fetch_temp_block0=enableSignal_fetch_temp_block0, enableSignal_init_temp2_block0=enableSignal_init_temp2_block0, enableSignal_init_temp_block0=enableSignal_init_temp_block0, enableSignal_write_block0=enableSignal_write_block0, fetch_ref_ref_X_0_block0=fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0=fetch_ref_ref_c_1_block0, fetch_ref_ref_offset_block0=fetch_ref_ref_offset_block0, fetch_temp_temp_X_0_block0=fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0=fetch_temp_temp_c_1_block0, fetch_temp_temp_offset_block0=fetch_temp_temp_offset_block0, index_block0=index_block0, index_n_block0=index_n_block0, index_nw_block0=index_nw_block0, index_w_block0=index_w_block0, ref_block0=ref_block0[16][16], temp_block0=temp_block0[(16+1)][(16+1)], ty_block0=ty_block0, whileLoopGuard_0_block0=whileLoopGuard_0_block0, whileLoopGuard_1_block0=whileLoopGuard_1_block0, whileLoopGuard_2_block0=whileLoopGuard_2_block0, whileLoopGuard_3_block0=whileLoopGuard_3_block0, write_temp_X_0_block0=write_temp_X_0_block0, write_temp_c_1_block0=write_temp_c_1_block0, write_temp_offset_block0=write_temp_offset_block0}
mId2sym: {b_index_x_block0=b_index_x_block0, b_index_y_block0=b_index_y_block0, blockIdx_block0=blockIdx_block0, enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_fetch_ref_block0=enableSignal_fetch_ref_block0, enableSignal_fetch_temp_block0=enableSignal_fetch_temp_block0, enableSignal_init_temp2_block0=enableSignal_init_temp2_block0, enableSignal_init_temp_block0=enableSignal_init_temp_block0, enableSignal_write_block0=enableSignal_write_block0, fetch_ref_ref_X_0_block0=fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0=fetch_ref_ref_c_1_block0, fetch_ref_ref_offset_block0=fetch_ref_ref_offset_block0, fetch_temp_temp_X_0_block0=fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0=fetch_temp_temp_c_1_block0, fetch_temp_temp_offset_block0=fetch_temp_temp_offset_block0, index_block0=index_block0, index_n_block0=index_n_block0, index_nw_block0=index_nw_block0, index_w_block0=index_w_block0, ref_block0=ref_block0[16][16], temp_block0=temp_block0[(16+1)][(16+1)], ty_block0=ty_block0, whileLoopGuard_0_block0=whileLoopGuard_0_block0, whileLoopGuard_1_block0=whileLoopGuard_1_block0, whileLoopGuard_2_block0=whileLoopGuard_2_block0, whileLoopGuard_3_block0=whileLoopGuard_3_block0, write_temp_X_0_block0=write_temp_X_0_block0, write_temp_c_1_block0=write_temp_c_1_block0, write_temp_offset_block0=write_temp_offset_block0}
... handleCompoundStatement finished! 
[DuplicateForFCUDA-FCUDA] end in 0.02 seconds
[LinkSymbol] 463 updates in 0.00 seconds

*** After DuplicateForFCUDA  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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
__syncthreads();
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp2 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2_block0, blockDim, gridDim, blockIdx_block0, cols, index_w_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp2 
__syncthreads();
fetch_temp_temp_offset_block0=1;
fetch_temp_temp_X_0_block0=index_n_block0;
fetch_temp_temp_c_1_block0=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst cores=[1] end=false size=[16] begin=true 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, matrix_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst cores=[1] end=true size=[16] begin=false 
__syncthreads();
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

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
int m;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=0;
}
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m ++ ;
}
__syncthreads();
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m=(16-2);
}
__syncthreads();
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
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
m -- ;
}
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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
__syncthreads();
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp 
needle_cuda_shared_2_init_temp(enableSignal_init_temp_block0, blockDim, gridDim, blockIdx_block0, index_nw_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp 
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp2 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2_block0, blockDim, gridDim, blockIdx_block0, cols, index_w_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp2 
__syncthreads();
fetch_temp_temp_offset_block0=1;
fetch_temp_temp_X_0_block0=index_n_block0;
fetch_temp_temp_c_1_block0=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, matrix_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
__syncthreads();
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



===========================================
[CleanThreadLoops-MCUDA] begin
[CleanThreadLoops-MCUDA] examining procedure needle_cuda_shared_1
mVar2Var:
{ref=[], enableSignal_compute=[], blockDim=[], threadIdx=[], temp=[threadIdx, t_index_x, m, t_index_y, penalty], t_index_x=[threadIdx, m], m=[m], t_index_y=[threadIdx, m], penalty=[]}
mVar2Var:
{ref=[], enableSignal_compute=[], blockDim=[], threadIdx=[], temp=[threadIdx, t_index_x, m, t_index_y, penalty], t_index_x=[threadIdx, m], m=[m], t_index_y=[threadIdx, m], penalty=[]}
mVar2Var:
{ref=[], enableSignal_compute=[], blockDim=[], threadIdx=[], temp=[threadIdx, t_index_x, m, t_index_y, penalty], t_index_x=[threadIdx, m], m=[m], t_index_y=[threadIdx, m], penalty=[]}
mVar2Var:
{ref=[], enableSignal_compute=[], blockDim=[], threadIdx=[], temp=[threadIdx, t_index_x, m, t_index_y, penalty], t_index_x=[threadIdx, m], m=[m], t_index_y=[threadIdx, m], penalty=[]}
[CleanThreadLoops-MCUDA] examining procedure needle_cuda_shared_2
mVar2Var:
{ref=[], enableSignal_compute=[], blockDim=[], threadIdx=[], temp=[threadIdx, t_index_x, m, t_index_y, penalty], t_index_x=[threadIdx, m], m=[m], t_index_y=[threadIdx, m], penalty=[]}
mVar2Var:
{ref=[], enableSignal_compute=[], blockDim=[], threadIdx=[], temp=[threadIdx, t_index_x, m, t_index_y, penalty], t_index_x=[threadIdx, m], m=[m], t_index_y=[threadIdx, m], penalty=[]}
mVar2Var:
{ref=[], enableSignal_compute=[], blockDim=[], threadIdx=[], temp=[threadIdx, t_index_x, m, t_index_y, penalty], t_index_x=[threadIdx, m], m=[m], t_index_y=[threadIdx, m], penalty=[]}
mVar2Var:
{ref=[], enableSignal_compute=[], blockDim=[], threadIdx=[], temp=[threadIdx, t_index_x, m, t_index_y, penalty], t_index_x=[threadIdx, m], m=[m], t_index_y=[threadIdx, m], penalty=[]}
[CleanThreadLoops-MCUDA] end in 0.05 seconds
[LinkSymbol] 463 updates in 0.00 seconds

*** After CleanThreadLoops  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
__syncthreads();
m ++ ;
__syncthreads();
}
m=(16-2);
__syncthreads();
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
__syncthreads();
m -- ;
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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
__syncthreads();
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp2 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2_block0, blockDim, gridDim, blockIdx_block0, cols, index_w_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp2 
__syncthreads();
fetch_temp_temp_offset_block0=1;
fetch_temp_temp_X_0_block0=index_n_block0;
fetch_temp_temp_c_1_block0=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst cores=[1] end=false size=[16] begin=true 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, matrix_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst cores=[1] end=true size=[16] begin=false 
__syncthreads();
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

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
__syncthreads();
m ++ ;
__syncthreads();
}
m=(16-2);
__syncthreads();
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
__syncthreads();
m -- ;
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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
__syncthreads();
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp 
needle_cuda_shared_2_init_temp(enableSignal_init_temp_block0, blockDim, gridDim, blockIdx_block0, index_nw_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp 
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp2 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2_block0, blockDim, gridDim, blockIdx_block0, cols, index_w_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp2 
__syncthreads();
fetch_temp_temp_offset_block0=1;
fetch_temp_temp_X_0_block0=index_n_block0;
fetch_temp_temp_c_1_block0=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, matrix_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
__syncthreads();
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



===========================================
[KernelStateTransform-MCUDA] begin
[KernelStateTransform-MCUDA] examining procedure needle_cuda_shared_1
>>> outside uses:
[b_index_y_block0, blockIdx_block0, blockIdx_block0.x, blockIdx_block0.y, cols, enableSignal_compute_block0, enableSignal_fetch_ref_block0, enableSignal_fetch_temp_block0, enableSignal_init_temp2_block0, enableSignal_init_temp_block0, enableSignal_write_block0, fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0, fetch_ref_ref_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0, fetch_temp_temp_offset_block0, gridDim.x, gridDim.y, i, index_block0, index_n_block0, index_nw_block0, index_w_block0, matrix_cuda, penalty, ref_block0, referrence, temp_block0, ty_block0, whileLoopGuard_0_block0, whileLoopGuard_1_block0, write_temp_X_0_block0, write_temp_c_1_block0, write_temp_offset_block0]
>>> handling: b_index_y_block0
>>> handling: blockIdx_block0
>>> handling: blockIdx_block0
>>> handling: blockIdx_block0
>>> handling: cols
>>> handling: enableSignal_compute_block0
>>> handling: enableSignal_fetch_ref_block0
>>> handling: enableSignal_fetch_temp_block0
>>> handling: enableSignal_init_temp2_block0
>>> handling: enableSignal_init_temp_block0
>>> handling: enableSignal_write_block0
>>> handling: fetch_ref_ref_X_0_block0
>>> handling: fetch_ref_ref_c_1_block0
>>> handling: fetch_ref_ref_offset_block0
>>> handling: fetch_temp_temp_X_0_block0
>>> handling: fetch_temp_temp_c_1_block0
>>> handling: fetch_temp_temp_offset_block0
>>> handling: gridDim
>>> handling: gridDim
>>> handling: i
>>> handling: index_block0
>>> handling: index_n_block0
>>> handling: index_nw_block0
>>> handling: index_w_block0
>>> handling: * matrix_cuda
>>> handling: penalty
>>> handling: ref_block0[16][16]
>>> handling: * referrence
>>> handling: temp_block0[(16+1)][(16+1)]
>>> handling: ty_block0
>>> handling: whileLoopGuard_0_block0
>>> handling: whileLoopGuard_1_block0
>>> handling: write_temp_X_0_block0
>>> handling: write_temp_c_1_block0
>>> handling: write_temp_offset_block0
transforming Decls
[KernelStateTransform-MCUDA] examining procedure needle_cuda_shared_2
>>> outside uses:
[b_index_x_block0, b_index_y_block0, blockIdx_block0, blockIdx_block0.x, blockIdx_block0.y, block_width, cols, enableSignal_compute_block0, enableSignal_fetch_ref_block0, enableSignal_fetch_temp_block0, enableSignal_init_temp2_block0, enableSignal_init_temp_block0, enableSignal_write_block0, fetch_ref_ref_X_0_block0, fetch_ref_ref_c_1_block0, fetch_ref_ref_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0, fetch_temp_temp_offset_block0, gridDim.x, gridDim.y, i, index_block0, index_n_block0, index_nw_block0, index_w_block0, matrix_cuda, penalty, ref_block0, referrence, temp_block0, ty_block0, whileLoopGuard_2_block0, whileLoopGuard_3_block0, write_temp_X_0_block0, write_temp_c_1_block0, write_temp_offset_block0]
>>> handling: b_index_x_block0
>>> handling: b_index_y_block0
>>> handling: blockIdx_block0
>>> handling: blockIdx_block0
>>> handling: blockIdx_block0
>>> handling: block_width
>>> handling: cols
>>> handling: enableSignal_compute_block0
>>> handling: enableSignal_fetch_ref_block0
>>> handling: enableSignal_fetch_temp_block0
>>> handling: enableSignal_init_temp2_block0
>>> handling: enableSignal_init_temp_block0
>>> handling: enableSignal_write_block0
>>> handling: fetch_ref_ref_X_0_block0
>>> handling: fetch_ref_ref_c_1_block0
>>> handling: fetch_ref_ref_offset_block0
>>> handling: fetch_temp_temp_X_0_block0
>>> handling: fetch_temp_temp_c_1_block0
>>> handling: fetch_temp_temp_offset_block0
>>> handling: gridDim
>>> handling: gridDim
>>> handling: i
>>> handling: index_block0
>>> handling: index_n_block0
>>> handling: index_nw_block0
>>> handling: index_w_block0
>>> handling: * matrix_cuda
>>> handling: penalty
>>> handling: ref_block0[16][16]
>>> handling: * referrence
>>> handling: temp_block0[(16+1)][(16+1)]
>>> handling: ty_block0
>>> handling: whileLoopGuard_2_block0
>>> handling: whileLoopGuard_3_block0
>>> handling: write_temp_X_0_block0
>>> handling: write_temp_c_1_block0
>>> handling: write_temp_offset_block0
transforming Decls
[KernelStateTransform-MCUDA] end in 0.04 seconds
[LinkSymbol] 463 updates in 0.00 seconds

*** After KernelStateTransform  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
__syncthreads();
m ++ ;
__syncthreads();
}
m=(16-2);
__syncthreads();
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
__syncthreads();
m -- ;
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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
__syncthreads();
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp2 
needle_cuda_shared_1_init_temp2(enableSignal_init_temp2_block0, blockDim, gridDim, blockIdx_block0, cols, index_w_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp2 
__syncthreads();
fetch_temp_temp_offset_block0=1;
fetch_temp_temp_X_0_block0=index_n_block0;
fetch_temp_temp_c_1_block0=0;
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst cores=[1] end=false size=[16] begin=true 
needle_cuda_shared_1_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, matrix_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst cores=[1] end=true size=[16] begin=false 
__syncthreads();
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

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
__syncthreads();
m ++ ;
__syncthreads();
}
m=(16-2);
__syncthreads();
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
__syncthreads();
m -- ;
__syncthreads();
}
__syncthreads();
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_ref pointer=[referrence] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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
__syncthreads();
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp 
needle_cuda_shared_2_init_temp(enableSignal_init_temp_block0, blockDim, gridDim, blockIdx_block0, index_nw_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp 
#pragma fcuda compute cores=[1] end=false begin=true name=init_temp2 
needle_cuda_shared_2_init_temp2(enableSignal_init_temp2_block0, blockDim, gridDim, blockIdx_block0, cols, index_w_block0, matrix_cuda, temp_block0);
#pragma fcuda compute cores=[1] end=true begin=false name=init_temp2 
__syncthreads();
fetch_temp_temp_offset_block0=1;
fetch_temp_temp_X_0_block0=index_n_block0;
fetch_temp_temp_c_1_block0=0;
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst unroll=1 cores=[1] end=false size=[16] begin=true 
needle_cuda_shared_2_fetch_temp(enableSignal_fetch_temp_block0, blockDim, gridDim, matrix_cuda, temp_block0, fetch_temp_temp_offset_block0, fetch_temp_temp_X_0_block0, fetch_temp_temp_c_1_block0);
#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst unroll=1 cores=[1] end=true size=[16] begin=false 
__syncthreads();
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



===========================================
[CleanSyncFunc-MCUDA] begin
[CleanSyncFunc-MCUDA] examining procedure needle_cuda_shared_1
[CleanSyncFunc-MCUDA] examining procedure needle_cuda_shared_2
[CleanSyncFunc-MCUDA] end in 0.00 seconds
[LinkSymbol] 453 updates in 0.00 seconds

*** After CleanSyncFunc  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
#pragma fcuda portmerge port_id=0 remove_port_name=referrence 
#pragma fcuda portmerge port_id=0 remove_port_name=matrix_cuda 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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



===========================================
[GenWrapperSingleKernel - FCUDA] begin
[GenWrapperSingleKernel - FCUDA] examining procedure needle_cuda_shared_1
[GenWrapperSingleKernel - FCUDA] examining procedure needle_cuda_shared_2
[GenWrapperSingleKernel - FCUDA] end in 0.00 seconds
[LinkSymbol] 453 updates in 0.00 seconds

*** After GenWrapperSingleKernel  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda1(int referrence_addr, int * referrence_core0, int matrix_cuda_addr, int * matrix_cuda_core0, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim)
{
needle_cuda_shared_1(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda2(int referrence_addr, int * referrence_core0, int matrix_cuda_addr, int * matrix_cuda_core0, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim)
{
needle_cuda_shared_2(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}



===========================================
[FixFCUDAMemParams-FCUDA] begin
[FixFCUDAMemParams-FCUDA] examining procedure needle_cuda_shared_1
Proc: #pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

This proc does not contain remove ports pragmas. Skip.
[FixFCUDAMemParams-FCUDA] examining procedure fcuda1
Proc: #pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda1(int referrence_addr, int * referrence_core0, int matrix_cuda_addr, int * matrix_cuda_core0, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim)
{
needle_cuda_shared_1(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}

fcuda1(int referrence_addr, int * referrence_core0, int matrix_cuda_addr, int * matrix_cuda_core0, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim)
in getMatchingDecl
[int referrence_addr, int * referrence_core0, int matrix_cuda_addr, int * matrix_cuda_core0, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim]
[]
Removals: [referrence_core0, matrix_cuda_core0]
child: int referrence_addr
[referrence_addr]
referrence_addr
[referrence_core0, matrix_cuda_core0]
child: int * referrence_core0
[referrence_core0]
referrence_core0
[referrence_core0, matrix_cuda_core0]
id: referrence_core0
child: int matrix_cuda_addr
[matrix_cuda_addr]
matrix_cuda_addr
[referrence_core0, matrix_cuda_core0]
child: int * matrix_cuda_core0
[matrix_cuda_core0]
matrix_cuda_core0
[referrence_core0, matrix_cuda_core0]
id: matrix_cuda_core0
child: int cols
[cols]
cols
[referrence_core0, matrix_cuda_core0]
child: int penalty
[penalty]
penalty
[referrence_core0, matrix_cuda_core0]
child: int i
[i]
i
[referrence_core0, matrix_cuda_core0]
child: int block_width
[block_width]
block_width
[referrence_core0, matrix_cuda_core0]
child: dim3 gridDim
[gridDim]
gridDim
[referrence_core0, matrix_cuda_core0]
child: dim3 blockDim
[blockDim]
blockDim
[referrence_core0, matrix_cuda_core0]
before exit
[int * referrence_core0, int * matrix_cuda_core0]
[int * referrence_core0, int * matrix_cuda_core0]
VariableDeclaration: [* ]
int * matrix_cuda_core0
[int]
[int]
int * memport_core0_p0
referrence_core0
referrence_core0 [#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 ]
matrix_cuda_core0
matrix_cuda_core0 [#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 ]
Annot is: #pragma HLS interface ap_bus port=memport_core0_p0 
[FixFCUDAMemParams-FCUDA] examining procedure needle_cuda_shared_2
Proc: #pragma fcuda grid x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

This proc does not contain remove ports pragmas. Skip.
[FixFCUDAMemParams-FCUDA] examining procedure fcuda2
Proc: #pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda2(int referrence_addr, int * referrence_core0, int matrix_cuda_addr, int * matrix_cuda_core0, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim)
{
needle_cuda_shared_2(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}

fcuda2(int referrence_addr, int * referrence_core0, int matrix_cuda_addr, int * matrix_cuda_core0, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim)
in getMatchingDecl
[int referrence_addr, int * referrence_core0, int matrix_cuda_addr, int * matrix_cuda_core0, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim]
[]
Removals: [referrence_core0, matrix_cuda_core0]
child: int referrence_addr
[referrence_addr]
referrence_addr
[referrence_core0, matrix_cuda_core0]
child: int * referrence_core0
[referrence_core0]
referrence_core0
[referrence_core0, matrix_cuda_core0]
id: referrence_core0
child: int matrix_cuda_addr
[matrix_cuda_addr]
matrix_cuda_addr
[referrence_core0, matrix_cuda_core0]
child: int * matrix_cuda_core0
[matrix_cuda_core0]
matrix_cuda_core0
[referrence_core0, matrix_cuda_core0]
id: matrix_cuda_core0
child: int cols
[cols]
cols
[referrence_core0, matrix_cuda_core0]
child: int penalty
[penalty]
penalty
[referrence_core0, matrix_cuda_core0]
child: int i
[i]
i
[referrence_core0, matrix_cuda_core0]
child: int block_width
[block_width]
block_width
[referrence_core0, matrix_cuda_core0]
child: dim3 gridDim
[gridDim]
gridDim
[referrence_core0, matrix_cuda_core0]
child: dim3 blockDim
[blockDim]
blockDim
[referrence_core0, matrix_cuda_core0]
before exit
[int * referrence_core0, int * matrix_cuda_core0]
[int * referrence_core0, int * matrix_cuda_core0]
VariableDeclaration: [* ]
int * matrix_cuda_core0
[int]
[int]
int * memport_core0_p0
referrence_core0
referrence_core0 [#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 ]
matrix_cuda_core0
matrix_cuda_core0 [#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 ]
Annot is: #pragma HLS interface ap_bus port=memport_core0_p0 
[FixFCUDAMemParams-FCUDA] end in 0.01 seconds
[LinkSymbol] 461 updates in 0.00 seconds

*** After FixFCUDAMemParams ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda1(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
int * matrix_cuda_core0;
int * referrence_core0;
matrix_cuda_core0=( & memport_core0_p0[matrix_cuda_addr]);
referrence_core0=( & memport_core0_p0[referrence_addr]);
needle_cuda_shared_1(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda2(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
int * matrix_cuda_core0;
int * referrence_core0;
matrix_cuda_core0=( & memport_core0_p0[matrix_cuda_addr]);
referrence_core0=( & memport_core0_p0[referrence_addr]);
needle_cuda_shared_2(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}



===========================================
[GenWrapperMultiKernels - FCUDA] begin
[GenWrapperMultiKernels - FCUDA] examining procedure needle_cuda_shared_1
[GenWrapperMultiKernels - FCUDA] examining procedure fcuda1
[GenWrapperMultiKernels - FCUDA] examining procedure needle_cuda_shared_2
[GenWrapperMultiKernels - FCUDA] examining procedure fcuda2
[GenWrapperMultiKernels - FCUDA] end in 0.00 seconds
[LinkSymbol] 461 updates in 0.00 seconds

*** After GenWrapperMultiKernels  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda1(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
int * matrix_cuda_core0;
int * referrence_core0;
matrix_cuda_core0=( & memport_core0_p0[matrix_cuda_addr]);
referrence_core0=( & memport_core0_p0[referrence_addr]);
needle_cuda_shared_1(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}

const int BLOCKDIM_X_needle_cuda_shared_2 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda2(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
int * matrix_cuda_core0;
int * referrence_core0;
matrix_cuda_core0=( & memport_core0_p0[matrix_cuda_addr]);
referrence_core0=( & memport_core0_p0[referrence_addr]);
needle_cuda_shared_2(referrence_core0, matrix_cuda_core0, cols, penalty, i, block_width, gridDim, blockDim, 1, 0);
}

__global__ void fcuda(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0_int, int en_fcuda1, int en_fcuda2)
{
if ((en_fcuda1==1))
{
fcuda1(referrence_addr, matrix_cuda_addr, cols, penalty, i, block_width, gridDim, blockDim, memport_core0_p0_int);
}
if ((en_fcuda2==1))
{
fcuda2(referrence_addr, matrix_cuda_addr, cols, penalty, i, block_width, gridDim, blockDim, memport_core0_p0_int);
}
}



===========================================
[AddHLSPragmas-FCUDA] begin
[AddHLSPragmas-FCUDA] examining procedure needle_cuda_shared_1
[AddHLSPragmas-FCUDA] examining procedure fcuda1
[AddHLSPragmas-FCUDA] examining procedure needle_cuda_shared_2
[AddHLSPragmas-FCUDA] examining procedure fcuda2
[AddHLSPragmas-FCUDA] examining procedure fcuda
[AddHLSPragmas-FCUDA] end in 0.00 seconds
[LinkSymbol] 461 updates in 0.00 seconds

*** After AddHLSPragmas  ***
#include "needle.h"
#include <stdio.h>
#include "fcuda.h"
#include <string.h>
const int BLOCKDIM_X_needle_cuda_shared_1 = 16;
#pragma fcuda compute name=init_temp end=false cores=[1] begin=true 
void needle_cuda_shared_1_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] begin=true size=[16] 
void needle_cuda_shared_1_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_1_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_1_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_1_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
__global__ void needle_cuda_shared_1(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda1(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
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
void needle_cuda_shared_2_init_temp(int enableSignal_init_temp, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int index_nw, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_init_temp2(int enableSignal_init_temp2, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int cols, int index_w, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_init_temp2)
{
temp[(threadIdx.x+1)][0]=matrix_cuda[(index_w+(cols*threadIdx.x))];
}
}
}

#pragma fcuda transfer array_split=[] mpart=1 dir=[0] name=fetch_temp pointer=[matrix_cuda] type=burst end=false cores=[1] unroll=1 begin=true size=[16] 
void needle_cuda_shared_2_fetch_temp(int enableSignal_fetch_temp, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int fetch_temp_temp_offset, int fetch_temp_temp_X_0, int fetch_temp_temp_c_1)
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
void needle_cuda_shared_2_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int penalty, __shared__ int ref[16][16], __shared__ int temp[(16+1)][(16+1)])
{
dim3 __shared__ threadIdx;
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
void needle_cuda_shared_2_fetch_ref(int enableSignal_fetch_ref, dim3 blockDim, dim3 gridDim, int * referrence, __shared__ int ref[16][16], int fetch_ref_ref_offset, int ty, int fetch_ref_ref_X_0, int fetch_ref_ref_c_1)
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
void needle_cuda_shared_2_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, int * matrix_cuda, __shared__ int temp[(16+1)][(16+1)], int write_temp_offset, int ty, int write_temp_X_0, int write_temp_c_1)
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
__global__ void needle_cuda_shared_2(int * referrence, int * matrix_cuda, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int b_index_x_block0;
int b_index_y_block0;
int index_block0;
int index_n_block0;
int index_w_block0;
int index_nw_block0;
__shared__ int temp_block0[(16+1)][(16+1)];
__shared__ int ref_block0[16][16];
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

#pragma fcuda portmerge data_pack=no port_id=0 offset=referrence_addr remove_port_name=referrence_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=matrix_cuda_addr remove_port_name=matrix_cuda_core0 port_core=0 
__global__ void fcuda2(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
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

__global__ void fcuda(int referrence_addr, int matrix_cuda_addr, int cols, int penalty, int i, int block_width, dim3 gridDim, dim3 blockDim, int * memport_core0_p0_int, int en_fcuda1, int en_fcuda2)
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



===========================================
