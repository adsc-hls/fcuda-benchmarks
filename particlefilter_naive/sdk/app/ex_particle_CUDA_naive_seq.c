/**
 * @file ex_particle_OPENMP_seq.c
 * @author Michael Trotter & Matt Goodrum
 * @brief Particle filter implementation in C/OpenMP 
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <math.h>
#include <unistd.h>
#include <fcntl.h>
#include <float.h>
#include <sys/time.h>
#include <time.h>
#include "device_func.h"

#include "platform.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "xfcuda.h"
#include "hardware_timer.h"
#include "gold_output_naive.h"
#define NUM_CORES 1
#define HW
#define VERIFY

#define PI acos(-1)
#define BLOCK_X 16
#define BLOCK_Y 16
#define EPSILON 0.001
/**
  @var M value for Linear Congruential Generator (LCG); use GCC's value
  */
long M = INT_MAX;
/**
  @var A value for LCG
  */
int A = 1103515245;
/**
  @var C value for LCG
  */
int C = 12345;

const int threads_per_block = 128;

/*****************************
 *GET_TIME
 *returns a long int representing the time
 *****************************/
/*
   long long get_time() {
   struct timeval tv;
   gettimeofday(&tv, NULL);
   return (tv.tv_sec * 1000000) + tv.tv_usec;
   }
   */
// Returns the number of seconds elapsed between the two specified times
/*
   float elapsed_time(long long start_time, long long end_time) {
   return (float) (end_time - start_time) / (1000 * 1000);
   }
   */
/*****************************
 * CHECK_ERROR
 * Checks for CUDA errors and prints them to the screen to help with
 * debugging of CUDA related programming
 *****************************/
/*void check_error(cudaError e) {
  if (e != cudaSuccess) {
  printf("\nCUDA error: %s\n", cudaGetErrorString(e));
  exit(1);
  }
  }*/
/*
   __device__ int findIndexSeq(double * CDF, int lengthCDF, double value)
   {
   int index = -1;
   int x;
   for(x = 0; x < lengthCDF; x++)
   {
   if(CDF[x] >= value)
   {
   index = x;
   break;
   }
   }
   if(index == -1)
   return lengthCDF-1;
   return index;
   }
   __device__ int findIndexBin(double * CDF, int beginIndex, int endIndex, double value)
   {
   if(endIndex < beginIndex)
   return -1;
   int middleIndex;
   while(endIndex > beginIndex)
   {
   middleIndex = beginIndex + ((endIndex-beginIndex)/2);
   if(CDF[middleIndex] >= value)
   {
   if(middleIndex == 0)
   return middleIndex;
   else if(CDF[middleIndex-1] < value)
   return middleIndex;
   else if(CDF[middleIndex-1] == value)
   {
   while(CDF[middleIndex] == value && middleIndex >= 0)
   middleIndex--;
   middleIndex++;
   return middleIndex;
   }
   }
   if(CDF[middleIndex] > value)
   endIndex = middleIndex-1;
   else
   beginIndex = middleIndex+1;
   }
   return -1;
   }
   */
/*****************************
 * CUDA Kernel Function to replace FindIndex
 * param1: arrayX
 * param2: arrayY
 * param3: CDF
 * param4: u
 * param5: xj
 * param6: yj
 * param7: Nparticles
 *****************************/
/*
   __global__ void kernel(double * arrayX, double * arrayY, double * CDF, double * u, double * xj, double * yj, int Nparticles){
   int block_id = blockIdx.x;// + gridDim.x * blockIdx.y;
   int i = blockDim.x * block_id + threadIdx.x;

   if(i < Nparticles){

   int index = -1;
   int x;

   for(x = 0; x < Nparticles; x++){
   if(CDF[x] >= u[i]){
   index = x;
   break;
   }
   }
   if(index == -1){
   index = Nparticles-1;
   }

   xj[i] = arrayX[index];
   yj[i] = arrayY[index];

   }
   }
   */
/** 
 * Takes in a double and returns an integer that approximates to that double
 * @return if the mantissa < .5 => return value < input value; else return value > input value
 */
