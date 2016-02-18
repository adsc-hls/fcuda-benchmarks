#include <fcuda.h>
/* this structure represents a point */
/* these will be passed around to avoid copying coordinates */
/*typedef struct {
  float weight;
  float *coord;
  long assign;  // number of point where this one is assigned
  float cost;  // cost of that assignment, weight*distance
  } Point;
 */
#include "define.h"
#include <string.h>
//=======================================
// Euclidean Distance
//=======================================

float d_dist(int p1, int p2, int num, int dim, float *coord_d)
{
  float retval = 0.0;
  int i;
  for (i = 0; i < dim; i++) {
    float tmp = coord_d[(i*num)+p1] - coord_d[(i*num)+p2];
    retval += tmp * tmp;
  }
  return retval;
}

//=======================================
// Kernel - Compute Cost
//=======================================
#pragma FCUDA GRID x_dim=512
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=weight port_id=0
#pragma FCUDA PORTMERGE remove_port_name=assign port_id=1
#pragma FCUDA PORTMERGE remove_port_name=cost port_id=0
#pragma FCUDA PORTMERGE remove_port_name=coord_d port_id=0
#pragma FCUDA PORTMERGE remove_port_name=work_mem_d port_id=0
#pragma FCUDA PORTMERGE remove_port_name=center_table_d port_id=2
#pragma FCUDA PORTMERGE remove_port_name=switch_membership_d port_id=3
__global__ void kernel_compute_cost(int num, int dim, long x,//Point p[4096],
    float *weight,
    long *assign,
    float *cost,
    int K, int stride,
    float *coord_d,
    float *work_mem_d,
    int *center_table_d,
    DATATYPE *switch_membership_d)
{
  // block ID and global thread ID
  const int bid  = blockIdx.x + gridDim.x * blockIdx.y;
  //const int tid = blockDim.x * bid + threadIdx.x;
  //__shared__ Point p_shared[512];
  __shared__ float weight_shared[512];
  __shared__ long assign_shared[512];
  __shared__ float cost_shared[512];
  //#pragma FCUDA COMPUTE cores=[1] begin name=fetch unroll=1 mpart=1 array_split=[p_shared]
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0|0|0] pointer=[weight|assign|cost] size=[512|512|512] begin name=fetch unroll=1 mpart=1 array_split=[weight_shared|assign_shared|cost_shared]

  weight_shared[threadIdx.x] = weight[blockDim.x * bid + threadIdx.x];
  assign_shared[threadIdx.x] = assign[blockDim.x * bid + threadIdx.x];
  cost_shared[threadIdx.x] = cost[blockDim.x * bid + threadIdx.x];
#pragma FCUDA TRANSFER cores=[1] type=burst dir=[0|0|0] pointer=[weight|assign|cost] size=[512|512|512] end name=fetch unroll=1 mpart=1 array_split=[weight_shared|assign_shared|cost_shared]

  //#pragma FCUDA COMPUTE cores=[1] end name=fetch unroll=1 mpart=1 array_split=[p_shared]

#pragma FCUDA COMPUTE cores=[1] begin name=compute unroll=1 mpart=1 array_split=[weight_shared|assign_shared|cost_shared]
  const int tid = blockDim.x * bid + threadIdx.x;
  if (tid < num) {
    //float *lower = &work_mem_d[tid*stride];
    // cost between this point and point[x]: euclidean distance multiplied by weight
    //float x_cost = d_dist(tid, x, num, dim, coord_d) * p_shared[threadIdx.x].weight;
    float x_cost = d_dist(tid, x, num, dim, coord_d) * weight_shared[threadIdx.x];
    // if computed cost is less then original (it saves), mark it as to reassign
    //if (x_cost < p_shared[threadIdx.x].cost) {
    if (x_cost < cost_shared[threadIdx.x]) {
      switch_membership_d[tid] = 1;
      //lower[K] += x_cost - p[tid].cost;
      work_mem_d[tid * stride + K] += x_cost - cost_shared[threadIdx.x];
    }
    // if computed cost is larger, save the difference
    else {
      //int temp = center_table_d[p[tid].assign];
      //lower[center_table_d[p[tid].assign]] += p[tid].cost - x_cost;
      work_mem_d[tid * stride + center_table_d[assign_shared[threadIdx.x]]] += cost_shared[threadIdx.x] - x_cost;
    }
  }
#pragma FCUDA COMPUTE cores=[1] end name=compute unroll=1 mpart=1 array_split=[weight_shared|assign_shared|cost_shared]

  }


