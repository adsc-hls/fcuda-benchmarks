[LinkSymbol] 103 updates in 0.00 seconds
[AnnotParser] begin
PreAnnotation: #pragma startinclude #include <fcuda.h>

Parent: TranslationUnit 

PreAnnotation: #pragma endinclude

Parent: TranslationUnit 

PreAnnotation: #pragma startinclude #include <string.h>

Parent: TranslationUnit 

PreAnnotation: #pragma endinclude

Parent: TranslationUnit 

PreAnnotation: #pragma startinclude #include "pathfinder.h"

Parent: TranslationUnit 

PreAnnotation: #pragma endinclude

Parent: TranslationUnit 

PreAnnotation: #pragma FCUDA GRID x_dim=256

Token #
Token pragma
Token FCUDA
Token GRID
Token x_dim=256
#pragma fcuda grid x_dim=256 
attached=1

PreAnnotation: #pragma FCUDA COREINFO num_cores=1 pipeline=yes

Token #
Token pragma
Token FCUDA
Token COREINFO
Token num_cores=1
Token pipeline=yes
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
attached=1

PreAnnotation: #pragma FCUDA PORTMERGE remove_port_name=gpuWall port_id=0

Token #
Token pragma
Token FCUDA
Token PORTMERGE
Token remove_port_name=gpuWall
Token port_id=0
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
attached=1

PreAnnotation: #pragma FCUDA PORTMERGE remove_port_name=gpuSrc port_id=0

Token #
Token pragma
Token FCUDA
Token PORTMERGE
Token remove_port_name=gpuSrc
Token port_id=0
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
attached=1

PreAnnotation: #pragma FCUDA PORTMERGE remove_port_name=gpuResults port_id=0

Token #
Token pragma
Token FCUDA
Token PORTMERGE
Token remove_port_name=gpuResults
Token port_id=0
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
attached=1

DeclarationStatement: #pragma FCUDA COMPUTE begin name=fetch cores=[1] unroll=1 mpart=1 array_split=[result] ;

PreAnnotation: #pragma FCUDA COMPUTE begin name=fetch cores=[1] unroll=1 mpart=1 array_split=[result]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token begin
Token name=fetch
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[result]
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE end name=fetch cores=[1] unroll=1 mpart=1 array_split=[result] ;

PreAnnotation: #pragma FCUDA COMPUTE end name=fetch cores=[1] unroll=1 mpart=1 array_split=[result]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token end
Token name=fetch
Token cores=[1]
Token unroll=1
Token mpart=1
Token array_split=[result]
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE cores=[1] begin name=compute unroll=1 mpart=1 array_split=[result] ;

PreAnnotation: #pragma FCUDA COMPUTE cores=[1] begin name=compute unroll=1 mpart=1 array_split=[result]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token cores=[1]
Token begin
Token name=compute
Token unroll=1
Token mpart=1
Token array_split=[result]
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE cores=[1] end name=compute unroll=1 mpart=1 array_split=[result] ;

PreAnnotation: #pragma FCUDA COMPUTE cores=[1] end name=compute unroll=1 mpart=1 array_split=[result]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token cores=[1]
Token end
Token name=compute
Token unroll=1
Token mpart=1
Token array_split=[result]
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE cores=[1] begin name=write unroll=1 mpart=1 array_split=[result] ;

PreAnnotation: #pragma FCUDA COMPUTE cores=[1] begin name=write unroll=1 mpart=1 array_split=[result]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token cores=[1]
Token begin
Token name=write
Token unroll=1
Token mpart=1
Token array_split=[result]
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
attached=0

Parent: DeclarationStatement 

DeclarationStatement: #pragma FCUDA COMPUTE cores=[1] end name=write unroll=1 mpart=1 array_split=[result] ;

PreAnnotation: #pragma FCUDA COMPUTE cores=[1] end name=write unroll=1 mpart=1 array_split=[result]

Token #
Token pragma
Token FCUDA
Token COMPUTE
Token cores=[1]
Token end
Token name=write
Token unroll=1
Token mpart=1
Token array_split=[result]
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
attached=0

Parent: DeclarationStatement 

[AnnotParser] end in 0.03 seconds

