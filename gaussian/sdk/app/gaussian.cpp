/*-----------------------------------------------------------
 ** gaussian.cu -- The program is to solve a linear system Ax = b
 **   by using Gaussian Elimination. The algorithm on page 101
 **   ("Foundations of Parallel Programming") is used.  
 **   The sequential version is gaussian.c.  This parallel 
 **   implementation converts three independent for() loops 
 **   into three Fans.  Use the data file ge_3.dat to verify 
 **   the correction of the output. 
 **
 ** Written by Andreas Kura, 02/15/95
 ** Modified by Chong-wei Xu, 04/20/95
 ** Modified by Chris Gregg for CUDA, 07/20/2009
 **-----------------------------------------------------------
 */
#include <stdio.h>
#include <stdlib.h>
//#include <sys/time.h>
//#include "cuda.h"
#include <fcuda.h>
#include <string.h>
#include <math.h>
//#include <fcuda_generated_kernel.c>
#define MAXBLOCKSIZE 256

#include "xil_cache.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "hardware_timer.h"
#include "xfcuda.h"
#define HW
#define VERBOSE 0
#define VERIFY

//#define CDMA

#ifdef CDMA
#include "xaxicdma.h"
#define DMA_CTRL_DEVICE_ID 	XPAR_AXICDMA_0_DEVICE_ID
#endif

int Size;
//float *a, *b, *finalVec;
//float *m;

FILE *fp;

void InitProblemOnce(char *filename, float *a, float *b, float *m);
void InitPerRun(float*);
int ForwardSub(float *m, float *a, float *b);
void ForwardSub_Serial(float *m, float *a, float *b);
void BackSub(float*, float*, float*);
void Fan1(float *m, float *a, int Size, int t, dim3 dimGrid, dim3 dimBlock, int, int);
void Fan2(float *m, float *a, float *b,int Size, int j1, int t, dim3 dimGrid, dim3 dimBlock, int, int);
void InitMat(float *ary, int nrow, int ncol);
void InitAry(float *ary, int ary_size);
void PrintMat(float *ary, int nrow, int ncolumn);
void PrintAry(float *ary, int ary_size);
void PrintDeviceProperties();
void checkCUDAError(const char *msg);
int main1();

unsigned int totalKernelTime = 0;

long long int kernel1_time = 0;
long long int kernel2_time = 0;

// create both matrix and right hand side, Ke Wang 2013/08/12 11:51:06
void
create_matrix(float *m, int size){
  int i,j;
  float lamda = -0.01;
  float coe[2*size-1];
  float coe_i =0.0;

  for (i=0; i < size; i++)
  {
    coe_i = 10*exp(lamda*i); 
    j=size-1+i;     
    coe[j]=coe_i;
    j=size-1-i;     
    coe[j]=coe_i;
  }


  for (i=0; i < size; i++) {
    for (j=0; j < size; j++) {
      m[i*size+j]=coe[size-1-i+j];
    }
  }


}


#define EPSILON 0.01f
int check_tolerance(float a, float b)
{
  if (a - b < -EPSILON || a - b > EPSILON) {
    printf("%f vs %f\n", a, b);
    return 0;
  } else
    return 1;
}

int main(int argc, char** argv)
{
  printf("Starting ...\n");
  init_timer(timer_ctrl, timer_counter_l, timer_counter_h);
  start_timer(timer_ctrl);
  main1();
  stop_timer(timer_ctrl);
  printf("Execution time (Warm-up): %lld us\n", elapsed_time());
}

