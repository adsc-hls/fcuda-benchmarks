/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/

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
#define ATOMCOUNT 128

#define CUERR { cudaError_t err; \
  if ((err = cudaGetLastError()) != cudaSuccess) { \
  printf("CUDA error: %s, line %d\n", cudaGetErrorString(err), __LINE__); \
  return -1; }}

__global__ void cenergy(int numatoms,
			float gridspacing,
			float * energygrid);

int copyatomstoconstbuf(float *atoms,
			int count,
			float zplane);
