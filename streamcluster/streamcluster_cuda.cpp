/***********************************************
  streamcluster_cuda.cu
  : parallelized code of streamcluster

  - original code from PARSEC Benchmark Suite
  - parallelization with CUDA API has been applied by

  Shawn Sang-Ha Lee - sl4ge@virginia.edu
  University of Virginia
  Department of Electrical and Computer Engineering
  Department of Computer Science

 ***********************************************/
#include <fcuda.h>
#include "streamcluster_header.cpp"
using namespace std;

// AUTO-ERROR CHECK FOR ALL CUDA FUNCTIONS
/*#define CUDA_SAFE_CALL( call) do {										\
  cudaError err = call;												\
  if( cudaSuccess != err) {											\
  fprintf(stderr, "Cuda error in file '%s' in line %i : %s.\n",	\
  __FILE__, __LINE__, cudaGetErrorString( err) );			\
  exit(EXIT_FAILURE);													\
  } } while (0)
  */
#define THREADS_PER_BLOCK 512
#define MAXBLOCKS 65536
#define CUDATIME
//#define TV_GEN

// host memory
float *work_mem_h;
float *coord_h;

// device memory
float *work_mem_d;
float *coord_d;
int   *center_table_d;
DATATYPE  *switch_membership_d;
Point *p;

static int iter = 0;		// counter for total# of iteration

/*
//=======================================
// Euclidean Distance
//=======================================
__device__ float
d_dist(int p1, int p2, int num, int dim, float *coord_d)
{
float retval = 0.0;
for(int i = 0; i < dim; i++){
float tmp = coord_d[(i*num)+p1] - coord_d[(i*num)+p2];
retval += tmp * tmp;
}
return retval;
}

//=======================================
// Kernel - Compute Cost
//=======================================
__global__ void
kernel_compute_cost(int num, int dim, long x, Point *p, int K, int stride,
float *coord_d, float *work_mem_d, int *center_table_d, DATATYPE *switch_membership_d)
{
// block ID and global thread ID
const int bid  = blockIdx.x + gridDim.x * blockIdx.y;
const int tid = blockDim.x * bid + threadIdx.x;

if(tid < num)
{
float *lower = &work_mem_d[tid*stride];

// cost between this point and point[x]: euclidean distance multiplied by weight
float x_cost = d_dist(tid, x, num, dim, coord_d) * p[tid].weight;

// if computed cost is less then original (it saves), mark it as to reassign
if ( x_cost < p[tid].cost )
{
switch_membership_d[tid] = 1;
lower[K] += x_cost - p[tid].cost;
}
// if computed cost is larger, save the difference
else
{
lower[center_table_d[p[tid].assign]] += p[tid].cost - x_cost;
}
}
}
*/
//=======================================
// Allocate Device Memory
//=======================================
void allocDevMem(int num, int dim)
{
  //CUDA_SAFE_CALL( cudaMalloc((void**) &center_table_d,	  num * sizeof(int))   );
  center_table_d = (int*)malloc(sizeof(int)*num);
  //CUDA_SAFE_CALL( cudaMalloc((void**) &switch_membership_d, num * sizeof(DATATYPE))  );
  switch_membership_d = (DATATYPE*)malloc(sizeof(DATATYPE)*num);
  //CUDA_SAFE_CALL( cudaMalloc((void**) &p, num * sizeof(Point)) );
  p = (Point*)malloc(sizeof(Point)*num);
  //CUDA_SAFE_CALL( cudaMalloc((void**) &coord_d, num * dim * sizeof(float)) );
  coord_d = (float*)malloc(sizeof(float)*num*dim);
}

//=======================================
// Allocate Host Memory
//=======================================
void allocHostMem(int num, int dim)
{
  coord_h	= (float*) malloc( num * dim * sizeof(float) );
}

//=======================================
// Free Device Memory
//=======================================
void freeDevMem()
{
  //CUDA_SAFE_CALL(cudaFree(center_table_d));
  free(center_table_d);
  //CUDA_SAFE_CALL(cudaFree(switch_membership_d));
  free(switch_membership_d);
  //CUDA_SAFE_CALL(cudaFree(p));
  free(p);
  //CUDA_SAFE_CALL(cudaFree(coord_d));
  free(coord_d);
}