*** Before Any Passes  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int bx = blockIdx.x;
int tx = threadIdx.x;
int small_block_cols = (256-((iteration*1)*2));
int blkX = ((small_block_cols*bx)-border);
int blkXmax = ((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
int validXmin;
int validXmax;
int i, computed;
if ((((blkX+((int)tx))>=0)&&((blkX+((int)tx))<=(cols-1))))
{
prev[tx]=gpuSrc[(blkX+tx)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx = (blkX+tx);
int isValid = ((((int)tx)>=validXmin)&&(((int)tx)<=validXmax));
int W = (tx-1);
int E = (tx+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)tx)>=(i+1))&&(((int)tx)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[tx];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[tx]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[tx]=result[tx];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed)
{
gpuResults[(blkX+tx)]=result[tx];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[LinkSymbol] 103 updates in 0.00 seconds
[AnnotParser] begin
[AnnotParser] end in 0.00 seconds

*** After AnnotationParser  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int bx = blockIdx.x;
int tx = threadIdx.x;
int small_block_cols = (256-((iteration*1)*2));
int blkX = ((small_block_cols*bx)-border);
int blkXmax = ((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
int validXmin;
int validXmax;
int i, computed;
if ((((blkX+((int)tx))>=0)&&((blkX+((int)tx))<=(cols-1))))
{
prev[tx]=gpuSrc[(blkX+tx)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx = (blkX+tx);
int isValid = ((((int)tx)>=validXmin)&&(((int)tx)<=validXmax));
int W = (tx-1);
int E = (tx+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)tx)>=(i+1))&&(((int)tx)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[tx];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[tx]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[tx]=result[tx];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed)
{
gpuResults[(blkX+tx)]=result[tx];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[SingleDeclarator] begin
[SingleDeclarator] end in 0.00 seconds
[LinkSymbol] 103 updates in 0.00 seconds

*** After SingleDeclarator  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int bx = blockIdx.x;
int tx = threadIdx.x;
int small_block_cols = (256-((iteration*1)*2));
int blkX = ((small_block_cols*bx)-border);
int blkXmax = ((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
int validXmin;
int validXmax;
int i;
int computed;
if ((((blkX+((int)tx))>=0)&&((blkX+((int)tx))<=(cols-1))))
{
prev[tx]=gpuSrc[(blkX+tx)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx = (blkX+tx);
int isValid = ((((int)tx)>=validXmin)&&(((int)tx)<=validXmax));
int W = (tx-1);
int E = (tx+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)tx)>=(i+1))&&(((int)tx)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[tx];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[tx]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[tx]=result[tx];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed)
{
gpuResults[(blkX+tx)]=result[tx];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================

*** After InlineDeviceFunctions  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int bx = blockIdx.x;
int tx = threadIdx.x;
int small_block_cols = (256-((iteration*1)*2));
int blkX = ((small_block_cols*bx)-border);
int blkXmax = ((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
int validXmin;
int validXmax;
int i;
int computed;
if ((((blkX+((int)tx))>=0)&&((blkX+((int)tx))<=(cols-1))))
{
prev[tx]=gpuSrc[(blkX+tx)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx = (blkX+tx);
int isValid = ((((int)tx)>=validXmin)&&(((int)tx)<=validXmax));
int W = (tx-1);
int E = (tx+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)tx)>=(i+1))&&(((int)tx)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[tx];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[tx]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[tx]=result[tx];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed)
{
gpuResults[(blkX+tx)]=result[tx];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[SeparateInitializers] begin
[SeparateInitializers] examining procedure dynproc_kernel
[SeparateInitializers] end in 0.01 seconds
[LinkSymbol] 103 updates in 0.00 seconds

*** After SeparateInitializers  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int bx;
bx=blockIdx.x;
int tx;
tx=threadIdx.x;
int small_block_cols;
small_block_cols=(256-((iteration*1)*2));
int blkX;
blkX=((small_block_cols*bx)-border);
int blkXmax;
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
int validXmin;
int validXmax;
int i;
int computed;
if ((((blkX+((int)tx))>=0)&&((blkX+((int)tx))<=(cols-1))))
{
prev[tx]=gpuSrc[(blkX+tx)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx;
xidx=(blkX+tx);
int isValid;
isValid=((((int)tx)>=validXmin)&&(((int)tx)<=validXmax));
int W;
W=(tx-1);
int E;
E=(tx+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)tx)>=(i+1))&&(((int)tx)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[tx];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[tx]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[tx]=result[tx];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed)
{
gpuResults[(blkX+tx)]=result[tx];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[AnsiDeclarations] begin
[AnsiDeclarations] end in 0.00 seconds
[LinkSymbol] 103 updates in 0.00 seconds

*** After AnsiDeclarations  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int bx;
int tx;
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
int i;
int computed;
bx=blockIdx.x;
tx=threadIdx.x;
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*bx)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
if ((((blkX+((int)tx))>=0)&&((blkX+((int)tx))<=(cols-1))))
{
prev[tx]=gpuSrc[(blkX+tx)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+tx);
isValid=((((int)tx)>=validXmin)&&(((int)tx)<=validXmax));
W=(tx-1);
E=(tx+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)tx)>=(i+1))&&(((int)tx)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[tx];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[tx]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[tx]=result[tx];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed)
{
gpuResults[(blkX+tx)]=result[tx];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[StreamInsertion-FCUDA] begin
[StreamInsertion-FCUDA] examining procedure dynproc_kernel
[StreamInsertion-FCUDA] end in 0.01 seconds
[LinkSymbol] 103 updates in 0.00 seconds

*** After StreamInsertion  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int bx;
int tx;
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
int i;
int computed;
bx=blockIdx.x;
tx=threadIdx.x;
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*bx)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
if ((((blkX+((int)tx))>=0)&&((blkX+((int)tx))<=(cols-1))))
{
prev[tx]=gpuSrc[(blkX+tx)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+tx);
isValid=((((int)tx)>=validXmin)&&(((int)tx)<=validXmax));
W=(tx-1);
E=(tx+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)tx)>=(i+1))&&(((int)tx)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[tx];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[tx]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[tx]=result[tx];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed)
{
gpuResults[(blkX+tx)]=result[tx];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[RemoveThrDepLoops-FCUDA] begin
[RemoveThrDepLoops-FCUDA] examining procedure dynproc_kernel
mVar2Var:
{E=[E, cols, blkX, threadIdx, blkXmax, border, validXmax, small_block_cols, blockIdx, iteration], result=[E, index, cols, shortest, xidx, small_block_cols, validXmin, i, up, iteration, startStep, W, blkX, threadIdx, left, border, blkXmax, right, validXmax, blockIdx], cols=[], shortest=[E, cols, shortest, small_block_cols, validXmin, up, iteration, W, blkX, threadIdx, left, border, blkXmax, right, validXmax, blockIdx], gpuWall=[], xidx=[blkX, threadIdx, border, small_block_cols, blockIdx, iteration], validXmin=[blkX, border, small_block_cols, blockIdx, iteration], iteration=[], gpuSrc=[], W=[W, blkX, threadIdx, border, small_block_cols, validXmin, blockIdx, iteration], threadIdx=[], computed=[], left=[W, blkX, threadIdx, border, small_block_cols, validXmin, blockIdx, iteration], border=[], blkXmax=[blkX, border, small_block_cols, blockIdx, iteration], right=[E, cols, blkX, threadIdx, blkXmax, border, validXmax, small_block_cols, blockIdx, iteration], gpuResults=[blkX, threadIdx, border, small_block_cols, blockIdx, iteration], index=[startStep, cols, blkX, threadIdx, xidx, border, small_block_cols, blockIdx, iteration, i], small_block_cols=[iteration], i=[i], prev=[blkX, threadIdx, border, small_block_cols, blockIdx, iteration], up=[threadIdx], startStep=[], blkX=[border, small_block_cols, blockIdx, iteration], isValid=[cols, blkX, threadIdx, border, blkXmax, validXmax, small_block_cols, validXmin, blockIdx, iteration], validXmax=[cols, blkX, border, blkXmax, small_block_cols, blockIdx, iteration], blockIdx=[]}
[RemoveThrDepLoops-FCUDA] end in 0.02 seconds
[LinkSymbol] 117 updates in 0.00 seconds

*** After RemoveThrDepLoops  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
int i;
int computed;
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed)
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[MakeArraysInCompute-FCUDA] begin
[MakeArraysInCompute-FCUDA] examining procedure dynproc_kernel
Statement: {
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
int i;
int computed;
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed)
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}
Statement: __shared__ int prev[256];
Statement: __shared__ int result[256];
Statement: int small_block_cols;
Statement: int blkX;
Statement: int blkXmax;
Statement: int validXmin;
Statement: int validXmax;
Statement: int i;
Statement: int computed;
Statement: small_block_cols=(256-((iteration*1)*2));
Statement: blkX=((small_block_cols*blockIdx.x)-border);
Statement: blkXmax=((blkX+256)-1);
Statement: #pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
Statement: if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
Inside compute: if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
Statement: #pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
Statement: __syncthreads();
Statement: validXmin=((blkX<0) ? ( - blkX) : 0);
Statement: validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
Statement: #pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
Statement: for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
Inside compute: for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
Statement: #pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
IDEXPR E
[MakeArrays]: E is scalar:true used:false
IDEXPR index
[MakeArrays]: index is scalar:true used:false
IDEXPR W
[MakeArrays]: W is scalar:true used:false
IDEXPR shortest
[MakeArrays]: shortest is scalar:true used:false
IDEXPR computed
Variable: computed used outside compute core: if (computed)
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
[MakeArrays]: computed is scalar:true used:true
IDEXPR xidx
[MakeArrays]: xidx is scalar:true used:false
IDEXPR left
[MakeArrays]: left is scalar:true used:false
IDEXPR right
[MakeArrays]: right is scalar:true used:false
IDEXPR isValid
[MakeArrays]: isValid is scalar:true used:false
IDEXPR up
[MakeArrays]: up is scalar:true used:false
IDEXPR i
[MakeArrays]: i is scalar:true used:false
Variable to convert: computed
Statement: #pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
Statement: if (computed)
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
Inside compute: if (computed)
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
Statement: #pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
Variable to convert: computed
Statement: {
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
Statement: i=0;
Statement: {
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed)
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
Statement: {
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
Statement: prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
Statement: int xidx;
Statement: int isValid;
Statement: int W;
Statement: int E;
Statement: xidx=(blkX+threadIdx.x);
Statement: isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
Statement: W=(threadIdx.x-1);
Statement: E=(threadIdx.x+1);
Statement: W=((W<validXmin) ? validXmin : W);
Statement: E=((E>validXmax) ? validXmax : E);
Statement: computed=0;
Statement: if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
Statement: __syncthreads();
Statement: if ((i==(iteration-1)))
{
break;
}
Statement: if (computed)
{
prev[threadIdx.x]=result[threadIdx.x];
}
Statement: __syncthreads();
Statement: gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
Statement: {
int left;
int up;
int right;
int shortest;
int index;
computed=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
Statement: {
break;
}
Statement: {
prev[threadIdx.x]=result[threadIdx.x];
}
Statement: int left;
Statement: int up;
Statement: int right;
Statement: int shortest;
Statement: int index;
Statement: computed=1;
Statement: left=prev[W];
Statement: up=prev[threadIdx.x];
Statement: right=prev[E];
Statement: shortest=((left<=up) ? left : up);
Statement: shortest=((shortest<=right) ? shortest : right);
Statement: index=((cols*(startStep+i))+xidx);
Statement: result[threadIdx.x]=(shortest+gpuWall[index]);
Statement: break;
Statement: prev[threadIdx.x]=result[threadIdx.x];
[MakeArraysInCompute-FCUDA] end in 0.02 seconds
[LinkSymbol] 117 updates in 0.00 seconds

*** After MakeArraysInCompute  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
int i;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[SplitFcudaTasks-FCUDA] begin
[SplitFcudaTasks-FCUDA] examining procedure dynproc_kernel
BRAM:prev  specs: [[256]] size:1
BRAM:result  specs: [[256]] size:1
BRAM:computed_block  specs: [[BLOCKDIM_X_dynproc_kernel]] size:1

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
Creating new FcudaCoreData for core: dynproc_kernel_fetch()

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
Creating new FcudaCoreData for core: dynproc_kernel_compute()

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
Creating new FcudaCoreData for core: dynproc_kernel_write()

 ... Preprocessing pragma: 
	#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
fcudaCores (splitTasks-start):
[dynproc_kernel_fetch(), dynproc_kernel_compute(), dynproc_kernel_write()]
coreNames: 
[dynproc_kernel_compute(), dynproc_kernel_fetch(), dynproc_kernel_write()]
Checking Annotation Statement: [#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true ]
FCUDA compute begin=true level=1
Task stmt: if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
of type: class cetus.hir.IfStatement
Task stmt: #pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false ]
FCUDA compute begin=false level=1
Task use set: [blkX, cols, gpuSrc[(blkX+threadIdx.x)], threadIdx.x]
Task def set: [prev[threadIdx.x]]
Task maydef set: []
tmpExpr: blkX
  of class: class cetus.hir.Identifier
decl: int blkX
defStmt: none
tmpExpr: cols
  of class: class cetus.hir.Identifier
decl: int cols
defStmt: none
tmpExpr: gpuSrc[(blkX+threadIdx.x)]
  of class: class cetus.hir.ArrayAccess
decl: int * gpuSrc
defStmt: none
tmpExpr: prev[threadIdx.x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int prev[256]
defStmt: none
tmpExpr: threadIdx.x
  of class: class cetus.hir.AccessExpression
WARNING: currently do not handle RHS elements of AccessExpression threadIdx.x in buildTaskVars()
taskArgs: [enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev]
taskDecls: [int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256]]
defStmts: []
Checking Annotation Statement: [#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true ]
FCUDA compute begin=true level=1
Task stmt: for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
of type: class cetus.hir.ForLoop
Task stmt: #pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false ]
FCUDA compute begin=false level=1
Task use set: [E, W, blkX, cols, computed_block[threadIdx.x], gpuWall[index], i, index, isValid, iteration, left, prev[E], prev[W], prev[threadIdx.x], result[threadIdx.x], right, shortest, startStep, threadIdx.x, up, validXmax, validXmin, xidx]
Task def set: [E, W, computed_block[threadIdx.x], i, index, isValid, left, prev[threadIdx.x], result[threadIdx.x], right, shortest, up, xidx]
Task maydef set: []
tmpExpr: E
  of class: class cetus.hir.Identifier
tmpExpr: W
  of class: class cetus.hir.Identifier
tmpExpr: blkX
  of class: class cetus.hir.Identifier
decl: int blkX
defStmt: none
tmpExpr: cols
  of class: class cetus.hir.Identifier
decl: int cols
defStmt: none
tmpExpr: computed_block[threadIdx.x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel]
defStmt: none
tmpExpr: gpuWall[index]
  of class: class cetus.hir.ArrayAccess
decl: int * gpuWall
defStmt: none
tmpExpr: i
  of class: class cetus.hir.Identifier
decl: int i
defStmt: none
tmpExpr: index
  of class: class cetus.hir.Identifier
tmpExpr: isValid
  of class: class cetus.hir.Identifier
tmpExpr: iteration
  of class: class cetus.hir.Identifier
decl: int iteration
defStmt: none
tmpExpr: left
  of class: class cetus.hir.Identifier
tmpExpr: prev[E]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int prev[256]
defStmt: none
tmpExpr: prev[W]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int prev[256]
defStmt: none
tmpExpr: prev[threadIdx.x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int prev[256]
defStmt: none
tmpExpr: result[threadIdx.x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int result[256]
defStmt: none
tmpExpr: right
  of class: class cetus.hir.Identifier
tmpExpr: shortest
  of class: class cetus.hir.Identifier
tmpExpr: startStep
  of class: class cetus.hir.Identifier
decl: int startStep
defStmt: none
tmpExpr: threadIdx.x
  of class: class cetus.hir.AccessExpression
WARNING: currently do not handle RHS elements of AccessExpression threadIdx.x in buildTaskVars()
tmpExpr: up
  of class: class cetus.hir.Identifier
tmpExpr: validXmax
  of class: class cetus.hir.Identifier
decl: int validXmax
defStmt: none
tmpExpr: validXmin
  of class: class cetus.hir.Identifier
decl: int validXmin
defStmt: none
tmpExpr: xidx
  of class: class cetus.hir.Identifier
taskArgs: [enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, i, iteration, prev, result, startStep, validXmax, validXmin]
taskDecls: [int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int i, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin]
defStmts: []
Checking Annotation Statement: [#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true ]
FCUDA compute begin=true level=1
Task stmt: if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
of type: class cetus.hir.IfStatement
Task stmt: #pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
of type: class cetus.hir.AnnotationStatement
Checking Annotation Statement: [#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false ]
FCUDA compute begin=false level=1
Task use set: [blkX, computed_block[threadIdx.x], result[threadIdx.x], threadIdx.x]
Task def set: [gpuResults[(blkX+threadIdx.x)]]
Task maydef set: []
tmpExpr: blkX
  of class: class cetus.hir.Identifier
decl: int blkX
defStmt: none
tmpExpr: computed_block[threadIdx.x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel]
defStmt: none
tmpExpr: gpuResults[(blkX+threadIdx.x)]
  of class: class cetus.hir.ArrayAccess
decl: int * gpuResults
defStmt: none
tmpExpr: result[threadIdx.x]
  of class: class cetus.hir.ArrayAccess
decl: __shared__ int result[256]
defStmt: none
tmpExpr: threadIdx.x
  of class: class cetus.hir.AccessExpression
WARNING: currently do not handle RHS elements of AccessExpression threadIdx.x in buildTaskVars()
taskArgs: [enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result]
taskDecls: [int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256]]
defStmts: []
[SplitFcudaTasks-FCUDA] end in 0.02 seconds
[LinkSymbol] 145 updates in 0.00 seconds

*** After SplitFcudaTasks  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int i, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
if (enableSignal_compute)
{
for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
int i;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, i, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[CleanKernelDecls-FCUDA] begin
[CleanKernelDecls-FCUDA] examining procedure dynproc_kernel
cur_level:0
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_write, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_compute, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, enableSignal_fetch, gridDim, gridDim.x, gridDim.y]
Defs+Uses:[iteration, small_block_cols]
Defs+Uses:[blkX, blockIdx, blockIdx.x, border, small_block_cols]
Defs+Uses:[blkX, blkXmax]
Defs+Uses:[]
Defs+Uses:[blkX, blockDim, blockIdx, cols, dynproc_kernel_fetch, enableSignal_fetch, gpuSrc, gridDim, prev]
Defs+Uses:[]
Defs+Uses:[__syncthreads]
Defs+Uses:[blkX, validXmin]
Defs+Uses:[blkXmax, cols, validXmax]
Defs+Uses:[]
Defs+Uses:[blkX, blockDim, blockIdx, cols, computed_block, dynproc_kernel_compute, enableSignal_compute, gpuWall, gridDim, i, iteration, prev, result, startStep, validXmax, validXmin]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[blkX, blockDim, blockIdx, computed_block, dynproc_kernel_write, enableSignal_write, gpuResults, gridDim, result]
Defs+Uses:[]
cur_level:0
var2freqMap{blkX=6, blkXmax=2, computed_block=2, enableSignal_compute=2, enableSignal_fetch=2, enableSignal_write=2, i=1, prev=2, result=2, small_block_cols=2, validXmax=2, validXmin=2}
funcCallParams[blkX, blockDim, blockIdx, cols, computed_block, enableSignal_compute, enableSignal_fetch, enableSignal_write, gpuResults, gpuSrc, gpuWall, gridDim, i, iteration, prev, result, startStep, validXmax, validXmin]
fcall:dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev)
fcall:__syncthreads()
fcall:dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, i, iteration, prev, result, startStep, validXmax, validXmin)
-arg:i contains i
- and are equal
- declList b4 = [int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int i, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin]
- declList after = [int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin]
[CleanKernelDecls-FCUDA] end in 0.01 seconds
[LinkSymbol] 144 updates in 0.00 seconds

*** After CleanKernelDecls  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
int i;
if (enableSignal_compute)
{
for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[SerializeThreads-MCUDA] begin
[SerializeThreads-MCUDA] examining procedure dynproc_kernel
[SerializeThreads-MCUDA] end in 0.00 seconds
[LinkSymbol] 144 updates in 0.00 seconds

*** After SerializeThreads  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
int i;
if (enableSignal_compute)
{
for (i=0; i<iteration; i ++ )
{
int xidx;
int isValid;
int W;
int E;
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
__syncthreads();
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
__syncthreads();
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[EnforceSyncs-MCUDA] begin
[EnforceSyncs-MCUDA] examining procedure dynproc_kernel
[EnforceSyncs-MCUDA] end in 0.00 seconds
[LinkSymbol] 144 updates in 0.00 seconds

*** After EnforceSyncs  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[PrivatizeScalarsInThreadLoops - FCUDA] begin
[PrivatizeScalarsInThreadLoops - FCUDA] examining procedure dynproc_kernel
THREADLOOP: {
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
THREADLOOP: {
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
THREADLOOP: {
i ++ ;
}
THREADLOOP: {
i=0;
}
THREADLOOP: {
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
DEFSET: [xidx, isValid, W, E, left, up, right, shortest, index]
Find UseSet of: {
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
USESET: [iteration, result[256], computed_block[BLOCKDIM_X_dynproc_kernel], <threadIdx.x>, i]
DEFSET WITHIN LOOP: []
REMAINSET: []
Find UseSet of: {
i ++ ;
}
USESET: [i]
DEFSET WITHIN LOOP: []
REMAINSET: []
Find UseSet of: {
i=0;
}
USESET: []
DEFSET WITHIN LOOP: []
REMAINSET: []
THREADLOOP: {
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
Scalars to be privatized: []
[PrivatizeScalarsInThreadLoops - FCUDA] end in 0.01 seconds
[LinkSymbol] 144 updates in 0.00 seconds

*** After PrivatizeScalarsInThreadLoop  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[UnrollThreadLoops-MCUDA] begin
[UnrollThreadLoops-MCUDA] examining procedure dynproc_kernel

[Unrolling] : dynproc_kernel_fetch
[Proc]: #pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}


[unrollFactor] 1

[Unrolling] : dynproc_kernel_compute
[Proc]: #pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}


[unrollFactor] 1

[Unrolling] : dynproc_kernel_write
[Proc]: #pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}


[unrollFactor] 1
mUnrolledIDs: 
{}
[UnrollThreadLoops-MCUDA] end in 0.00 seconds
[LinkSymbol] 144 updates in 0.00 seconds

*** After UnrollThreadLoops  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[PartitionArrays-MCUDA] begin
[PartitionArrays-MCUDA] examining procedure dynproc_kernel
[numDims]1
[Memory partition] : dynproc_kernel_fetch

[Proc]: #pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : dynproc_kernel_compute

[Proc]: #pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}


[mempartFactor]1
[numDims]1
[Memory partition] : dynproc_kernel_write

[Proc]: #pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}


[mempartFactor]1
[Memory partition] : dynproc_kernel

HAA 1 {
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}
[PartitionArrays-MCUDA] end in 0.00 seconds
[LinkSymbol] 144 updates in 0.00 seconds

*** After PartitionArrays  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[IfSplitPass-FCUDA] begin
[IfSplitPass-FCUDA] examining procedure dynproc_kernel
fcudaCores:
[dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev), dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin), dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result)]
coreNames: 
[dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev), dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result)]
Handling control flow for dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev)
mCurrEnableSignal: enableSignal_fetch
Handling control flow for dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin)
mCurrEnableSignal: enableSignal_compute
Handling control flow for dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result)
mCurrEnableSignal: enableSignal_write
[IfSplitPass-FCUDA] end in 0.00 seconds
[LinkSymbol] 144 updates in 0.00 seconds

*** After IfSplitPass  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
}



===========================================
[WrapBlockIdxLoop-FCUDA] begin
[WrapBlockIdxLoop-FCUDA] examining procedure dynproc_kernel
[WrapBlockIdxLoop-FCUDA] end in 0.00 seconds
[LinkSymbol] 144 updates in 0.00 seconds

*** After WrapBlockIdxLoop  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
__shared__ int prev[256];
__shared__ int result[256];
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
__shared__ int computed_block[BLOCKDIM_X_dynproc_kernel];
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
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
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
blockIdx.x=(blockIdx.x+num_cores);
}
}



===========================================
[PipelineFCUDACores-FCUDA] begin
[PipelineFCUDACores-FCUDA] examining procedure dynproc_kernel
Found only one Core in the Loop. Hence proceed to pipeline the next loop.
There is no WhileLoop which can be pipelined. Hence proceed to pipeline the BlockIDX loop.
Here is the set of functions for pipelining: 

dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev);
dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin);
dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result);
Before handleBRAMs coreNames: 
[dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev), dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result)]
 *** coreCall == origCall
 *** coreCall == origCall
 *** coreCall == origCall
 *** coreCall == origCall
 *** coreCall == origCall
 *** coreCall == origCall
After handleBRAMs coreNames: 
[dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin), dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_ping, gpuWall, iteration, prev_pong, result_ping, startStep, validXmax_pipe_1, validXmin_pipe_1), dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_pong, gpuWall, iteration, prev_ping, result_pong, startStep, validXmax_pipe_1, validXmin_pipe_1), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_ping), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_pong), dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result), dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_ping, gpuResults, result_ping), dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_pong, gpuResults, result_pong)]
After update coreNames: 
[dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_ping, gpuWall, iteration, prev_pong, result_ping, startStep, validXmax_pipe_1, validXmin_pipe_1), dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_pong, gpuWall, iteration, prev_ping, result_pong, startStep, validXmax_pipe_1, validXmin_pipe_1), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_ping), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_pong), dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_ping, gpuResults, result_ping), dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_pong, gpuResults, result_pong)]
Scalars to duplicate : 
{blkX=dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result), enableSignal_compute=dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin), enableSignal_write=dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result), validXmin=dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin), validXmax=dynproc_kernel_compute(enableSignal_compute, blockDim, gridDim, blockIdx, blkX, cols, computed_block, gpuWall, iteration, prev, result, startStep, validXmax, validXmin), blockIdx=dynproc_kernel_write(enableSignal_write, blockDim, gridDim, blockIdx, blkX, computed_block, gpuResults, result)}
cData getNumCores#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
int pingpong_0;
__shared__ int prev_ping[256];
__shared__ int computed_block_ping[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong[256];
__shared__ int result_ping[256];
__shared__ int computed_block_pong[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong[256];
int blkX_pipe_1;
int blkX_pipe_2;
int enableSignal_compute_pipe_1;
int enableSignal_write_pipe_1;
int enableSignal_write_pipe_2;
int validXmin_pipe_1;
int validXmax_pipe_1;
dim3 blockIdx_pipe_1;
dim3 blockIdx_pipe_2;
blockIdx.y=0;
blockIdx.x=core_id;
pingpong_0=0;
enableSignal_compute_pipe_1=0;
enableSignal_write_pipe_1=0;
enableSignal_write_pipe_2=0;
blockIdx_pipe_2.x=-1;
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
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_ping);
dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_ping, gpuWall, iteration, prev_pong, result_ping, startStep, validXmax_pipe_1, validXmin_pipe_1);
dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_pong, gpuResults, result_pong);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_pong);
dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_pong, gpuWall, iteration, prev_ping, result_pong, startStep, validXmax_pipe_1, validXmin_pipe_1);
dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_ping, gpuResults, result_ping);
pingpong_0=0;
}
}
blkX_pipe_2=blkX_pipe_1;
blkX_pipe_1=blkX;
enableSignal_compute_pipe_1=enableSignal_compute;
enableSignal_write_pipe_2=enableSignal_write_pipe_1;
enableSignal_write_pipe_1=enableSignal_write;
validXmin_pipe_1=validXmin;
validXmax_pipe_1=validXmax;
blockIdx_pipe_2=blockIdx_pipe_1;
blockIdx_pipe_1=blockIdx;
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
blockIdx.x=(blockIdx.x+num_cores);
}
}
1
[PipelineFCUDACores-FCUDA] end in 0.01 seconds
[LinkSymbol] 194 updates in 0.00 seconds

