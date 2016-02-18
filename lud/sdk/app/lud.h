#ifndef _LUD_H_
#define _LUD_H_

#include <fcuda.h>
#include <string.h>
#define BLOCK_SIZE 16

void lud_diagonal(double *m, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, int num_cores, int core_id);
void lud_perimeter(double *m, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, int num_cores, int core_id);
void lud_internal(double *m, int matrix_dim, int offset, dim3 gridDim, dim3 blockDim, int num_cores, int core_id);

#endif