//=======================================
// Free Host Memory
//=======================================
void freeHostMem()
{
  free(coord_h);
}

//=======================================
// pgain Entry - CUDA SETUP + CUDA CALL
//=======================================
float pgain( long x, Points *points, float z, long int *numcenters, int kmax, DATATYPE *is_center, int *center_table, DATATYPE *switch_membership, DATATYPE isCoordChanged,
    double *serial_t, double *cpu_to_gpu_t, double *gpu_to_cpu_t, double *alloc_t, double *kernel_t, double *free_t)
{
  static int executionTime = 0;

#ifdef CUDATIME
  float tmp_t;
  //cudaEvent_t start, stop;
  //cudaEventCreate(&start);
  //cudaEventCreate(&stop);

  //cudaEventRecord(start, 0);
#endif

  //cudaError_t error;

  int stride	= *numcenters + 1;	// size of each work_mem segment
  int K		= *numcenters ;		// number of centers
  int num		=  points->num;		// number of points
  int dim		=  points->dim;		// number of dimension
  int nThread =  num;			// number of threads == number of data points

  //=========================================
  // ALLOCATE HOST MEMORY + DATA PREPARATION
  //=========================================
  work_mem_h = (float*) malloc(stride * (nThread + 1) * sizeof(float) );
  // Only on the first iteration
  if(iter == 0)
  {
    allocHostMem(num, dim);
  }

  // build center-index table
  int count = 0;
  for( int i=0; i<num; i++)
  {
    if( is_center[i] )
    {
      center_table[i] = count++;
    }
  }

  // Extract 'coord'
  // Only if first iteration OR coord has changed
  if(isCoordChanged || iter == 0)
  {
    for(int i=0; i<dim; i++)
    {
      for(int j=0; j<num; j++)
      {
        coord_h[ (num*i)+j ] = points->p[j].coord[i];
      }
    }
  }

#ifdef CUDATIME
  //cudaEventRecord(stop,0);
  //cudaEventSynchronize(stop);
  //cudaEventElapsedTime(&tmp_t, start, stop);
  //*serial_t += (double) tmp_t;

  //cudaEventRecord(start,0);
#endif

  //=======================================
  // ALLOCATE GPU MEMORY
  //=======================================
  //CUDA_SAFE_CALL( cudaMalloc((void**) &work_mem_d,  stride * (nThread + 1) * sizeof(float)) );
  work_mem_d = (float*)malloc(stride * (nThread + 1) * sizeof(float));
  // Only on the first iteration
  if( iter == 0 )
  {
    allocDevMem(num, dim);
  }

#ifdef CUDATIME
  //cudaEventRecord(stop,0);
  //cudaEventSynchronize(stop);
  //cudaEventElapsedTime(&tmp_t, start, stop);
  //*alloc_t += (double) tmp_t;

  //cudaEventRecord(start,0);
#endif

  //=======================================
  // CPU-TO-GPU MEMORY COPY
  //=======================================
  // Only if first iteration OR coord has changed
  if(isCoordChanged || iter == 0)
  {
    //CUDA_SAFE_CALL( cudaMemcpy(coord_d,  coord_h,	 num * dim * sizeof(float), cudaMemcpyHostToDevice) );
    memcpy(coord_d, coord_h, num * dim * sizeof(float));
  }
  //CUDA_SAFE_CALL( cudaMemcpy(center_table_d,  center_table,  num * sizeof(int),   cudaMemcpyHostToDevice) );
  memcpy(center_table_d, center_table, num * sizeof(int));
  //CUDA_SAFE_CALL( cudaMemcpy(p,  points->p,				   num * sizeof(Point), cudaMemcpyHostToDevice) );
  memcpy(p, points->p, num * sizeof(Point));
  //CUDA_SAFE_CALL( cudaMemset((void*) switch_membership_d, 0,			num * sizeof(DATATYPE))  );
  memset(switch_membership_d, 0, num * sizeof(DATATYPE));
  //CUDA_SAFE_CALL( cudaMemset((void*) work_mem_d,  		0, stride * (nThread + 1) * sizeof(float)) );
  memset(work_mem_d, 0, stride * (nThread + 1) * sizeof(float));
  //printf("SIZE: %d %d %d %d %d %d\n", num, dim, num * dim,  stride, nThread, stride * (nThread + 1));
#ifdef CUDATIME
  //cudaEventRecord(stop,0);
  //cudaEventSynchronize(stop);
  //cudaEventElapsedTime(&tmp_t, start, stop);
  //*cpu_to_gpu_t += (double) tmp_t;

  //cudaEventRecord(start,0);
#endif
  float *weight_h = (float*)malloc(num * sizeof(float));
  long *assign_h = (long*)malloc(num * sizeof(long));
  float *cost_h = (float*)malloc(num * sizeof(float));
  int i;
  for (i = 0; i < num; i++) {
    weight_h[i] = p[i].weight;
    assign_h[i] = p[i].assign;
    cost_h[i] = p[i].cost;
  }
  //=======================================
  // KERNEL: CALCULATE COST
  //=======================================
  // Determine the number of thread blocks in the x- and y-dimension
  int num_blocks 	 = (int) ((float) (num + THREADS_PER_BLOCK - 1) / (float) THREADS_PER_BLOCK);
  int num_blocks_y = (int) ((float) (num_blocks + MAXBLOCKS - 1)  / (float) MAXBLOCKS);
  int num_blocks_x = (int) ((float) (num_blocks+num_blocks_y - 1) / (float) num_blocks_y);
  dim3 grid_size(num_blocks_x, num_blocks_y, 1);

#ifdef TV_GEN
  if (executionTime == 0) {
    FILE *weight_h_fp = fopen("tv/weight_h_in.txt", "w");
    FILE *assign_h_fp = fopen("tv/assign_h_in.txt", "w");
    FILE *cost_h_fp = fopen("tv/cost_h_in.txt", "w");
    FILE *coord_d_fp = fopen("tv/coord_d_in.txt", "w");
    FILE *work_mem_d_fp = fopen("tv/work_mem_d_in.txt", "w");
    FILE *center_table_d_fp = fopen("tv/center_table_d_in.txt", "w");
    FILE *switch_membership_d_fp = fopen("tv/switch_membership_d_in.txt", "w");

    for (i = 0; i < num; i++) {
      fprintf(weight_h_fp, "%f\n", weight_h[i]);
      fprintf(assign_h_fp, "%ld\n", assign_h[i]);
      fprintf(cost_h_fp, "%f\n", cost_h[i]);
      fprintf(center_table_d_fp, "%d\n", center_table_d[i]);
      fprintf(switch_membership_d_fp, "%d\n", switch_membership_d[i]);
    }

    for (i = 0; i < num * dim; i++)
      fprintf(coord_d_fp, "%f\n", coord_d[i]);

    for (i = 0; i < stride * (nThread + 1); i++)
      fprintf(work_mem_d_fp, "%f\n", work_mem_d[i]);

    fclose(weight_h_fp);
    fclose(assign_h_fp);
    fclose(cost_h_fp);
    fclose(coord_d_fp);
    fclose(work_mem_d_fp);	
    fclose(center_table_d_fp);
    fclose(switch_membership_d_fp);
  }
#endif
  kernel_compute_cost(	num,					// in:	# of data
      dim,					// in:	dimension of point coordinates
      x,					// in:	point to open a center at
      //p,					// in:	data point array
      weight_h,
      assign_h,
      cost_h,
      K,					// in:	number of centers
      stride,					// in:  size of each work_mem segment
      coord_d,				// in:	array of point coordinates
      work_mem_d,				// out:	cost and lower field array
      center_table_d,				// in:	center index table
      switch_membership_d,			// out:  changes in membership
      grid_size,
      THREADS_PER_BLOCK,
      1, 0
      );
#ifdef TV_GEN
  if (executionTime == 0) {
    FILE *switch_membership_d_out_fp = fopen("tv/switch_membership_d_out.txt", "w");
    FILE *work_mem_d_out_fp = fopen("tv/work_mem_d_out.txt", "w");

    for (i = 0; i < num; i++)
      fprintf(switch_membership_d_out_fp, "%d\n", switch_membership_d[i]);

    for (i = 0; i < stride * (nThread + 1); i++)
      fprintf(work_mem_d_out_fp, "%f\n", work_mem_d[i]);

    fclose(switch_membership_d_out_fp);
    fclose(work_mem_d_out_fp);
  }
#endif

  free(weight_h);
  free(assign_h);
  free(cost_h);
  //cudaThreadSynchronize();

  // error check
  /*error = cudaGetLastError();
    if (error != cudaSuccess)
    {
    printf("kernel error: %s\n", cudaGetErrorString(error));
    exit(EXIT_FAILURE);
    }*/

#ifdef CUDATIME
  //cudaEventRecord(stop,0);
  //cudaEventSynchronize(stop);
  //cudaEventElapsedTime(&tmp_t, start, stop);
  //*kernel_t += (double) tmp_t;

  //cudaEventRecord(start,0);
#endif

  //=======================================
  // GPU-TO-CPU MEMORY COPY
  //=======================================
  //CUDA_SAFE_CALL( cudaMemcpy(work_mem_h, 		  work_mem_d, 	stride * (nThread + 1) * sizeof(float), cudaMemcpyDeviceToHost) );
  memcpy(work_mem_h, work_mem_d, stride * (nThread + 1) * sizeof(float));
  //CUDA_SAFE_CALL( cudaMemcpy(switch_membership, switch_membership_d,	 num * sizeof(DATATYPE),  cudaMemcpyDeviceToHost) );
  memcpy(switch_membership, switch_membership_d, num * sizeof(DATATYPE));
#ifdef CUDATIME
  //cudaEventRecord(stop,0);
  //cudaEventSynchronize(stop);
  //cudaEventElapsedTime(&tmp_t, start, stop);
  //*gpu_to_cpu_t += (double) tmp_t;

  //cudaEventRecord(start,0);
#endif

  //=======================================
  // CPU (SERIAL) WORK
  //=======================================
  int number_of_centers_to_close = 0;
  float gl_cost_of_opening_x = z;
  float *gl_lower = &work_mem_h[stride * nThread];
  // compute the number of centers to close if we are to open i
  for(int i=0; i < num; i++)
  {
    if( is_center[i] )
    {
      float low = z;
      for( int j = 0; j < num; j++ )
      {
        low += work_mem_h[ j*stride + center_table[i] ];
      }

      gl_lower[center_table[i]] = low;

      if ( low > 0 )
      {
        ++number_of_centers_to_close;
        work_mem_h[i*stride+K] -= low;
      }
    }
    gl_cost_of_opening_x += work_mem_h[i*stride+K];
  }

  //if opening a center at x saves cost (i.e. cost is negative) do so; otherwise, do nothing
  if ( gl_cost_of_opening_x < 0 )
  {
    for(int i = 0; i < num; i++)
    {
      DATATYPE close_center = gl_lower[center_table[points->p[i].assign]] > 0 ;
      if ( switch_membership[i] || close_center )
      {
        points->p[i].cost = dist(points->p[i], points->p[x], dim) * points->p[i].weight;
        points->p[i].assign = x;
      }
    }

    for(int i = 0; i < num; i++)
    {
      if( is_center[i] && gl_lower[center_table[i]] > 0 )
      {
        is_center[i] = false;
      }
    }

    if( x >= 0 && x < num)
    {
      is_center[x] = true;
    }
    *numcenters = *numcenters + 1 - number_of_centers_to_close;
  }
  else
  {
    gl_cost_of_opening_x = 0;
  }

  //=======================================
  // DEALLOCATE HOST MEMORY
  //=======================================
  free(work_mem_h);


#ifdef CUDATIME
  //cudaEventRecord(stop,0);
  //cudaEventSynchronize(stop);
  //cudaEventElapsedTime(&tmp_t, start, stop);
  //*serial_t += (double) tmp_t;

  //cudaEventRecord(start,0);
#endif

  //=======================================
  // DEALLOCATE GPU MEMORY
  //=======================================
  //CUDA_SAFE_CALL( cudaFree(work_mem_d) );
  free(work_mem_d);

#ifdef CUDATIME
  //cudaEventRecord(stop,0);
  //cudaEventSynchronize(stop);
  //cudaEventElapsedTime(&tmp_t, start, stop);
  //*free_t += (double) tmp_t;
#endif
  iter++;

  executionTime++;
  return -gl_cost_of_opening_x;
}