int main1()
{
  int verbose = 0;
  int i, j;
  char flag;

  /*
     if (argc < 2) {
     printf("Usage: gaussian -f filename / -s size [-q]\n\n");
     printf("-q (quiet) suppresses printing the matrix and result values.\n");
     printf("-f (filename) path of input file\n");
     printf("-s (size) size of matrix. Create matrix and rhs in this program \n");
     printf("The first line of the file contains the dimension of the matrix, n.");
     printf("The second line of the file is a newline.\n");
     printf("The next n lines contain n tab separated values for the matrix.");
     printf("The next line of the file is a newline.\n");
     printf("The next line of the file is a 1xn vector with tab separated values.\n");
     printf("The next line of the file is a newline. (optional)\n");
     printf("The final line of the file is the pre-computed solution. (optional)\n");
     printf("Example: matrix4.txt:\n");
     printf("4\n");
     printf("\n");
     printf("-0.6	-0.5	0.7	0.3\n");
     printf("-0.3	-0.9	0.3	0.7\n");
     printf("-0.4	-0.5	-0.3	-0.8\n");	
     printf("0.0	-0.1	0.2	0.9\n");
     printf("\n");
     printf("-0.85	-0.68	0.24	-0.53\n");	
     printf("\n");
     printf("0.7	0.0	-0.4	-0.5\n");
     exit(0);
     }
     */
  //PrintDeviceProperties();
  //char filename[100];
  //sprintf(filename,"matrices/matrix%d.txt",size);

  /*
     for(i=1;i<argc;i++) {
     if (argv[i][0]=='-') {// flag
     flag = argv[i][1];
     switch (flag) {
     case 's': // platform
     i++;
     Size = atoi(argv[i]);
     printf("Create matrix internally in parse, size = %d \n", Size);

     a = (float *) malloc(Size * Size * sizeof(float));
     create_matrix(a, Size);

     b = (float *) malloc(Size * sizeof(float));
     for (j =0; j< Size; j++)
     b[j]=1.0;

     m = (float *) malloc(Size * Size * sizeof(float));
     break;
     case 'f': // platform
     i++;
  //printf("Read file from %s \n", argv[i]);
  InitProblemOnce(argv[i]);
  break;
  case 'q': // quiet
  verbose = 0;
  break;
  }
  }
  }
  */
  Size = 256;
  float *a = (float *) malloc(Size * Size * sizeof(float));
  if (a == NULL) {
    printf("Unable to allocate memory for a\n");
    exit(1);
  }
  create_matrix(a, Size);

  float *b = (float *) malloc(Size * sizeof(float));
  if (b == NULL) {
    printf("Unable to allocate memory for b\n");
    exit(1);
  }
  for (j =0; j< Size; j++)
    b[j]=1.0;

  float *m = (float *) malloc(Size * Size * sizeof(float));
  if (m == NULL) {
    printf("Unable to allocate memory for m\n");
    exit(1);
  }

  float *finalVec = (float *) malloc(Size * sizeof(float));
  if (finalVec == NULL) {
    printf("Unable to allocate memory for finalVec\n");
    exit(1);
  }

  //InitProblemOnce(filename);
  InitPerRun(m);
  //begin timing
  //struct timeval time_start;
  //gettimeofday(&time_start, NULL);

#ifdef VERIFY
  float *a_ref = (float *) malloc(Size * Size * sizeof(float));
  if (a_ref == NULL) {
    printf("Unable to allocate memory for a_ref\n");
    exit(1);
  }
  float *b_ref = (float *) malloc(Size * sizeof(float));
  if (b_ref == NULL) {
    printf("Unable to allocate memory for b_ref\n");
    exit(1);
  }
  float *m_ref = (float *) malloc(Size * Size * sizeof(float));
  if (m_ref == NULL) {
    printf("Unable to allocate memory for m_ref\n");
    exit(1);
  }
  float *finalVec_ref = (float *) malloc(Size * sizeof(float));
  if (finalVec_ref == NULL) {
    printf("Unable to allocate memory for finalVec_ref\n");
    exit(1);
  }


  memcpy(a_ref, a, Size * Size * sizeof(float));
  memcpy(b_ref, b, Size * sizeof(float));
  memcpy(m_ref, m, Size * Size * sizeof(float));
#endif
  // run kernels
  ForwardSub(m, a, b);

  //end timing
  //struct timeval time_end;
  //gettimeofday(&time_end, NULL);
  //unsigned int time_total = (time_end.tv_sec * 1000000 + time_end.tv_usec) - (time_start.tv_sec * 1000000 + time_start.tv_usec);

  if (verbose) {
    printf("Matrix m is: \n");
    PrintMat(m, Size, Size);

    printf("Matrix a is: \n");
    PrintMat(a, Size, Size);

    printf("Array b is: \n");
    PrintAry(b, Size);

  }
  BackSub(finalVec, a, b);

  verbose = VERBOSE;
  if (verbose) {
    printf("The final solution is: \n");
    PrintAry(finalVec,Size);
  }

#ifdef VERIFY
  printf("Testing\n");
  ForwardSub_Serial(m_ref, a_ref, b_ref);
  BackSub(finalVec_ref, a_ref, b_ref);
  printf("Testing1\n");
  int passed = 1;

  for (i = 0; i < Size; i++)
    if (!check_tolerance(finalVec[i], finalVec_ref[i])) {
      printf("finalVec mismatch at %d: calc = %f, ref = %f\n", i, finalVec[i], finalVec_ref[i]);
      passed &= 0;
      break;
    }

  for (i = 0; i < Size * Size; i++)
    if (!check_tolerance(m[i], m_ref[i])) {
      printf("m mismatch at %d: calc = %f, ref = %f\n", i, m[i], m_ref[i]);
      passed &= 0;
      break;
    }

  for (i = 0; i < Size * Size; i++)
    if (!check_tolerance(a[i], a_ref[i])) {
      printf("a mismatch at %d: calc = %f, ref = %f\n", i, a[i], a_ref[i]);
      passed &= 0;
      break;
    }

  for (i = 0; i < Size; i++)
    if (!check_tolerance(b[i], b_ref[i])) {
      printf("b mismatch at %d: calc = %f, ref = %f\n", i, b[i], b_ref[i]);
      passed &= 0;
      break;
    }

  if (passed == 1)
    printf("PASSED\n");
  else
    printf("FAILED\n");
  free(m_ref);
  free(a_ref);
  free(b_ref);

#endif
  /*
     int passed = 1;
     FILE *gp = fopen("cuda/gold_output.txt", "r");
     float *gold_m = (float *)malloc(Size * Size * sizeof(float));
     float *gold_a = (float *)malloc(Size * Size * sizeof(float));
     float *gold_b = (float *)malloc(Size * sizeof(float));
     float *gold_final = (float *)malloc(Size * sizeof(float));

     for (i = 0; i < Size; i++)
     for (j = 0; j < Size; j++)
     fscanf(gp, "%f", &gold_m[i * Size + j]);
     for (i = 0; i < Size; i++)
     for (j = 0; j < Size; j++)
     fscanf(gp, "%f", &gold_a[i * Size + j]);
     for (i = 0; i < Size; i++)
     fscanf(gp, "%f", &gold_b[i]);
     for (i = 0; i < Size; i++)
     fscanf(gp, "%f", &gold_final[i]);

     for (i = 0; i < Size; i++) {
     for (j = 0; j < Size; j++) {
     if (!check_tolerance(m[i * Size + j], gold_m[i * Size + j])) {
     passed = 0;
     printf("m Mismatch at %d.\n", i * Size + j);
     break;
     }
     if (!check_tolerance(a[i * Size + j], gold_a[i * Size + j])) {
     passed = 0;
     printf("a Mismatch at %d.\n", i * Size + j);
     break;
     }
     }
     }
     if (passed) {
     for (i = 0; i < Size; i++) {
     if (!check_tolerance(b[i], gold_b[i])) {
     passed = 0;
     printf("b Mismatch at %d.\n", i);
     break;
     }
     if (!check_tolerance(finalVec[i], gold_final[i])) {
     passed = 0;
     printf("final Mismatch at %d.\n", i);
     break;
     }
     }
     }
     if (passed)
     printf("PASSED.\n");
     else
     printf("FAILED.\n");
     fclose(gp);
     free(gold_m);
     free(gold_a);
     free(gold_b);
     free(gold_final);
     */

  free(m);
  free(a);
  free(b);

  //stop_timer(timer_ctrl);
  //printf("Execution time %lld us\n\r", elapsed_time());
}
/*------------------------------------------------------
 ** PrintDeviceProperties
 **-----------------------------------------------------
 */