double roundDouble(double value){
  int newValue = (int)(value);
  if(value - newValue < .5)
    return newValue;
  else
    return newValue++;
}
/**
 * Set values of the 3D array to a newValue if that value is equal to the testValue
 * @param testValue The value to be replaced
 * @param newValue The value to replace testValue with
 * @param array3D The image vector
 * @param dimX The x dimension of the frame
 * @param dimY The y dimension of the frame
 * @param dimZ The number of frames
 */
void setIf(int testValue, int newValue, int * array3D, int * dimX, int * dimY, int * dimZ){
  int x, y, z;
  for(x = 0; x < *dimX; x++){
    for(y = 0; y < *dimY; y++){
      for(z = 0; z < *dimZ; z++){
        if(array3D[x * *dimY * *dimZ+y * *dimZ + z] == testValue)
          array3D[x * *dimY * *dimZ + y * *dimZ + z] = newValue;
      }
    }
  }
}
/**
 * Generates a uniformly distributed random number using the provided seed and GCC's settings for the Linear Congruential Generator (LCG)
 * @see http://en.wikipedia.org/wiki/Linear_congruential_generator
 * @note This function is thread-safe
 * @param seed The seed array
 * @param index The specific index of the seed to be advanced
 * @return a uniformly distributed number [0, 1)
 */
double randu(int * seed, int index)
{
  int num = A*seed[index] + C;
  seed[index] = num % M;
  return fabs(seed[index]/((double) M));
}
/**
 * Generates a normally distributed random number using the Box-Muller transformation
 * @note This function is thread-safe
 * @param seed The seed array
 * @param index The specific index of the seed to be advanced
 * @return a double representing random number generated using the Box-Muller algorithm
 * @see http://en.wikipedia.org/wiki/Normal_distribution, section computing value for normal random distribution
 */
double randn(int * seed, int index){
  /*Box-Muller algorithm*/
  double u = randu(seed, index);
  double v = randu(seed, index);
  double cosine = cos(2*PI*v);
  double rt = -2*log(u);
  return sqrt(rt)*cosine;
}
/**
 * Sets values of 3D matrix using randomly generated numbers from a normal distribution
 * @param array3D The video to be modified
 * @param dimX The x dimension of the frame
 * @param dimY The y dimension of the frame
 * @param dimZ The number of frames
 * @param seed The seed array
 */
void addNoise(int * array3D, int * dimX, int * dimY, int * dimZ, int * seed){
  int x, y, z;
  for(x = 0; x < *dimX; x++){
    for(y = 0; y < *dimY; y++){
      for(z = 0; z < *dimZ; z++){
        array3D[x * *dimY * *dimZ + y * *dimZ + z] = array3D[x * *dimY * *dimZ + y * *dimZ + z] + (int)(5*randn(seed, 0));
      }
    }
  }
}
/**
 * Fills a radius x radius matrix representing the disk
 * @param disk The pointer to the disk to be made
 * @param radius  The radius of the disk to be made
 */
void strelDisk(int * disk, int radius)
{
  int diameter = radius*2 - 1;
  int x, y;
  for(x = 0; x < diameter; x++){
    for(y = 0; y < diameter; y++){
      double distance = sqrt(pow((double)(x-radius+1),2) + pow((double)(y-radius+1),2));
      if(distance < radius)
        disk[x*diameter + y] = 1;
    }
  }
}
/**
 * Dilates the provided video
 * @param matrix The video to be dilated
 * @param posX The x location of the pixel to be dilated
 * @param posY The y location of the pixel to be dilated
 * @param poxZ The z location of the pixel to be dilated
 * @param dimX The x dimension of the frame
 * @param dimY The y dimension of the frame
 * @param dimZ The number of frames
 * @param error The error radius
 */