*** After PipelineFCUDACores  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
int pingpong_0;
__shared__ int prev_ping[256];
__shared__ int computed_block_ping[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong[256];
__shared__ int result_ping[256];
__shared__ int computed_block_pong[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong[256];
int blkX_pipe_1;
int blkX_pipe_2;
int enableSignal_compute_pipe_1;
int enableSignal_write_pipe_1;
int enableSignal_write_pipe_2;
int validXmin_pipe_1;
int validXmax_pipe_1;
dim3 blockIdx_pipe_1;
dim3 blockIdx_pipe_2;
blockIdx.y=0;
blockIdx.x=core_id;
pingpong_0=0;
enableSignal_compute_pipe_1=0;
enableSignal_write_pipe_1=0;
enableSignal_write_pipe_2=0;
blockIdx_pipe_2.x=-1;
while (1)
{
while (blockIdx.x>=gridDim.x)
{
blockIdx.x=(blockIdx.x-gridDim.x);
blockIdx.y=(blockIdx.y+1);
}
if ((blockIdx.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_ping);
dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_ping, gpuWall, iteration, prev_pong, result_ping, startStep, validXmax_pipe_1, validXmin_pipe_1);
dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_pong, gpuResults, result_pong);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_pong);
dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_pong, gpuWall, iteration, prev_ping, result_pong, startStep, validXmax_pipe_1, validXmin_pipe_1);
dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_ping, gpuResults, result_ping);
pingpong_0=0;
}
}
blkX_pipe_2=blkX_pipe_1;
blkX_pipe_1=blkX;
enableSignal_compute_pipe_1=enableSignal_compute;
enableSignal_write_pipe_2=enableSignal_write_pipe_1;
enableSignal_write_pipe_1=enableSignal_write;
validXmin_pipe_1=validXmin;
validXmax_pipe_1=validXmax;
blockIdx_pipe_2=blockIdx_pipe_1;
blockIdx_pipe_1=blockIdx;
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
blockIdx.x=(blockIdx.x+num_cores);
}
}