/*void PrintDeviceProperties(){
  cudaDeviceProp deviceProp;  
  int nDevCount = 0;  

  cudaGetDeviceCount( &nDevCount );  
  printf( "Total Device found: %d", nDevCount );  
  for (int nDeviceIdx = 0; nDeviceIdx < nDevCount; ++nDeviceIdx )  
  {  
  memset( &deviceProp, 0, sizeof(deviceProp));  
  if( cudaSuccess == cudaGetDeviceProperties(&deviceProp, nDeviceIdx))  
  {
  printf( "\nDevice Name \t\t - %s ", deviceProp.name );  
  printf( "\n**************************************");  
  printf( "\nTotal Global Memory\t\t\t - %lu KB", deviceProp.totalGlobalMem/1024 );  
  printf( "\nShared memory available per block \t - %lu KB", deviceProp.sharedMemPerBlock/1024 );  
  printf( "\nNumber of registers per thread block \t - %d", deviceProp.regsPerBlock );  
  printf( "\nWarp size in threads \t\t\t - %d", deviceProp.warpSize );  
  printf( "\nMemory Pitch \t\t\t\t - %zu bytes", deviceProp.memPitch );  
  printf( "\nMaximum threads per block \t\t - %d", deviceProp.maxThreadsPerBlock );  
  printf( "\nMaximum Thread Dimension (block) \t - %d %d %d", deviceProp.maxThreadsDim[0], deviceProp.maxThreadsDim[1], deviceProp.maxThreadsDim[2] );  
  printf( "\nMaximum Thread Dimension (grid) \t - %d %d %d", deviceProp.maxGridSize[0], deviceProp.maxGridSize[1], deviceProp.maxGridSize[2] );  
  printf( "\nTotal constant memory \t\t\t - %zu bytes", deviceProp.totalConstMem );  
  printf( "\nCUDA ver \t\t\t\t - %d.%d", deviceProp.major, deviceProp.minor );  
  printf( "\nClock rate \t\t\t\t - %d KHz", deviceProp.clockRate );  
  printf( "\nTexture Alignment \t\t\t - %zu bytes", deviceProp.textureAlignment );  
  printf( "\nDevice Overlap \t\t\t\t - %s", deviceProp. deviceOverlap?"Allowed":"Not Allowed" );  
  printf( "\nNumber of Multi processors \t\t - %d\n\n", deviceProp.multiProcessorCount );  
  }  
  else  
  printf( "\n%s", cudaGetErrorString(cudaGetLastError()));  
  }  
  }
  */ 

