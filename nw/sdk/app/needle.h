#ifndef _NW_H_
#define _NW_H_

#include <fcuda.h>
#define BLOCK_SIZE 16
//#define TRACE
//int maximum(int a, int b, int c);
static int maximum(int a, int b, int c) {
	int k;
	if( a <= b )
		k = b;
	else
		k = a;

	if (k <=c )
		return(c);
	else
		return(k);
}

void needle_cuda_shared_1(int * referrence, int * matrix_cuda,
			//int * matrix_cuda_out,
			int cols, int penalty, int i, int block_width,
			dim3 gridDim, dim3 blockDim,
			int num_cores, int core_id, int referrence_addr, int matrix_cuda_addr);

void needle_cuda_shared_2(int * referrence, int * matrix_cuda,
			//int * matrix_cuda_out,
			int cols, int penalty, int i, int block_width,
			dim3 gridDim, dim3 blockDim,
			int num_cores, int core_id, int referrence_addr, int matrix_cuda_addr);
#endif