===========================================
[DuplicateForFCUDA-FCUDA] begin
[DuplicateForFCUDA-FCUDA] examining procedure dynproc_kernel
cData getNumCores#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols;
int blkX;
int blkXmax;
int validXmin;
int validXmax;
int enableSignal_fetch;
int enableSignal_compute;
int enableSignal_write;
dim3 blockIdx;
int pingpong_0;
__shared__ int prev_ping[256];
__shared__ int computed_block_ping[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong[256];
__shared__ int result_ping[256];
__shared__ int computed_block_pong[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong[256];
int blkX_pipe_1;
int blkX_pipe_2;
int enableSignal_compute_pipe_1;
int enableSignal_write_pipe_1;
int enableSignal_write_pipe_2;
int validXmin_pipe_1;
int validXmax_pipe_1;
dim3 blockIdx_pipe_1;
dim3 blockIdx_pipe_2;
blockIdx.y=0;
blockIdx.x=core_id;
pingpong_0=0;
enableSignal_compute_pipe_1=0;
enableSignal_write_pipe_1=0;
enableSignal_write_pipe_2=0;
blockIdx_pipe_2.x=-1;
while (1)
{
while (blockIdx.x>=gridDim.x)
{
blockIdx.x=(blockIdx.x-gridDim.x);
blockIdx.y=(blockIdx.y+1);
}
if ((blockIdx.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_compute=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
enableSignal_fetch=((blockIdx.x<gridDim.x)&&(blockIdx.y<gridDim.y));
small_block_cols=(256-((iteration*1)*2));
blkX=((small_block_cols*blockIdx.x)-border);
blkXmax=((blkX+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
__syncthreads();
validXmin=((blkX<0) ? ( - blkX) : 0);
validXmax=((blkXmax>(cols-1)) ? ((256-1)-((blkXmax-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=true cores=[1] unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=true unroll=1 begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_ping);
dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_ping, gpuWall, iteration, prev_pong, result_ping, startStep, validXmax_pipe_1, validXmin_pipe_1);
dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_pong, gpuResults, result_pong);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_pong);
dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_pong, gpuWall, iteration, prev_ping, result_pong, startStep, validXmax_pipe_1, validXmin_pipe_1);
dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_ping, gpuResults, result_ping);
pingpong_0=0;
}
}
blkX_pipe_2=blkX_pipe_1;
blkX_pipe_1=blkX;
enableSignal_compute_pipe_1=enableSignal_compute;
enableSignal_write_pipe_2=enableSignal_write_pipe_1;
enableSignal_write_pipe_1=enableSignal_write;
validXmin_pipe_1=validXmin;
validXmax_pipe_1=validXmax;
blockIdx_pipe_2=blockIdx_pipe_1;
blockIdx_pipe_1=blockIdx;
#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=true unroll=1 begin=false 
blockIdx.x=(blockIdx.x+num_cores);
}
}
1
numParallelThreadBlocks:1
dynproc_kernel is inStreamProc: false
fcudaCores:
[dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_ping), dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_ping, gpuWall, iteration, prev_pong, result_ping, startStep, validXmax_pipe_1, validXmin_pipe_1), dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_pong, gpuResults, result_pong), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_pong), dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_pong, gpuWall, iteration, prev_ping, result_pong, startStep, validXmax_pipe_1, validXmin_pipe_1), dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_ping, gpuResults, result_ping)]
coreNames: 
[dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_ping, gpuWall, iteration, prev_pong, result_ping, startStep, validXmax_pipe_1, validXmin_pipe_1), dynproc_kernel_compute(enableSignal_compute_pipe_1, blockDim, gridDim, blockIdx_pipe_1, blkX_pipe_1, cols, computed_block_pong, gpuWall, iteration, prev_ping, result_pong, startStep, validXmax_pipe_1, validXmin_pipe_1), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_ping), dynproc_kernel_fetch(enableSignal_fetch, blockDim, gridDim, blockIdx, blkX, cols, gpuSrc, prev_pong), dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_ping, gpuResults, result_ping), dynproc_kernel_write(enableSignal_write_pipe_2, blockDim, gridDim, blockIdx_pipe_2, blkX_pipe_2, computed_block_pong, gpuResults, result_pong)]
------------------------
mVarsToDuplicate: []
mId2sym: {blkX_block0=blkX_block0, blkX_pipe_1_block0=blkX_pipe_1_block0, blkX_pipe_2_block0=blkX_pipe_2_block0, blkXmax_block0=blkXmax_block0, blockIdx_block0=blockIdx_block0, blockIdx_pipe_1_block0=blockIdx_pipe_1_block0, blockIdx_pipe_2_block0=blockIdx_pipe_2_block0, computed_block_ping_block0=computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel], computed_block_pong_block0=computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel], enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_compute_pipe_1_block0=enableSignal_compute_pipe_1_block0, enableSignal_fetch_block0=enableSignal_fetch_block0, enableSignal_write_block0=enableSignal_write_block0, enableSignal_write_pipe_1_block0=enableSignal_write_pipe_1_block0, enableSignal_write_pipe_2_block0=enableSignal_write_pipe_2_block0, prev_ping_block0=prev_ping_block0[256], prev_pong_block0=prev_pong_block0[256], result_ping_block0=result_ping_block0[256], result_pong_block0=result_pong_block0[256], small_block_cols_block0=small_block_cols_block0, validXmax_block0=validXmax_block0, validXmax_pipe_1_block0=validXmax_pipe_1_block0, validXmin_block0=validXmin_block0, validXmin_pipe_1_block0=validXmin_pipe_1_block0}
mId2sym: {blkX_block0=blkX_block0, blkX_pipe_1_block0=blkX_pipe_1_block0, blkX_pipe_2_block0=blkX_pipe_2_block0, blkXmax_block0=blkXmax_block0, blockIdx_block0=blockIdx_block0, blockIdx_pipe_1_block0=blockIdx_pipe_1_block0, blockIdx_pipe_2_block0=blockIdx_pipe_2_block0, computed_block_ping_block0=computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel], computed_block_pong_block0=computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel], enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_compute_pipe_1_block0=enableSignal_compute_pipe_1_block0, enableSignal_fetch_block0=enableSignal_fetch_block0, enableSignal_write_block0=enableSignal_write_block0, enableSignal_write_pipe_1_block0=enableSignal_write_pipe_1_block0, enableSignal_write_pipe_2_block0=enableSignal_write_pipe_2_block0, prev_ping_block0=prev_ping_block0[256], prev_pong_block0=prev_pong_block0[256], result_ping_block0=result_ping_block0[256], result_pong_block0=result_pong_block0[256], small_block_cols_block0=small_block_cols_block0, validXmax_block0=validXmax_block0, validXmax_pipe_1_block0=validXmax_pipe_1_block0, validXmin_block0=validXmin_block0, validXmin_pipe_1_block0=validXmin_pipe_1_block0}
mId2sym: {blkX_block0=blkX_block0, blkX_pipe_1_block0=blkX_pipe_1_block0, blkX_pipe_2_block0=blkX_pipe_2_block0, blkXmax_block0=blkXmax_block0, blockIdx_block0=blockIdx_block0, blockIdx_pipe_1_block0=blockIdx_pipe_1_block0, blockIdx_pipe_2_block0=blockIdx_pipe_2_block0, computed_block_ping_block0=computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel], computed_block_pong_block0=computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel], enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_compute_pipe_1_block0=enableSignal_compute_pipe_1_block0, enableSignal_fetch_block0=enableSignal_fetch_block0, enableSignal_write_block0=enableSignal_write_block0, enableSignal_write_pipe_1_block0=enableSignal_write_pipe_1_block0, enableSignal_write_pipe_2_block0=enableSignal_write_pipe_2_block0, prev_ping_block0=prev_ping_block0[256], prev_pong_block0=prev_pong_block0[256], result_ping_block0=result_ping_block0[256], result_pong_block0=result_pong_block0[256], small_block_cols_block0=small_block_cols_block0, validXmax_block0=validXmax_block0, validXmax_pipe_1_block0=validXmax_pipe_1_block0, validXmin_block0=validXmin_block0, validXmin_pipe_1_block0=validXmin_pipe_1_block0}
mId2sym: {blkX_block0=blkX_block0, blkX_pipe_1_block0=blkX_pipe_1_block0, blkX_pipe_2_block0=blkX_pipe_2_block0, blkXmax_block0=blkXmax_block0, blockIdx_block0=blockIdx_block0, blockIdx_pipe_1_block0=blockIdx_pipe_1_block0, blockIdx_pipe_2_block0=blockIdx_pipe_2_block0, computed_block_ping_block0=computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel], computed_block_pong_block0=computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel], enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_compute_pipe_1_block0=enableSignal_compute_pipe_1_block0, enableSignal_fetch_block0=enableSignal_fetch_block0, enableSignal_write_block0=enableSignal_write_block0, enableSignal_write_pipe_1_block0=enableSignal_write_pipe_1_block0, enableSignal_write_pipe_2_block0=enableSignal_write_pipe_2_block0, prev_ping_block0=prev_ping_block0[256], prev_pong_block0=prev_pong_block0[256], result_ping_block0=result_ping_block0[256], result_pong_block0=result_pong_block0[256], small_block_cols_block0=small_block_cols_block0, validXmax_block0=validXmax_block0, validXmax_pipe_1_block0=validXmax_pipe_1_block0, validXmin_block0=validXmin_block0, validXmin_pipe_1_block0=validXmin_pipe_1_block0}
mId2sym: {blkX_block0=blkX_block0, blkX_pipe_1_block0=blkX_pipe_1_block0, blkX_pipe_2_block0=blkX_pipe_2_block0, blkXmax_block0=blkXmax_block0, blockIdx_block0=blockIdx_block0, blockIdx_pipe_1_block0=blockIdx_pipe_1_block0, blockIdx_pipe_2_block0=blockIdx_pipe_2_block0, computed_block_ping_block0=computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel], computed_block_pong_block0=computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel], enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_compute_pipe_1_block0=enableSignal_compute_pipe_1_block0, enableSignal_fetch_block0=enableSignal_fetch_block0, enableSignal_write_block0=enableSignal_write_block0, enableSignal_write_pipe_1_block0=enableSignal_write_pipe_1_block0, enableSignal_write_pipe_2_block0=enableSignal_write_pipe_2_block0, prev_ping_block0=prev_ping_block0[256], prev_pong_block0=prev_pong_block0[256], result_ping_block0=result_ping_block0[256], result_pong_block0=result_pong_block0[256], small_block_cols_block0=small_block_cols_block0, validXmax_block0=validXmax_block0, validXmax_pipe_1_block0=validXmax_pipe_1_block0, validXmin_block0=validXmin_block0, validXmin_pipe_1_block0=validXmin_pipe_1_block0}
mId2sym: {blkX_block0=blkX_block0, blkX_pipe_1_block0=blkX_pipe_1_block0, blkX_pipe_2_block0=blkX_pipe_2_block0, blkXmax_block0=blkXmax_block0, blockIdx_block0=blockIdx_block0, blockIdx_pipe_1_block0=blockIdx_pipe_1_block0, blockIdx_pipe_2_block0=blockIdx_pipe_2_block0, computed_block_ping_block0=computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel], computed_block_pong_block0=computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel], enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_compute_pipe_1_block0=enableSignal_compute_pipe_1_block0, enableSignal_fetch_block0=enableSignal_fetch_block0, enableSignal_write_block0=enableSignal_write_block0, enableSignal_write_pipe_1_block0=enableSignal_write_pipe_1_block0, enableSignal_write_pipe_2_block0=enableSignal_write_pipe_2_block0, prev_ping_block0=prev_ping_block0[256], prev_pong_block0=prev_pong_block0[256], result_ping_block0=result_ping_block0[256], result_pong_block0=result_pong_block0[256], small_block_cols_block0=small_block_cols_block0, validXmax_block0=validXmax_block0, validXmax_pipe_1_block0=validXmax_pipe_1_block0, validXmin_block0=validXmin_block0, validXmin_pipe_1_block0=validXmin_pipe_1_block0}
mId2sym: {blkX_block0=blkX_block0, blkX_pipe_1_block0=blkX_pipe_1_block0, blkX_pipe_2_block0=blkX_pipe_2_block0, blkXmax_block0=blkXmax_block0, blockIdx_block0=blockIdx_block0, blockIdx_pipe_1_block0=blockIdx_pipe_1_block0, blockIdx_pipe_2_block0=blockIdx_pipe_2_block0, computed_block_ping_block0=computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel], computed_block_pong_block0=computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel], enableSignal_compute_block0=enableSignal_compute_block0, enableSignal_compute_pipe_1_block0=enableSignal_compute_pipe_1_block0, enableSignal_fetch_block0=enableSignal_fetch_block0, enableSignal_write_block0=enableSignal_write_block0, enableSignal_write_pipe_1_block0=enableSignal_write_pipe_1_block0, enableSignal_write_pipe_2_block0=enableSignal_write_pipe_2_block0, prev_ping_block0=prev_ping_block0[256], prev_pong_block0=prev_pong_block0[256], result_ping_block0=result_ping_block0[256], result_pong_block0=result_pong_block0[256], small_block_cols_block0=small_block_cols_block0, validXmax_block0=validXmax_block0, validXmax_pipe_1_block0=validXmax_pipe_1_block0, validXmin_block0=validXmin_block0, validXmin_pipe_1_block0=validXmin_pipe_1_block0}
... handleCompoundStatement finished! 
[DuplicateForFCUDA-FCUDA] end in 0.01 seconds
[LinkSymbol] 216 updates in 0.00 seconds