/*------------------------------------------------------
 ** InitProblemOnce -- Initialize all of matrices and
 ** vectors by opening a data file specified by the user.
 **
 ** We used dynamic array *a, *b, and *m to allocate
 ** the memory storages.
 **------------------------------------------------------
 */
void InitProblemOnce(char *filename, float *a, float *b, float *m)
{
  //char *filename = argv[1];

  //printf("Enter the data file name: ");
  //scanf("%s", filename);
  //printf("The file name is: %s\n", filename);

  fp = fopen(filename, "r");

  fscanf(fp, "%d", &Size);	

  a = (float *) malloc(Size * Size * sizeof(float));
  if (a == NULL) {
    printf("Unable to allocate memory for a\n");
    exit(1);
  }
  InitMat(a, Size, Size);
  //printf("The input matrix a is:\n");
  //PrintMat(a, Size, Size);
  b = (float *) malloc(Size * sizeof(float));
  if (b == NULL) {
    printf("Unable to allocate memory for b\n");
    exit(1);
  }
  InitAry(b, Size);
  //printf("The input array b is:\n");
  //PrintAry(b, Size);

  m = (float *) malloc(Size * Size * sizeof(float));
  if (m == NULL) {
    printf("Unable to allocate memory for m\n");
    exit(1);
  }
}

