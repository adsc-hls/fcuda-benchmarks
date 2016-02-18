/************************************************
  streamcluster_cuda_header.cu
  : header file to streamcluster

  - original code from PARSEC Benchmark Suite
  - parallelization with CUDA API has been applied by

  Sang-Ha (a.k.a Shawn) Lee - sl4ge@virginia.edu
  University of Virginia
  Department of Electrical and Computer Engineering
  Department of Computer Science

 ***********************************************/
#ifndef STREAMCLUSTER_CUDA_HEADER_CU
#define STREAMCLUSTER_CUDA_HEADER_CU

#include <stdio.h>
#include <iostream>
#include <fstream>
#include <stdlib.h>
//#include <sys/time.h>
#include <string.h>
#include <assert.h>
#include <math.h>
#include <sys/resource.h>
#include <limits.h>
#include "define.h"
//#include <cuda.h>

#ifdef ENABLE_PARSEC_HOOKS
#include <hooks.h>
#endif
//#include "kernel_fcuda.c"
using namespace std;

/* this structure represents a point */
/* these will be passed around to avoid copying coordinates */
/*typedef struct {
  float weight;
  float *coord;
  int assign;  //number of point where this one is assigned
  float cost;  // cost of that assignment, weight*distance
  } Point;
  */
/* this is the array of points */
typedef struct {
  int num; /* number of points; may not be N if this is a sample */
  int dim;  /* dimensionality */
  Point *p; /* the array itself */
} Points;

struct pkmedian_arg_t
{
  Points* points;
  int kmin;
  int kmax;
  int* kfinal;
  int pid;
  //pthread_barrier_t* barrier;
};

class PStream {
  public:
    virtual size_t read( float* dest, int dim, int num ) = 0;
    virtual int ferror() = 0;
    virtual int feof() = 0;
    virtual ~PStream() {
    }
};

//synthetic stream
class SimStream : public PStream {
  public:
    SimStream(int n_ ) {
      n = n_;
    }
    size_t read( float* dest, int dim, int num ) {
      size_t count = 0;
      for( int i = 0; i < num && n > 0; i++ ) {
        for( int k = 0; k < dim; k++ ) {
          dest[i*dim + k] = lrand48()/(float)INT_MAX;
        }
        n--;
        count++;
      }
      return count;
    }
    int ferror() {
      return 0;
    }
    int feof() {
      return n <= 0;
    }
    ~SimStream() {
    }
  private:
    int n;
};

class FileStream : public PStream {
  public:
    FileStream(char* filename) {
      fp = fopen( filename, "rb");
      if( fp == NULL ) {
        fprintf(stderr,"error opening file %s\n.",filename);
        exit(1);
      }
    }
    size_t read( float* dest, int dim, int num ) {
      return std::fread(dest, sizeof(float)*dim, num, fp);
    }
    int ferror() {
      return std::ferror(fp);
    }
    int feof() {
      return std::feof(fp);
    }
    ~FileStream() {
      printf("closing file stream\n");
      fclose(fp);
    }
  private:
    FILE* fp;
};

/* function prototypes */
//double gettime();
int isIdentical(float*, float*, int);
//static int floatcomp(const void*, const void*);
void shuffle(Points*);
void intshuffle(int*, int);
float waste(float);
float dist(Point, Point, int);
//float pspeedy(Points*, float, int, int, pthread_barrier_t*);
//float pgain_old(int, Points*, float, int int*, int, pthread_barrier_t*);
//float pFL(Points*, int*, int, float, int*, float, int, float, int, pthread_barrier_t*);
//int selectfeasible_fast(Points*, int**, int, int, pthread_barrier_t*);
//float pkmedian(Points*, int, int, int*, int, pthread_barrier_t*);
float pspeedy(Points*, float, int, int);
float pgain_old(int, Points*, float, int*, int);
float pFL(Points*, int*, int, float, int*, float, int, float, int);
int selectfeasible_fast(Points*, int**, int, int);
float pkmedian(Points*, int, int, int*, int);
int contcenters(Points*);
void copycenters(Points*, Points*, int*, int);
void* localSearchSub(void*);
void localSearch(Points*, int, int, int*);
void outcenterIDs(Points*, int*, char*);
void streamCluster(PStream*, int, int, int, int, int, char*);
float pgain(int, Points*, float, int*, int, int*, int*, int*, int, double*, double*, double*, double*, double*, double*);
void allocDevMem(int, int, int);
void allocHostMem(int, int, int);
void freeDevMem();
void freeHostMem();

#endif