*** After DuplicateForFCUDA  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i=0;
}
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
i ++ ;
}
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
__shared__ int prev_ping_block0[256];
__shared__ int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong_block0[256];
__shared__ int result_ping_block0[256];
__shared__ int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
__syncthreads();
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}



===========================================
[CleanThreadLoops-MCUDA] begin
[CleanThreadLoops-MCUDA] examining procedure dynproc_kernel
mVar2Var:
{result=[E, index, cols, shortest, xidx, validXmin, i, up, startStep, W, blkX, threadIdx, left, right, validXmax], E=[E, threadIdx, validXmax], cols=[], index=[startStep, cols, blkX, threadIdx, xidx, i], gpuWall=[], shortest=[E, W, shortest, threadIdx, left, right, validXmax, validXmin, up], xidx=[blkX, threadIdx], validXmin=[], prev=[threadIdx], up=[threadIdx], i=[i], iteration=[], W=[W, threadIdx, validXmin], startStep=[], blkX=[], blockDim=[], enableSignal_compute=[], threadIdx=[], computed_block=[threadIdx], left=[W, threadIdx, validXmin], validXmax=[], isValid=[threadIdx, validXmax, validXmin], right=[E, threadIdx, validXmax]}
mVar2Var:
{result=[E, index, cols, shortest, xidx, validXmin, i, up, startStep, W, blkX, threadIdx, left, right, validXmax], E=[E, threadIdx, validXmax], cols=[], index=[startStep, cols, blkX, threadIdx, xidx, i], gpuWall=[], shortest=[E, W, shortest, threadIdx, left, right, validXmax, validXmin, up], xidx=[blkX, threadIdx], validXmin=[], prev=[threadIdx], up=[threadIdx], i=[i], iteration=[], W=[W, threadIdx, validXmin], startStep=[], blkX=[], blockDim=[], enableSignal_compute=[], threadIdx=[], computed_block=[threadIdx], left=[W, threadIdx, validXmin], validXmax=[], isValid=[threadIdx, validXmax, validXmin], right=[E, threadIdx, validXmax]}
mVar2Var:
{result=[E, index, cols, shortest, xidx, validXmin, i, up, startStep, W, blkX, threadIdx, left, right, validXmax], E=[E, threadIdx, validXmax], cols=[], index=[startStep, cols, blkX, threadIdx, xidx, i], gpuWall=[], shortest=[E, W, shortest, threadIdx, left, right, validXmax, validXmin, up], xidx=[blkX, threadIdx], validXmin=[], prev=[threadIdx], up=[threadIdx], i=[i], iteration=[], W=[W, threadIdx, validXmin], startStep=[], blkX=[], blockDim=[], enableSignal_compute=[], threadIdx=[], computed_block=[threadIdx], left=[W, threadIdx, validXmin], validXmax=[], isValid=[threadIdx, validXmax, validXmin], right=[E, threadIdx, validXmax]}
mVar2Var:
{result=[E, index, cols, shortest, xidx, validXmin, i, up, startStep, W, blkX, threadIdx, left, right, validXmax], E=[E, threadIdx, validXmax], cols=[], index=[startStep, cols, blkX, threadIdx, xidx, i], gpuWall=[], shortest=[E, W, shortest, threadIdx, left, right, validXmax, validXmin, up], xidx=[blkX, threadIdx], validXmin=[], prev=[threadIdx], up=[threadIdx], i=[i], iteration=[], W=[W, threadIdx, validXmin], startStep=[], blkX=[], blockDim=[], enableSignal_compute=[], threadIdx=[], computed_block=[threadIdx], left=[W, threadIdx, validXmin], validXmax=[], isValid=[threadIdx, validXmax, validXmin], right=[E, threadIdx, validXmax]}
mVar2Var:
{result=[E, index, cols, shortest, xidx, validXmin, i, up, startStep, W, blkX, threadIdx, left, right, validXmax], E=[E, threadIdx, validXmax], cols=[], index=[startStep, cols, blkX, threadIdx, xidx, i], gpuWall=[], shortest=[E, W, shortest, threadIdx, left, right, validXmax, validXmin, up], xidx=[blkX, threadIdx], validXmin=[], prev=[threadIdx], up=[threadIdx], i=[i], iteration=[], W=[W, threadIdx, validXmin], startStep=[], blkX=[], blockDim=[], enableSignal_compute=[], threadIdx=[], computed_block=[threadIdx], left=[W, threadIdx, validXmin], validXmax=[], isValid=[threadIdx, validXmax, validXmin], right=[E, threadIdx, validXmax]}
mVar2Var:
{result=[E, index, cols, shortest, xidx, validXmin, i, up, startStep, W, blkX, threadIdx, left, right, validXmax], E=[E, threadIdx, validXmax], cols=[], index=[startStep, cols, blkX, threadIdx, xidx, i], gpuWall=[], shortest=[E, W, shortest, threadIdx, left, right, validXmax, validXmin, up], xidx=[blkX, threadIdx], validXmin=[], prev=[threadIdx], up=[threadIdx], i=[i], iteration=[], W=[W, threadIdx, validXmin], startStep=[], blkX=[], blockDim=[], enableSignal_compute=[], threadIdx=[], computed_block=[threadIdx], left=[W, threadIdx, validXmin], validXmax=[], isValid=[threadIdx, validXmax, validXmin], right=[E, threadIdx, validXmax]}
mVar2Var:
{result=[E, index, cols, shortest, xidx, validXmin, i, up, startStep, W, blkX, threadIdx, left, right, validXmax], E=[E, threadIdx, validXmax], cols=[], index=[startStep, cols, blkX, threadIdx, xidx, i], gpuWall=[], shortest=[E, W, shortest, threadIdx, left, right, validXmax, validXmin, up], xidx=[blkX, threadIdx], validXmin=[], prev=[threadIdx], up=[threadIdx], i=[i], iteration=[], W=[W, threadIdx, validXmin], startStep=[], blkX=[], blockDim=[], enableSignal_compute=[], threadIdx=[], computed_block=[threadIdx], left=[W, threadIdx, validXmin], validXmax=[], isValid=[threadIdx, validXmax, validXmin], right=[E, threadIdx, validXmax]}
mVar2Var:
{result=[E, index, cols, shortest, xidx, validXmin, i, up, startStep, W, blkX, threadIdx, left, right, validXmax], E=[E, threadIdx, validXmax], cols=[], index=[startStep, cols, blkX, threadIdx, xidx, i], gpuWall=[], shortest=[E, W, shortest, threadIdx, left, right, validXmax, validXmin, up], xidx=[blkX, threadIdx], validXmin=[], prev=[threadIdx], up=[threadIdx], i=[i], iteration=[], W=[W, threadIdx, validXmin], startStep=[], blkX=[], blockDim=[], enableSignal_compute=[], threadIdx=[], computed_block=[threadIdx], left=[W, threadIdx, validXmin], validXmax=[], isValid=[threadIdx, validXmax, validXmin], right=[E, threadIdx, validXmax]}
[CleanThreadLoops-MCUDA] end in 0.05 seconds
[LinkSymbol] 216 updates in 0.00 seconds

