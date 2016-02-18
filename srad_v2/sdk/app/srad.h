#ifndef _SRAD_V2_H_
#define _SRAD_V2_H_

#include <fcuda.h>
#define STR_SIZE 256
#define NUM_THREAD 16
#define BLOCK_SIZE 16

#define TIMER
//#define OUTPUT
void srad_cuda_1(double *E_C,
	double *W_C,
	double *N_C,
	double *S_C,
	double * J_cuda,
	double * C_cuda,
	int cols,
	int rows,
	double q0sqr,
	dim3 gridDim, dim3 blockDim,
	int num_cores, int core_id,
	int E_C_addr, int W_C_addr, int N_C_addr, int S_C_addr,
	int J_cuda_addr, int C_cuda_addr);

void srad_cuda_2(double *E_C,
        double *W_C,
        double *N_C,
        double *S_C,
        double * J_cuda,
        double * C_cuda,
        int cols,
        int rows,
        double lambda,
        double q0sqr,
	dim3 gridDim, dim3 blockDim,
	int num_cores, int core_id,
	int E_C_addr, int W_C_addr, int N_C_addr, int S_C_addr,
	int J_cuda_addr, int C_cuda_addr);
#endif