void dilate_matrix(int * matrix, int posX, int posY, int posZ, int dimX, int dimY, int dimZ, int error)
{
  int startX = posX - error;
  while(startX < 0)
    startX++;
  int startY = posY - error;
  while(startY < 0)
    startY++;
  int endX = posX + error;
  while(endX > dimX)
    endX--;
  int endY = posY + error;
  while(endY > dimY)
    endY--;
  int x,y;
  for(x = startX; x < endX; x++){
    for(y = startY; y < endY; y++){
      double distance = sqrt( pow((double)(x-posX),2) + pow((double)(y-posY),2) );
      if(distance < error)
        matrix[x*dimY*dimZ + y*dimZ + posZ] = 1;
    }
  }
}

/**
 * Dilates the target matrix using the radius as a guide
 * @param matrix The reference matrix
 * @param dimX The x dimension of the video
 * @param dimY The y dimension of the video
 * @param dimZ The z dimension of the video
 * @param error The error radius to be dilated
 * @param newMatrix The target matrix
 */
void imdilate_disk(int * matrix, int dimX, int dimY, int dimZ, int error, int * newMatrix)
{
  int x, y, z;
  for(z = 0; z < dimZ; z++){
    for(x = 0; x < dimX; x++){
      for(y = 0; y < dimY; y++){
        if(matrix[x*dimY*dimZ + y*dimZ + z] == 1){
          dilate_matrix(newMatrix, x, y, z, dimX, dimY, dimZ, error);
        }
      }
    }
  }
}
/**
 * Fills a 2D array describing the offsets of the disk object
 * @param se The disk object
 * @param numOnes The number of ones in the disk
 * @param neighbors The array that will contain the offsets
 * @param radius The radius used for dilation
 */
void getneighbors(int * se, int numOnes, double * neighbors, int radius){
  int x, y;
  int neighY = 0;
  int center = radius - 1;
  int diameter = radius*2 -1;
  for(x = 0; x < diameter; x++){
    for(y = 0; y < diameter; y++){
      if(se[x*diameter + y]){
        neighbors[neighY*2] = (int)(y - center);
        neighbors[neighY*2 + 1] = (int)(x - center);
        neighY++;
      }
    }
  }
}
/**
 * The synthetic video sequence we will work with here is composed of a
 * single moving object, circular in shape (fixed radius)
 * The motion here is a linear motion
 * the foreground intensity and the backgrounf intensity is known
 * the image is corrupted with zero mean Gaussian noise
 * @param I The video itself
 * @param IszX The x dimension of the video
 * @param IszY The y dimension of the video
 * @param Nfr The number of frames of the video
 * @param seed The seed array used for number generation
 */
void videoSequence(int * I, int IszX, int IszY, int Nfr, int * seed){
  int k;
  int max_size = IszX*IszY*Nfr;
  /*get object centers*/
  int x0 = (int)roundDouble(IszY/2.0);
  int y0 = (int)roundDouble(IszX/2.0);
  I[x0 *IszY *Nfr + y0 * Nfr  + 0] = 1;

  /*move point*/
  int xk, yk, pos;
  for(k = 1; k < Nfr; k++){
    xk = abs(x0 + (k-1));
    yk = abs(y0 - 2*(k-1));
    pos = yk * IszY * Nfr + xk *Nfr + k;
    if(pos >= max_size)
      pos = 0;
    I[pos] = 1;
  }

  /*dilate matrix*/
  int * newMatrix = (int *)malloc(sizeof(int)*IszX*IszY*Nfr);
  memset(newMatrix, 0, sizeof(int) * max_size);
  imdilate_disk(I, IszX, IszY, Nfr, 5, newMatrix);
  int x, y;
  for(x = 0; x < IszX; x++){
    for(y = 0; y < IszY; y++){
      for(k = 0; k < Nfr; k++){
        I[x*IszY*Nfr + y*Nfr + k] = newMatrix[x*IszY*Nfr + y*Nfr + k];
      }
    }
  }
  free(newMatrix);

  /*define background, add noise*/
  setIf(0, 100, I, &IszX, &IszY, &Nfr);
  setIf(1, 228, I, &IszX, &IszY, &Nfr);
  /*add noise*/
  addNoise(I, &IszX, &IszY, &Nfr, seed);
}
/**
 * Determines the likelihood sum based on the formula: SUM( (IK[IND] - 100)^2 - (IK[IND] - 228)^2)/ 100
 * @param I The 3D matrix
 * @param ind The current ind array
 * @param numOnes The length of ind array
 * @return A double representing the sum
 */