*** After CleanThreadLoops  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
i=0;
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
i ++ ;
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
__shared__ int prev_ping_block0[256];
__shared__ int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong_block0[256];
__shared__ int result_ping_block0[256];
__shared__ int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
__syncthreads();
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}



===========================================
[KernelStateTransform-MCUDA] begin
[KernelStateTransform-MCUDA] examining procedure dynproc_kernel
>>> outside uses:
[blkX_block0, blkX_pipe_1_block0, blkX_pipe_2_block0, blkXmax_block0, blockIdx_block0, blockIdx_block0.x, blockIdx_block0.y, blockIdx_pipe_1_block0, blockIdx_pipe_2_block0, border, cols, computed_block_ping_block0, computed_block_pong_block0, enableSignal_compute_block0, enableSignal_compute_pipe_1_block0, enableSignal_fetch_block0, enableSignal_write_block0, enableSignal_write_pipe_1_block0, enableSignal_write_pipe_2_block0, gpuResults, gpuSrc, gpuWall, gridDim.x, gridDim.y, iteration, pingpong_0, prev_ping_block0, prev_pong_block0, result_ping_block0, result_pong_block0, small_block_cols_block0, startStep, validXmax_block0, validXmax_pipe_1_block0, validXmin_block0, validXmin_pipe_1_block0]
>>> handling: blkX_block0
>>> handling: blkX_pipe_1_block0
>>> handling: blkX_pipe_2_block0
>>> handling: blkXmax_block0
>>> handling: blockIdx_block0
>>> handling: blockIdx_block0
>>> handling: blockIdx_block0
>>> handling: blockIdx_pipe_1_block0
>>> handling: blockIdx_pipe_2_block0
>>> handling: border
>>> handling: cols
>>> handling: computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel]
>>> handling: computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel]
>>> handling: enableSignal_compute_block0
>>> handling: enableSignal_compute_pipe_1_block0
>>> handling: enableSignal_fetch_block0
>>> handling: enableSignal_write_block0
>>> handling: enableSignal_write_pipe_1_block0
>>> handling: enableSignal_write_pipe_2_block0
>>> handling: * gpuResults
>>> handling: * gpuSrc
>>> handling: * gpuWall
>>> handling: gridDim
>>> handling: gridDim
>>> handling: iteration
>>> handling: pingpong_0
>>> handling: prev_ping_block0[256]
>>> handling: prev_pong_block0[256]
>>> handling: result_ping_block0[256]
>>> handling: result_pong_block0[256]
>>> handling: small_block_cols_block0
>>> handling: startStep
>>> handling: validXmax_block0
>>> handling: validXmax_pipe_1_block0
>>> handling: validXmin_block0
>>> handling: validXmin_pipe_1_block0
transforming Decls
[KernelStateTransform-MCUDA] end in 0.01 seconds
[LinkSymbol] 216 updates in 0.00 seconds

