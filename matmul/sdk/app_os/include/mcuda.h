/*
 * (c) 2008 The Board of Trustees of the University of Illinois.
 */

#ifndef MCUDA_HEADER
#define MCUDA_HEADER

/*
 * Barriers
 */
#include <pthread.h>
#include <stdlib.h>
#include "cuda_include/builtin_types.h"
#include "mcutil.h"
#ifdef __FCUDA__
#include "fcuda.h"
#endif

#define MAX_TPB 512
#ifdef __cplusplus
extern "C" {
#endif

typedef struct{
   void* data;
   int width;
   int height;
}cpu_texture;

enum __work_assignment{
  STATIC,
  DYNAMIC
};

typedef void(*__cuda_kernel_function)(const void*, dim3, dim3, dim3);

#define MCUDA_PTHREADS
#ifdef MCUDA_PTHREADS
void __mcuda_pthread_pool(int num_threads);

void __mcuda_pthread_init(int num_threads, int assignment);

void __mcuda_pthread_destruct(void);

void* __thread_pool_loop(void* index);
#endif

//This function launches a kernel to be executed by a 
// pool of threads.  This function assumes ownership 
// of the provided parameter pointer.  
void 
__mcuda_kernel_launch(__cuda_kernel_function kernel_function, 
		     dim3 grid, dim3 block, void** params);
 
void
__mcuda_kernel_sync(void);

#ifdef __cplusplus
}
#endif

#endif
