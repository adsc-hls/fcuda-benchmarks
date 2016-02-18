/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/
#include <fcuda.h>
/* Size of a thread block */
#define BLOCKSIZEX 16
#define BLOCKSIZEY 16

/* Number of grid points processed by a thread */
#define UNROLLX 1

/* Number of atoms processed by a kernel */
#define MAXATOMS 128

/* Size of the benchmark problem.  The GPU can run larger problems in a
 * reasonable time.
 *
 * For VOLSIZEX, VOLSIZEY, size 1024 is suitable for a few seconds of
 * GPU computation and size 128 is suitable for a few seconds of
 * CPU computation.
 *
 * For ATOMCOUNT, 100000 is suitable for GPU computation and 10000 is
 * suitable for CPU computation.
 */
#define VOLSIZEX 128
#define VOLSIZEY 128
#define ATOMCOUNT 1024
typedef float DATATYPE;

#define CUERR { cudaError_t err; \
  if ((err = cudaGetLastError()) != cudaSuccess) { \
  printf("CUDA error: %s, line %d\n", cudaGetErrorString(err), __LINE__); \
  return -1; }}

//void cenergy(float *atominfo, float *energy_in, float *energy_out,
//		    dim3 gridDim, dim3 blockDim);

void cenergy_Stream(float *atominfo,
		    int numatoms,
		    float gridspacing,
		    float *energygrid,
		    dim3 gridDim, dim3 blockDim, int num_cores, int core_id);

int copyatomstoconstbuf(float *atoms,
			int count,
			float zplane, int offset);

void cpuenergy(dim3 grid,
               int numatoms,
               float gridspacing,
               int k,
               const float *atoms,
               float *energygrid);


