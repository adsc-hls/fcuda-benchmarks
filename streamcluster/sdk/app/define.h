#ifndef _DEFINE_H
#define _DEFINE_H
#include <fcuda.h>

typedef int DATATYPE;

typedef struct {
  float weight;
  float *coord;
  long long assign;  // number of point where this one is assigned
  float cost;  // cost of that assignment, weight*distance
} Point;

void kernel_compute_cost(int num, int dim, long long x, float * weight, long long * assign, float * cost, int K, int stride, float * coord_d, float * work_mem_d, int * center_table_d, DATATYPE * switch_membership_d, dim3 gridDim, dim3 blockDim, int num_cores, int core_id);

#endif