double calcLikelihoodSum(int * I, int * ind, int numOnes){
  double likelihoodSum = 0.0;
  int y;
  for(y = 0; y < numOnes; y++)
    likelihoodSum += (pow((double)(I[ind[y]] - 100),2) - pow((double)(I[ind[y]]-228),2))/50.0;
  return likelihoodSum;
}
/**
 * Finds the first element in the CDF that is greater than or equal to the provided value and returns that index
 * @note This function uses sequential search
 * @param CDF The CDF
 * @param lengthCDF The length of CDF
 * @param value The value to be found
 * @return The index of value in the CDF; if value is never found, returns the last index
 */
int findIndex(double * CDF, int lengthCDF, double value){
  int index = -1;
  int x;
  for(x = 0; x < lengthCDF; x++){
    if(CDF[x] >= value){
      index = x;
      break;
    }
  }
  if(index == -1){
    return lengthCDF-1;
  }
  return index;
}
/**
 * The implementation of the particle filter using OpenMP for many frames
 * @see http://openmp.org/wp/
 * @note This function is designed to work with a video of several frames. In addition, it references a provided MATLAB function which takes the video, the objxy matrix and the x and y arrays as arguments and returns the likelihoods
 * @param I The video to be run
 * @param IszX The x dimension of the video
 * @param IszY The y dimension of the video
 * @param Nfr The number of frames
 * @param seed The seed array used for random number generation
 * @param Nparticles The number of particles to be used
 */