/*------------------------------------------------------
 ** InitPerRun() -- Initialize the contents of the
 ** multipier matrix **m
 **------------------------------------------------------
 */
void InitPerRun(float *m) 
{
  int i;
  for (i=0; i<Size*Size; i++)
    *(m+i) = 0.0;
}

/*-------------------------------------------------------
 ** Fan1() -- Calculate multiplier matrix
 ** Pay attention to the index.  Index i give the range
 ** which starts from 0 to range-1.  The real values of
 ** the index should be adjust and related with the value
 ** of t which is defined on the ForwardSub().
 **-------------------------------------------------------
 */
/*
   __global__ void Fan1(float *m_cuda, float *a_cuda, int Size, int t)
   {   
//if(threadIdx.x + blockIdx.x * blockDim.x >= Size-1-t) printf(".");
//printf("blockIDx.x:%d,threadIdx.x:%d,Size:%d,t:%d,Size-1-t:%d\n",blockIdx.x,threadIdx.x,Size,t,Size-1-t);

if(threadIdx.x + blockIdx.x * blockDim.x >= Size-1-t) return;
 *(m_cuda+Size*(blockDim.x*blockIdx.x+threadIdx.x+t+1)+t) = *(a_cuda+Size*(blockDim.x*blockIdx.x+threadIdx.x+t+1)+t) / *(a_cuda+Size*t+t);
 }
 */
/*-------------------------------------------------------
 ** Fan2() -- Modify the matrix A into LUD
 **-------------------------------------------------------
 */ 
/*
   __global__ void Fan2(float *m_cuda, float *a_cuda, float *b_cuda,int Size, int j1, int t)
   {
   if(threadIdx.x + blockIdx.x * blockDim.x >= Size-1-t) return;
   if(threadIdx.y + blockIdx.y * blockDim.y >= Size-t) return;

   int xidx = blockIdx.x * blockDim.x + threadIdx.x;
   int yidx = blockIdx.y * blockDim.y + threadIdx.y;
//printf("blockIdx.x:%d,threadIdx.x:%d,blockIdx.y:%d,threadIdx.y:%d,blockDim.x:%d,blockDim.y:%d\n",blockIdx.x,threadIdx.x,blockIdx.y,threadIdx.y,blockDim.x,blockDim.y);

a_cuda[Size*(xidx+1+t)+(yidx+t)] -= m_cuda[Size*(xidx+1+t)+t] * a_cuda[Size*t+(yidx+t)];
//a_cuda[xidx+1+t][yidx+t] -= m_cuda[xidx+1+t][t] * a_cuda[t][yidx+t];
if(yidx == 0){
//printf("blockIdx.x:%d,threadIdx.x:%d,blockIdx.y:%d,threadIdx.y:%d,blockDim.x:%d,blockDim.y:%d\n",blockIdx.x,threadIdx.x,blockIdx.y,threadIdx.y,blockDim.x,blockDim.y);
//printf("xidx:%d,yidx:%d\n",xidx,yidx);
b_cuda[xidx+1+t] -= m_cuda[Size*(xidx+1+t)+(yidx+t)] * b_cuda[t];
}
}
*/
/*------------------------------------------------------
 ** ForwardSub() -- Forward substitution of Gaussian
 ** elimination.
 **------------------------------------------------------
 */