*** After KernelStateTransform  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
i=0;
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
__syncthreads();
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
__syncthreads();
i ++ ;
__syncthreads();
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
__shared__ int prev_ping_block0[256];
__shared__ int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong_block0[256];
__shared__ int result_ping_block0[256];
__shared__ int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
__syncthreads();
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}



===========================================
[CleanSyncFunc-MCUDA] begin
[CleanSyncFunc-MCUDA] examining procedure dynproc_kernel
[CleanSyncFunc-MCUDA] end in 0.00 seconds
[LinkSymbol] 213 updates in 0.00 seconds

*** After CleanSyncFunc  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
i=0;
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
i ++ ;
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuWall 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuSrc 
#pragma fcuda portmerge port_id=0 remove_port_name=gpuResults 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
__shared__ int prev_ping_block0[256];
__shared__ int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong_block0[256];
__shared__ int result_ping_block0[256];
__shared__ int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}



===========================================
[GenWrapperSingleKernel - FCUDA] begin
[GenWrapperSingleKernel - FCUDA] examining procedure dynproc_kernel
[GenWrapperSingleKernel - FCUDA] end in 0.00 seconds
[LinkSymbol] 213 updates in 0.00 seconds

*** After GenWrapperSingleKernel  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
i=0;
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
i ++ ;
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
__shared__ int prev_ping_block0[256];
__shared__ int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong_block0[256];
__shared__ int result_ping_block0[256];
__shared__ int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuWall_addr remove_port_name=gpuWall_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuSrc_addr remove_port_name=gpuSrc_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuResults_addr remove_port_name=gpuResults_core0 port_core=0 
__global__ void fcuda1(int iteration, int gpuWall_addr, int * gpuWall_core0, int gpuSrc_addr, int * gpuSrc_core0, int gpuResults_addr, int * gpuResults_core0, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim)
{
dynproc_kernel(iteration, gpuWall_core0, gpuSrc_core0, gpuResults_core0, cols, rows, startStep, border, gridDim, blockDim, 1, 0);
}



===========================================
[FixFCUDAMemParams-FCUDA] begin
[FixFCUDAMemParams-FCUDA] examining procedure dynproc_kernel
Proc: #pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
__shared__ int prev_ping_block0[256];
__shared__ int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong_block0[256];
__shared__ int result_ping_block0[256];
__shared__ int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

This proc does not contain remove ports pragmas. Skip.
[FixFCUDAMemParams-FCUDA] examining procedure fcuda1
Proc: #pragma fcuda portmerge data_pack=no port_id=0 offset=gpuWall_addr remove_port_name=gpuWall_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuSrc_addr remove_port_name=gpuSrc_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuResults_addr remove_port_name=gpuResults_core0 port_core=0 
__global__ void fcuda1(int iteration, int gpuWall_addr, int * gpuWall_core0, int gpuSrc_addr, int * gpuSrc_core0, int gpuResults_addr, int * gpuResults_core0, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim)
{
dynproc_kernel(iteration, gpuWall_core0, gpuSrc_core0, gpuResults_core0, cols, rows, startStep, border, gridDim, blockDim, 1, 0);
}