int particleFilter(int * I, int IszX, int IszY, int Nfr, int * seed, int Nparticles){

  int i, c;

#ifdef HW
  XFcuda xcore;
  int Status;


  Status = XFcuda_Initialize(&xcore, 0);
  if (Status != XST_SUCCESS) {
    printf("Initialization failed\n");
    return 1; // XST_FAILURE;
  }
#endif
  int max_size = IszX*IszY*Nfr;
  //long long start = get_time();
  //original particle centroid
  double xe = roundDouble(IszY/2.0);
  double ye = roundDouble(IszX/2.0);

  //expected object locations, compared to center
  int radius = 5;
  int diameter = radius*2 - 1;
  int * disk = (int *)malloc(diameter*diameter*sizeof(int));
  strelDisk(disk, radius);
  int countOnes = 0;
  int x, y;
  for(x = 0; x < diameter; x++){
    for(y = 0; y < diameter; y++){
      if(disk[x*diameter + y] == 1)
        countOnes++;
    }
  }
  double * objxy = (double *)malloc(countOnes*2*sizeof(double));
  getneighbors(disk, countOnes, objxy, radius);

  //long long get_neighbors = get_time();
  //printf("TIME TO GET NEIGHBORS TOOK: %f\n", elapsed_time(start, get_neighbors));
  //initial weights are all equal (1/Nparticles)
  double * weights = (double *)malloc(sizeof(double)*Nparticles);
  for(x = 0; x < Nparticles; x++){
    weights[x] = 1/((double)(Nparticles));
  }
  //long long get_weights = get_time();
  //printf("TIME TO GET WEIGHTSTOOK: %f\n", elapsed_time(get_neighbors, get_weights));
  //initial likelihood to 0.0
  //printf("%d\n", Nparticles);
  double * likelihood = (double *)malloc(sizeof(double)*Nparticles);
  double * arrayX = (double *)malloc(sizeof(double)*Nparticles);
  double * arrayY = (double *)malloc(sizeof(double)*Nparticles);
  double * xj = (double *)malloc(sizeof(double)*Nparticles);
  double * yj = (double *)malloc(sizeof(double)*Nparticles);
  double * CDF = (double *)malloc(sizeof(double)*Nparticles);

  //GPU copies of arrays
  //double * arrayX_GPU;
  //double * arrayY_GPU;
  //double * xj_GPU;
  //double * yj_GPU;
  //double * CDF_GPU;

  int * ind = (int*)malloc(sizeof(int)*countOnes);
  double * u = (double *)malloc(sizeof(double)*Nparticles);
  //double * u_GPU;

  //CUDA memory allocation
  //check_error(cudaMalloc((void **) &arrayX_GPU, sizeof(double)*Nparticles));
  //arrayX_GPU = (double*)malloc(sizeof(double)*Nparticles);
  //check_error(cudaMalloc((void **) &arrayY_GPU, sizeof(double)*Nparticles));
  //arrayY_GPU = (double*)malloc(sizeof(double)*Nparticles);
  //check_error(cudaMalloc((void **) &xj_GPU, sizeof(double)*Nparticles));
  //xj_GPU = (double*)malloc(sizeof(double)*Nparticles);
  //check_error(cudaMalloc((void **) &yj_GPU, sizeof(double)*Nparticles));
  //yj_GPU = (double*)malloc(sizeof(double)*Nparticles);
  //check_error(cudaMalloc((void **) &CDF_GPU, sizeof(double)*Nparticles));
  //CDF_GPU = (double*)malloc(sizeof(double)*Nparticles);
  //check_error(cudaMalloc((void **) &u_GPU, sizeof(double)*Nparticles));
  //u_GPU = (double*)malloc(sizeof(double)*Nparticles);
  for(x = 0; x < Nparticles; x++){
    arrayX[x] = xe;
    arrayY[x] = ye;
  }

  //Set number of threads
  int num_blocks = ceil((double) Nparticles/(double) threads_per_block);
  //printf("%d\n", num_blocks);
  dim3 grids, threads;
  grids.x = num_blocks;
  grids.y = 1;
  grids.z = 1;
  threads.x = threads_per_block;
  threads.y = 1;
  threads.z = 1;

#ifdef HW
  XFcuda_SetNparticles(&xcore, Nparticles);
  XFcuda_SetGriddim_x(&xcore, grids.x);
  XFcuda_SetGriddim_y(&xcore, grids.y);
  //XFcuda_SetGriddim_z(&xcore, grids.z);
  XFcuda_SetBlockdim_x(&xcore, threads.x);
  //XFcuda_SetBlockdim_y(&xcore, threads.y);
  //XFcuda_SetBlockdim_z(&xcore, threads.z);
  XFcuda_SetArrayx_addr(&xcore, (u32)arrayX / sizeof(double));
  XFcuda_SetArrayy_addr(&xcore, (u32)arrayY / sizeof(double));
  XFcuda_SetCdf_addr(&xcore, (u32)CDF / sizeof(double));
  XFcuda_SetU_addr(&xcore, (u32)u / sizeof(double));
  XFcuda_SetXj_addr(&xcore, (u32)xj / sizeof(double));
  XFcuda_SetYj_addr(&xcore, (u32)yj / sizeof(double));

#endif

  int k;
  //double * Ik = (double *)malloc(sizeof(double)*IszX*IszY);
  int indX, indY;
  double *result = (double *)malloc(3 * (Nfr - 1) * sizeof(double));
  i = 0;
  for(k = 1; k < Nfr; k++){
    //long long set_arrays = get_time();
    //printf("TIME TO SET ARRAYS TOOK: %f\n", elapsed_time(get_weights, set_arrays));
    //apply motion model
    //draws sample from motion model (random walk). The only prior information
    //is that the object moves 2x as fast as in the y direction

    for(x = 0; x < Nparticles; x++){
      arrayX[x] = arrayX[x] + 1.0 + 5.0*randn(seed, x);
      arrayY[x] = arrayY[x] - 2.0 + 2.0*randn(seed, x);
    }

    //particle filter likelihood
    //long long error = get_time();
    //printf("TIME TO SET ERROR TOOK: %f\n", elapsed_time(set_arrays, error));
    for(x = 0; x < Nparticles; x++){

      //compute the likelihood: remember our assumption is that you know
      // foreground and the background image intensity distribution.
      // Notice that we consider here a likelihood ratio, instead of
      // p(z|x). It is possible in this case. why? a hometask for you.		
      //calc ind
      for(y = 0; y < countOnes; y++){
        indX = roundDouble(arrayX[x]) + objxy[y*2 + 1];
        indY = roundDouble(arrayY[x]) + objxy[y*2];
        ind[y] = fabs(indX*IszY*Nfr + indY*Nfr + k);
        if(ind[y] >= max_size)
          ind[y] = 0;
      }
      likelihood[x] = calcLikelihoodSum(I, ind, countOnes);
      likelihood[x] = likelihood[x]/countOnes;
    }
    //long long likelihood_time = get_time();
    //printf("TIME TO GET LIKELIHOODS TOOK: %f\n", elapsed_time(error, likelihood_time));
    // update & normalize weights
    // using equation (63) of Arulampalam Tutorial		
    for(x = 0; x < Nparticles; x++){
      weights[x] = weights[x] * exp(likelihood[x]);
    }
    //long long exponential = get_time();
    //printf("TIME TO GET EXP TOOK: %f\n", elapsed_time(likelihood_time, exponential));
    double sumWeights = 0;	
    for(x = 0; x < Nparticles; x++){
      sumWeights += weights[x];
    }
    //long long sum_time = get_time();
    //printf("TIME TO SUM WEIGHTS TOOK: %f\n", elapsed_time(exponential, sum_time));
    for(x = 0; x < Nparticles; x++){
      weights[x] = weights[x]/sumWeights;
    }
    //long long normalize = get_time();
    //printf("TIME TO NORMALIZE WEIGHTS TOOK: %f\n", elapsed_time(sum_time, normalize));
    xe = 0;
    ye = 0;
    // estimate the object location by expected values
    for(x = 0; x < Nparticles; x++){
      //printf("%f %f %f\n", arrayX[x], arrayY[x], weights[x]);
      xe += arrayX[x] * weights[x];
      ye += arrayY[x] * weights[x];
    }
    //long long move_time = get_time();
    //printf("TIME TO MOVE OBJECT TOOK: %f\n", elapsed_time(normalize, move_time));
    //printf("XE: %lf\n", xe);
    //printf("YE: %lf\n", ye);
    double distance = sqrt( pow((double)(xe-(int)roundDouble(IszY/2.0)),2) + pow((double)(ye-(int)roundDouble(IszX/2.0)),2) );
    //printf("%lf\n", distance);
    result[i] = xe;
    result[i + 1] = ye;
    result[i + 2] = distance;
    i += 3;
    //display(hold off for now)

    //pause(hold off for now)

    //resampling


    CDF[0] = weights[0];
    for(x = 1; x < Nparticles; x++){
      CDF[x] = weights[x] + CDF[x-1];
    }
    //long long cum_sum = get_time();
    //printf("TIME TO CALC CUM SUM TOOK: %f\n", elapsed_time(move_time, cum_sum));
    double u1 = (1/((double)(Nparticles)))*randu(seed, 0);
    for(x = 0; x < Nparticles; x++){
      u[x] = u1 + x/((double)(Nparticles));
    }
    //long long u_time = get_time();
    //printf("TIME TO CALC U TOOK: %f\n", elapsed_time(cum_sum, u_time));
    //long long start_copy = get_time();
    //CUDA memory copying from CPU memory to GPU memory
    //cudaMemcpy(arrayX_GPU, arrayX, sizeof(double)*Nparticles, cudaMemcpyHostToDevice);
    //memcpy(arrayX_GPU, arrayX, sizeof(double)*Nparticles);
    //cudaMemcpy(arrayY_GPU, arrayY, sizeof(double)*Nparticles, cudaMemcpyHostToDevice);
    //memcpy(arrayY_GPU, arrayY, sizeof(double)*Nparticles);
    //cudaMemcpy(xj_GPU, xj, sizeof(double)*Nparticles, cudaMemcpyHostToDevice);
    //memcpy(xj_GPU, xj, sizeof(double)*Nparticles);
    //cudaMemcpy(yj_GPU, yj, sizeof(double)*Nparticles, cudaMemcpyHostToDevice);
    //memcpy(yj_GPU, yj, sizeof(double)*Nparticles);
    //cudaMemcpy(CDF_GPU, CDF, sizeof(double)*Nparticles, cudaMemcpyHostToDevice);
    //memcpy(CDF_GPU, CDF, sizeof(double)*Nparticles);
    //cudaMemcpy(u_GPU, u, sizeof(double)*Nparticles, cudaMemcpyHostToDevice);
    //memcpy(u_GPU, u, sizeof(double)*Nparticles);
    //long long end_copy = get_time();
    //Xil_DCacheDisable();

#ifdef HW
    Xil_DCacheDisable();
    XFcuda_SetEn_fcuda1(&xcore, 1);
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));
    Xil_DCacheEnable();