int ForwardSub(float *m, float *a, float *b)
{
  int i, t;

#ifdef HW
  XFcuda xcore;
  int Status;

  Status = XFcuda_Initialize(&xcore, 0);
  if (Status != XST_SUCCESS) {
    printf("Initialization failed %d\n", Status);
    exit(1);
  }
#endif

  //float *m_cuda,*a_cuda,*b_cuda;

  // allocate memory on GPU
  //cudaMalloc((void **) &m_cuda, Size * Size * sizeof(float));

  //cudaMalloc((void **) &a_cuda, Size * Size * sizeof(float));

  //cudaMalloc((void **) &b_cuda, Size * sizeof(float));	

  // copy memory to GPU
  //cudaMemcpy(m_cuda, m, Size * Size * sizeof(float),cudaMemcpyHostToDevice );
  //cudaMemcpy(a_cuda, a, Size * Size * sizeof(float),cudaMemcpyHostToDevice );
  //cudaMemcpy(b_cuda, b, Size * sizeof(float),cudaMemcpyHostToDevice );

  int block_size,grid_size;

  block_size = MAXBLOCKSIZE;
  grid_size = (Size/block_size) + (!(Size%block_size)? 0:1);



  dim3 dimBlock(block_size);
  dim3 dimGrid(grid_size);
  //dim3 dimGrid( (Size/dimBlock.x) + (!(Size%dimBlock.x)?0:1) );

  int blockSize2d, gridSize2d;
  blockSize2d = 4;
  gridSize2d = (Size/blockSize2d) + (!(Size%blockSize2d?0:1)); 

  dim3 dimBlockXY(blockSize2d,blockSize2d);
  dim3 dimGridXY(gridSize2d,gridSize2d);

  // begin timing kernels
  //struct timeval time_start;
  //gettimeofday(&time_start, NULL);

#ifdef HW

  XFcuda_SetSize(&xcore, Size);
  XFcuda_SetM_cuda_addr(&xcore, (u32)m / sizeof(float));
  XFcuda_SetA_cuda_addr(&xcore, (u32)a / sizeof(float));
  XFcuda_SetB_cuda_addr(&xcore, (u32)b / sizeof(float));

#endif

  //long long int cdma_time = 0;
  for (t=0; t<(Size-1); t++) {


#ifdef HW
    XFcuda_SetT(&xcore, t);
    //XFcuda_SetJ1(&xcore, Size - t);
    XFcuda_SetGriddim_x(&xcore, dimGrid.x);
    XFcuda_SetGriddim_y(&xcore, dimGrid.y);
    //XFcuda_SetGriddim_z(&xcore, dimGrid.z);
    XFcuda_SetBlockdim_x(&xcore, dimBlock.x);
    XFcuda_SetBlockdim_y(&xcore, dimBlock.y);
    //XFcuda_SetBlockdim_z(&xcore, dimBlock.z);

    XFcuda_SetEn_fcuda1(&xcore, 1);
    XFcuda_SetEn_fcuda2(&xcore, 0);
    Xil_DCacheFlush();

    XFcuda_Start(&xcore);
    while (!XFcuda_IsIdle(&xcore));

    XFcuda_SetGriddim_x(&xcore, dimGridXY.x);
    XFcuda_SetGriddim_y(&xcore, dimGridXY.y);
    //XFcuda_SetGriddim_z(&xcore, dimGridXY.z);
    XFcuda_SetBlockdim_x(&xcore, dimBlockXY.x);
    XFcuda_SetBlockdim_y(&xcore, dimBlockXY.y);
    //XFcuda_SetBlockdim_z(&xcore, dimBlockXY.z);

    XFcuda_SetEn_fcuda1(&xcore, 0);
    XFcuda_SetEn_fcuda2(&xcore, 1);

    Xil_DCacheFlush();
    XFcuda_Start(&xcore);
    while (!XFcuda_IsIdle(&xcore));
    Xil_DCacheFlush();
#else
    Fan1(m,a,Size,t, dimGrid, dimBlock, 1, 0);
    Fan2(m,a,b,Size,Size-t,t, dimGridXY, dimBlockXY, 1, 0);
#endif
  }
  // end timing kernels
  //struct timeval time_end;
  //gettimeofday(&time_end, NULL);
  //totalKernelTime = (time_end.tv_sec * 1000000 + time_end.tv_usec) - (time_start.tv_sec * 1000000 + time_start.tv_usec);

  // copy memory back to CPU
  //cudaMemcpy(m, m_cuda, Size * Size * sizeof(float),cudaMemcpyDeviceToHost );
  //cudaMemcpy(a, a_cuda, Size * Size * sizeof(float),cudaMemcpyDeviceToHost );
  //cudaMemcpy(b, b_cuda, Size * sizeof(float),cudaMemcpyDeviceToHost );
  //cudaFree(m_cuda);
  //cudaFree(a_cuda);
  //cudaFree(b_cuda);
}