fcuda1(int iteration, int gpuWall_addr, int * gpuWall_core0, int gpuSrc_addr, int * gpuSrc_core0, int gpuResults_addr, int * gpuResults_core0, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim)
in getMatchingDecl
[int iteration, int gpuWall_addr, int * gpuWall_core0, int gpuSrc_addr, int * gpuSrc_core0, int gpuResults_addr, int * gpuResults_core0, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim]
[]
Removals: [gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: int iteration
[iteration]
iteration
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: int gpuWall_addr
[gpuWall_addr]
gpuWall_addr
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: int * gpuWall_core0
[gpuWall_core0]
gpuWall_core0
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
id: gpuWall_core0
child: int gpuSrc_addr
[gpuSrc_addr]
gpuSrc_addr
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: int * gpuSrc_core0
[gpuSrc_core0]
gpuSrc_core0
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
id: gpuSrc_core0
child: int gpuResults_addr
[gpuResults_addr]
gpuResults_addr
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: int * gpuResults_core0
[gpuResults_core0]
gpuResults_core0
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
id: gpuResults_core0
child: int cols
[cols]
cols
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: int rows
[rows]
rows
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: int startStep
[startStep]
startStep
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: int border
[border]
border
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: dim3 gridDim
[gridDim]
gridDim
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
child: dim3 blockDim
[blockDim]
blockDim
[gpuWall_core0, gpuSrc_core0, gpuResults_core0]
before exit
[int * gpuWall_core0, int * gpuSrc_core0, int * gpuResults_core0]
[int * gpuWall_core0, int * gpuSrc_core0, int * gpuResults_core0]
VariableDeclaration: [* ]
int * gpuSrc_core0
[int]
int * gpuResults_core0
[int]
[int]
int * memport_core0_p0
gpuWall_core0
gpuWall_core0 [#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuWall_addr remove_port_name=gpuWall_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=gpuSrc_addr remove_port_name=gpuSrc_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=gpuResults_addr remove_port_name=gpuResults_core0 port_core=0 ]
gpuSrc_core0
gpuSrc_core0 [#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuWall_addr remove_port_name=gpuWall_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=gpuSrc_addr remove_port_name=gpuSrc_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=gpuResults_addr remove_port_name=gpuResults_core0 port_core=0 ]
gpuResults_core0
gpuResults_core0 [#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuWall_addr remove_port_name=gpuWall_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=gpuSrc_addr remove_port_name=gpuSrc_core0 port_core=0 , #pragma fcuda portmerge data_pack=no port_id=0 offset=gpuResults_addr remove_port_name=gpuResults_core0 port_core=0 ]
Annot is: #pragma HLS interface ap_bus port=memport_core0_p0 
[FixFCUDAMemParams-FCUDA] end in 0.00 seconds
[LinkSymbol] 219 updates in 0.00 seconds

*** After FixFCUDAMemParams ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
i=0;
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
i ++ ;
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
__shared__ int prev_ping_block0[256];
__shared__ int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong_block0[256];
__shared__ int result_ping_block0[256];
__shared__ int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuWall_addr remove_port_name=gpuWall_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuSrc_addr remove_port_name=gpuSrc_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuResults_addr remove_port_name=gpuResults_core0 port_core=0 
__global__ void fcuda1(int iteration, int gpuWall_addr, int gpuSrc_addr, int gpuResults_addr, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
int * gpuSrc_core0;
int * gpuResults_core0;
int * gpuWall_core0;
gpuResults_core0=( & memport_core0_p0[gpuResults_addr]);
gpuSrc_core0=( & memport_core0_p0[gpuSrc_addr]);
gpuWall_core0=( & memport_core0_p0[gpuWall_addr]);
dynproc_kernel(iteration, gpuWall_core0, gpuSrc_core0, gpuResults_core0, cols, rows, startStep, border, gridDim, blockDim, 1, 0);
}



===========================================
[GenWrapperMultiKernels - FCUDA] begin
[GenWrapperMultiKernels - FCUDA] examining procedure dynproc_kernel
[GenWrapperMultiKernels - FCUDA] examining procedure fcuda1
[GenWrapperMultiKernels - FCUDA] end in 0.00 seconds
[LinkSymbol] 219 updates in 0.00 seconds

*** After GenWrapperMultiKernels  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
i=0;
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
i ++ ;
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
__shared__ int prev_ping_block0[256];
__shared__ int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong_block0[256];
__shared__ int result_ping_block0[256];
__shared__ int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuWall_addr remove_port_name=gpuWall_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuSrc_addr remove_port_name=gpuSrc_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuResults_addr remove_port_name=gpuResults_core0 port_core=0 
__global__ void fcuda1(int iteration, int gpuWall_addr, int gpuSrc_addr, int gpuResults_addr, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
int * gpuSrc_core0;
int * gpuResults_core0;
int * gpuWall_core0;
gpuResults_core0=( & memport_core0_p0[gpuResults_addr]);
gpuSrc_core0=( & memport_core0_p0[gpuSrc_addr]);
gpuWall_core0=( & memport_core0_p0[gpuWall_addr]);
dynproc_kernel(iteration, gpuWall_core0, gpuSrc_core0, gpuResults_core0, cols, rows, startStep, border, gridDim, blockDim, 1, 0);
}

__global__ void fcuda(int iteration, int gpuWall_addr, int gpuSrc_addr, int gpuResults_addr, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int * memport_core0_p0_int, int en_fcuda1)
{
if ((en_fcuda1==1))
{
fcuda1(iteration, gpuWall_addr, gpuSrc_addr, gpuResults_addr, cols, rows, startStep, border, gridDim, blockDim, memport_core0_p0_int);
}
}



===========================================
[AddHLSPragmas-FCUDA] begin
[AddHLSPragmas-FCUDA] examining procedure dynproc_kernel
[AddHLSPragmas-FCUDA] examining procedure fcuda1
[AddHLSPragmas-FCUDA] examining procedure fcuda
[AddHLSPragmas-FCUDA] end in 0.00 seconds
[LinkSymbol] 219 updates in 0.00 seconds

*** After AddHLSPragmas  ***
#include <fcuda.h>
#include <string.h>
#include "pathfinder.h"
const int BLOCKDIM_X_dynproc_kernel = 256;
#pragma fcuda compute array_split=[result] mpart=1 name=fetch end=false cores=[1] unroll=1 begin=true 
void dynproc_kernel_fetch(int enableSignal_fetch, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, int * gpuSrc, __shared__ int prev[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_fetch)
{
if ((((blkX+((int)threadIdx.x))>=0)&&((blkX+((int)threadIdx.x))<=(cols-1))))
{
prev[threadIdx.x]=gpuSrc[(blkX+threadIdx.x)];
}
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=compute cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_compute(int enableSignal_compute, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, int cols, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuWall, int iteration, __shared__ int prev[256], __shared__ int result[256], int startStep, int validXmax, int validXmin)
{
dim3 __shared__ threadIdx;
int i;
if (enableSignal_compute)
{
i=0;
while (i<iteration)
{
int xidx;
int isValid;
int W;
int E;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
xidx=(blkX+threadIdx.x);
isValid=((((int)threadIdx.x)>=validXmin)&&(((int)threadIdx.x)<=validXmax));
W=(threadIdx.x-1);
E=(threadIdx.x+1);
W=((W<validXmin) ? validXmin : W);
E=((E>validXmax) ? validXmax : E);
computed_block[threadIdx.x]=0;
if ((((((int)threadIdx.x)>=(i+1))&&(((int)threadIdx.x)<=((256-i)-2)))&&isValid))
{
int left;
int up;
int right;
int shortest;
int index;
computed_block[threadIdx.x]=1;
left=prev[W];
up=prev[threadIdx.x];
right=prev[E];
shortest=((left<=up) ? left : up);
shortest=((shortest<=right) ? shortest : right);
index=((cols*(startStep+i))+xidx);
result[threadIdx.x]=(shortest+gpuWall[index]);
}
}
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if ((i==(iteration-1)))
{
break;
}
if (computed_block[threadIdx.x])
{
prev[threadIdx.x]=result[threadIdx.x];
}
}
i ++ ;
}
}
}

#pragma fcuda compute array_split=[result] mpart=1 name=write cores=[1] end=false unroll=1 begin=true 
void dynproc_kernel_write(int enableSignal_write, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int blkX, __shared__ int computed_block[BLOCKDIM_X_dynproc_kernel], int * gpuResults, __shared__ int result[256])
{
dim3 __shared__ threadIdx;
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
if (enableSignal_write)
{
if (computed_block[threadIdx.x])
{
gpuResults[(blkX+threadIdx.x)]=result[threadIdx.x];
}
}
}
}

#pragma fcuda grid x_dim=256 
#pragma fcuda coreinfo num_cores=1 pipeline=yes 
__global__ void dynproc_kernel(int iteration, int * gpuWall, int * gpuSrc, int * gpuResults, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int num_cores, int core_id)
{
int small_block_cols_block0;
int blkX_block0;
int blkXmax_block0;
int validXmin_block0;
int validXmax_block0;
int enableSignal_fetch_block0;
int enableSignal_compute_block0;
int enableSignal_write_block0;
dim3 blockIdx_block0;
int pingpong_0;
__shared__ int prev_ping_block0[256];
__shared__ int computed_block_ping_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int prev_pong_block0[256];
__shared__ int result_ping_block0[256];
__shared__ int computed_block_pong_block0[BLOCKDIM_X_dynproc_kernel];
__shared__ int result_pong_block0[256];
int blkX_pipe_1_block0;
int blkX_pipe_2_block0;
int enableSignal_compute_pipe_1_block0;
int enableSignal_write_pipe_1_block0;
int enableSignal_write_pipe_2_block0;
int validXmin_pipe_1_block0;
int validXmax_pipe_1_block0;
dim3 blockIdx_pipe_1_block0;
dim3 blockIdx_pipe_2_block0;
blockIdx_block0.y=0;
blockIdx_block0.x=((core_id*1)+0);
pingpong_0=0;
enableSignal_compute_pipe_1_block0=0;
enableSignal_write_pipe_1_block0=0;
enableSignal_write_pipe_2_block0=0;
blockIdx_pipe_2_block0.x=-1;
while (1)
{
while (blockIdx_block0.x>=gridDim.x)
{
blockIdx_block0.x=(blockIdx_block0.x-gridDim.x);
blockIdx_block0.y=(blockIdx_block0.y+1);
}
if ((blockIdx_block0.y>=(gridDim.y+((2*num_cores)+core_id))))
{
break;
}
enableSignal_write_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_compute_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
enableSignal_fetch_block0=((blockIdx_block0.x<gridDim.x)&&(blockIdx_block0.y<gridDim.y));
small_block_cols_block0=(256-((iteration*1)*2));
blkX_block0=((small_block_cols_block0*blockIdx_block0.x)-border);
blkXmax_block0=((blkX_block0+256)-1);
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=false begin=true 
validXmin_block0=((blkX_block0<0) ? ( - blkX_block0) : 0);
validXmax_block0=((blkXmax_block0>(cols-1)) ? ((256-1)-((blkXmax_block0-cols)+1)) : (256-1));
#pragma fcuda compute array_split=[result] mpart=1 name=fetch unroll=1 cores=[1] end=true begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=false cores=[1] begin=true 
#pragma fcuda compute array_split=[result] mpart=1 name=compute unroll=1 end=true cores=[1] begin=false 
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=false cores=[1] begin=true 
{
if ((pingpong_0==0))
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_ping_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_ping_block0, gpuWall, iteration, prev_pong_block0, result_ping_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_pong_block0, gpuResults, result_pong_block0);
pingpong_0=1;
}
else
{
dynproc_kernel_fetch(enableSignal_fetch_block0, blockDim, gridDim, blockIdx_block0, blkX_block0, cols, gpuSrc, prev_pong_block0);
dynproc_kernel_compute(enableSignal_compute_pipe_1_block0, blockDim, gridDim, blockIdx_pipe_1_block0, blkX_pipe_1_block0, cols, computed_block_pong_block0, gpuWall, iteration, prev_ping_block0, result_pong_block0, startStep, validXmax_pipe_1_block0, validXmin_pipe_1_block0);
dynproc_kernel_write(enableSignal_write_pipe_2_block0, blockDim, gridDim, blockIdx_pipe_2_block0, blkX_pipe_2_block0, computed_block_ping_block0, gpuResults, result_ping_block0);
pingpong_0=0;
}
}
blkX_pipe_2_block0=blkX_pipe_1_block0;
blkX_pipe_1_block0=blkX_block0;
enableSignal_compute_pipe_1_block0=enableSignal_compute_block0;
enableSignal_write_pipe_2_block0=enableSignal_write_pipe_1_block0;
enableSignal_write_pipe_1_block0=enableSignal_write_block0;
validXmin_pipe_1_block0=validXmin_block0;
validXmax_pipe_1_block0=validXmax_block0;
blockIdx_pipe_2_block0=blockIdx_pipe_1_block0;
blockIdx_pipe_1_block0=blockIdx_block0;
#pragma fcuda compute array_split=[result] mpart=1 name=write unroll=1 end=true cores=[1] begin=false 
blockIdx_block0.x=(blockIdx_block0.x+(num_cores*1));
}
}

#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuWall_addr remove_port_name=gpuWall_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuSrc_addr remove_port_name=gpuSrc_core0 port_core=0 
#pragma fcuda portmerge data_pack=no port_id=0 offset=gpuResults_addr remove_port_name=gpuResults_core0 port_core=0 
__global__ void fcuda1(int iteration, int gpuWall_addr, int gpuSrc_addr, int gpuResults_addr, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int * memport_core0_p0)
{
#pragma HLS INTERFACE ap_none register port=iteration 
#pragma HLS RESOURCE core=AXI4LiteS variable=iteration 
#pragma HLS INTERFACE ap_none register port=gpuWall_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=gpuWall_addr 
#pragma HLS INTERFACE ap_none register port=gpuSrc_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=gpuSrc_addr 
#pragma HLS INTERFACE ap_none register port=gpuResults_addr 
#pragma HLS RESOURCE core=AXI4LiteS variable=gpuResults_addr 
#pragma HLS INTERFACE ap_none register port=cols 
#pragma HLS RESOURCE core=AXI4LiteS variable=cols 
#pragma HLS INTERFACE ap_none register port=rows 
#pragma HLS RESOURCE core=AXI4LiteS variable=rows 
#pragma HLS INTERFACE ap_none register port=startStep 
#pragma HLS RESOURCE core=AXI4LiteS variable=startStep 
#pragma HLS INTERFACE ap_none register port=border 
#pragma HLS RESOURCE core=AXI4LiteS variable=border 
#pragma HLS INTERFACE ap_none register port=gridDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=gridDim 
#pragma HLS INTERFACE ap_none register port=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=blockDim 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
#pragma HLS interface ap_bus port=memport_core0_p0 
#pragma HLS RESOURCE variable=memport_core0_p0 core=AXI4M 
int * gpuSrc_core0;
int * gpuResults_core0;
int * gpuWall_core0;
gpuResults_core0=( & memport_core0_p0[gpuResults_addr]);
gpuSrc_core0=( & memport_core0_p0[gpuSrc_addr]);
gpuWall_core0=( & memport_core0_p0[gpuWall_addr]);
dynproc_kernel(iteration, gpuWall_core0, gpuSrc_core0, gpuResults_core0, cols, rows, startStep, border, gridDim, blockDim, 1, 0);
}

__global__ void fcuda(int iteration, int gpuWall_addr, int gpuSrc_addr, int gpuResults_addr, int cols, int rows, int startStep, int border, dim3 gridDim, dim3 blockDim, int * memport_core0_p0_int, int en_fcuda1)
{
#pragma HLS INTERFACE ap_none register port=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=en_fcuda1 
#pragma HLS RESOURCE core=AXI4LiteS variable=return 
if ((en_fcuda1==1))
{
fcuda1(iteration, gpuWall_addr, gpuSrc_addr, gpuResults_addr, cols, rows, startStep, border, gridDim, blockDim, memport_core0_p0_int);
}
}



===========================================