#else
    //KERNEL FUNCTION CALL
    int j;
    for(j = 0; j < Nparticles; j++){
      x = findIndex(CDF, Nparticles, u[j]);
      if(x == -1)
        x = Nparticles-1;
      xj[j] = arrayX[x];
      yj[j] = arrayY[x];

    }
#endif
    //cudaThreadSynchronize();
    //long long start_copy_back = get_time();
    //CUDA memory copying back from GPU to CPU memory
    //cudaMemcpy(yj, yj_GPU, sizeof(double)*Nparticles, cudaMemcpyDeviceToHost);
    //memcpy(yj, yj_GPU, sizeof(double)*Nparticles);
    //cudaMemcpy(xj, xj_GPU, sizeof(double)*Nparticles, cudaMemcpyDeviceToHost);
    //memcpy(xj, xj_GPU, sizeof(double)*Nparticles);
    //long long end_copy_back = get_time();
    //printf("SENDING TO GPU TOOK: %lf\n", elapsed_time(start_copy, end_copy));
    //printf("CUDA EXEC TOOK: %lf\n", elapsed_time(end_copy, start_copy_back));
    //printf("SENDING BACK FROM GPU TOOK: %lf\n", elapsed_time(start_copy_back, end_copy_back));
    //long long xyj_time = get_time();
    //printf("TIME TO CALC NEW ARRAY X AND Y TOOK: %f\n", elapsed_time(u_time, xyj_time));

    for(x = 0; x < Nparticles; x++){
      //reassign arrayX and arrayY
      arrayX[x] = xj[x];
      arrayY[x] = yj[x];
      weights[x] = 1/((double)(Nparticles));
    }
    //long long reset = get_time();
    //printf("TIME TO RESET WEIGHTS TOOK: %f\n", elapsed_time(xyj_time, reset));
  }

  //CUDA freeing of memory
  /*cudaFree(u_GPU);
    cudaFree(CDF_GPU);
    cudaFree(yj_GPU);
    cudaFree(xj_GPU);
    cudaFree(arrayY_GPU);
    cudaFree(arrayX_GPU);*/
  /*
     free(u_GPU);
     free(CDF_GPU);
     free(yj_GPU);
     free(xj_GPU);
     free(arrayY_GPU);
     free(arrayX_GPU);
     */
  //free memory
  free(disk);
  free(objxy);
  free(weights);
  free(likelihood);
  free(arrayX);
  free(arrayY);
  free(xj);
  free(yj);
  free(CDF);
  free(u);
  free(ind);

  /*
     FILE *fp = fopen("cuda/gold_output_naive.txt", "r");
     if (fp == NULL) {
     printf("Cannot open file.\n");
     free(result);
     return 0;
     }
     char buffer[50];
     double gold_val;
     for (i = 0; i < 3 * (Nfr - 1); i++) {
     if (feof(fp)) {
     printf("Unexpected end of file.\n");
     free(result);
     return 0;
     }
     fgets(buffer, sizeof(buffer), fp);
     sscanf(buffer, "%lf\n", &gold_val);
     if (gold_val - result[i] < -EPSILON ||
     gold_val - result[i] > EPSILON) {

     printf("Mismatch result at %i: gold = %f, result = %f\n",
     i, gold_val, result[i]);
     free(result);
     return 0;
     }
     }
     free(result);
     */

