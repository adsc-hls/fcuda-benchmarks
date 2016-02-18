#ifndef _DEFINE_H
#define _DEFINE_H
#include <fcuda.h>
typedef int DATATYPE;

typedef struct {
  float weight;
  float *coord;
  long assign;  // number of point where this one is assigned
  float cost;  // cost of that assignment, weight*distance
} Point;

void kernel_compute_cost(int num, int dim, long x, //Point *p,
    float *weight,
    long *assign,
    float *cost,
    int K, int stride,
    float coord_d[524288], float work_mem_d[57358], int center_table_d[4096],
    DATATYPE switch_membership_d[4096], dim3 dimGrid, dim3 dimBlock,
    int num_cores, int core_id);

#endif