void ForwardSub_Serial(float *m, float *a, float *b)
{
  int i, t;

  int block_size,grid_size;

  block_size = MAXBLOCKSIZE;
  grid_size = (Size/block_size) + (!(Size%block_size)? 0:1);

  dim3 dimBlock(block_size);
  dim3 dimGrid(grid_size);
  //dim3 dimGrid( (Size/dimBlock.x) + (!(Size%dimBlock.x)?0:1) );

  int blockSize2d, gridSize2d;
  blockSize2d = 4;
  gridSize2d = (Size/blockSize2d) + (!(Size%blockSize2d?0:1));

  dim3 dimBlockXY(blockSize2d,blockSize2d);
  dim3 dimGridXY(gridSize2d,gridSize2d);

  for (t=0; t<(Size-1); t++) {
    Fan1(m,a,Size,t, dimGrid, dimBlock, 1, 0);
    //cudaThreadSynchronize();
    Fan2(m,a,b,Size,Size-t,t, dimGridXY, dimBlockXY, 1, 0);
    //cudaThreadSynchronize();
    //checkCUDAError("Fan2");
  }
}

/*------------------------------------------------------
 ** BackSub() -- Backward substitution
 **------------------------------------------------------
 */

void BackSub(float *finalVec, float *a, float *b)
{
  // create a new vector to hold the final answer
  //finalVec = (float *) malloc(Size * sizeof(float));
  //memset(finalVec, 0, Size * sizeof(float));
  // solve "bottom up"
  int i,j;
  for(i=0;i<Size;i++){
    finalVec[Size-i-1]=b[Size-i-1];
    for(j=0;j<i;j++)
    {
      finalVec[Size-i-1]-=*(a+Size*(Size-i-1)+(Size-j-1)) * finalVec[Size-j-1];
    }
    finalVec[Size-i-1]=finalVec[Size-i-1]/ *(a+Size*(Size-i-1)+(Size-i-1));
  }
}

void InitMat(float *ary, int nrow, int ncol)
{
  int i, j;

  for (i=0; i<nrow; i++) {
    for (j=0; j<ncol; j++) {
      fscanf(fp, "%f",  ary+Size*i+j);
    }
  }  
}

/*------------------------------------------------------
 ** PrintMat() -- Print the contents of the matrix
 **------------------------------------------------------
 */
void PrintMat(float *ary, int nrow, int ncol)
{
  int i, j;
  float e=1e-6;
  for (i=0; i<nrow; i++) {
    for (j=0; j<ncol; j++) {
      if (*(ary+Size*i+j)<e && *(ary+Size*i+j)>-e)
        *(ary+Size*i+j) = 0.00;
      printf("%8.2f ", *(ary+Size*i+j));
    }
    printf("\n");
  }
  printf("\n");
}

/*------------------------------------------------------
 ** InitAry() -- Initialize the array (vector) by reading
 ** data from the data file
 **------------------------------------------------------
 */
void InitAry(float *ary, int ary_size)
{
  int i;

  for (i=0; i<ary_size; i++) {
    fscanf(fp, "%f",  &ary[i]);
  }
}  

/*------------------------------------------------------
 ** PrintAry() -- Print the contents of the array (vector)
 **------------------------------------------------------
 */
void PrintAry(float *ary, int ary_size)
{
  int i;
  float e=1e-6;
  for (i=0; i<ary_size; i++) {
    if (ary[i] < e && ary[i] > -e)
      ary[i]=0.00;
    printf("%f\n", ary[i]);
  }
  printf("\n\n");
}
/*void checkCUDAError(const char *msg)
  {
  cudaError_t err = cudaGetLastError();
  if( cudaSuccess != err) 
  {
  fprintf(stderr, "Cuda error: %s: %s.\n", msg, 
  cudaGetErrorString( err) );
  exit(EXIT_FAILURE);
  }                         
  }
  */