#ifdef VERIFY
  for (i = 0; i < 3 * (Nfr - 1); i++) {
    printf("index %d: %f\n", i, result[i]);
  }

  for (i = 0; i < 3 * (Nfr - 1); i++) {
    if (fabs(gold_output[i] - result[i]) > EPSILON) {
      printf("Mismatch result at %i: gold = %f, result = %f\n",
          i, gold_output[i], result[i]);
      free(result);
      return 0;
    }
  }
#endif
  free(result);
  return 1;
}

int main(int argc, char * argv[]){

  printf("Starting ...\n");
  init_timer(timer_ctrl, timer_counter_l, timer_counter_h);
  start_timer(timer_ctrl);

  int IszX, IszY, Nfr, Nparticles;
  /*
     char* usage = "naive.out -x <dimX> -y <dimY> -z <Nfr> -np <Nparticles>";
  //check number of arguments
  if(argc != 9)
  {
  printf("%s\n", usage);
  return 0;
  }
  //check args deliminators
  if( strcmp( argv[1], "-x" ) ||  strcmp( argv[3], "-y" ) || strcmp( argv[5], "-z" ) || strcmp( argv[7], "-np" ) ) {
  printf( "%s\n",usage );
  return 0;
  }

  //converting a string to a integer
  if( sscanf( argv[2], "%d", &IszX ) == EOF ) {
  printf("ERROR: dimX input is incorrect");
  return 0;
  }

  if( IszX <= 0 ) {
  printf("dimX must be > 0\n");
  return 0;
  }

  //converting a string to a integer
  if( sscanf( argv[4], "%d", &IszY ) == EOF ) {
  printf("ERROR: dimY input is incorrect");
  return 0;
  }

  if( IszY <= 0 ) {
  printf("dimY must be > 0\n");
  return 0;
  }

  //converting a string to a integer
  if( sscanf( argv[6], "%d", &Nfr ) == EOF ) {
  printf("ERROR: Number of frames input is incorrect");
  return 0;
  }

  if( Nfr <= 0 ) {
  printf("number of frames must be > 0\n");
  return 0;
  }

  //converting a string to a integer
  if( sscanf( argv[8], "%d", &Nparticles ) == EOF ) {
  printf("ERROR: Number of particles input is incorrect");
  return 0;
  }

  if( Nparticles <= 0 ) {
  printf("Number of particles must be > 0\n");
  return 0;
  }
  */
  IszX = 128;
  IszY = 128;
  Nfr = 10;
  Nparticles = 1700;
  //establish seed
  int * seed = (int *)malloc(sizeof(int)*Nparticles);
  int i;
  for(i = 0; i < Nparticles; i++)
    seed[i] = i;//time(0)*i;
  //malloc matrix
  int * I = (int *)malloc(sizeof(int)*IszX*IszY*Nfr);
  memset(I, 0, sizeof(int) * IszX * IszY * Nfr);

  //long long start = get_time();
  //call video sequence
  videoSequence(I, IszX, IszY, Nfr, seed);
  //long long endVideoSequence = get_time();
  //printf("VIDEO SEQUENCE TOOK %f\n", elapsed_time(start, endVideoSequence));
  //call particle filter
  int passed = particleFilter(I, IszX, IszY, Nfr, seed, Nparticles);
  //long long endParticleFilter = get_time();
  //printf("PARTICLE FILTER TOOK %f\n", elapsed_time(endVideoSequence, endParticleFilter));
  //printf("ENTIRE PROGRAM TOOK %f\n", elapsed_time(start, endParticleFilter));

  free(seed);
  free(I);

#ifdef VERIFY
  if (passed == 1) {
    printf("PASSED.\n");
  } else {
    printf("FAILED.\n");
  }
#endif

  stop_timer(timer_ctrl);
  printf("Execution time %lld us\n\r", elapsed_time());
}
