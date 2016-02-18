// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "srad.h"

#define EPSILON 0.001
// includes, project
//#include <cuda.h>

// includes, kernels
//#include "fcuda_generated_srad_kernel.c"

void random_matrix(double *I, int rows, int cols);
void runTest( int argc, char** argv);
void usage(int argc, char **argv)
{
  fprintf(stderr, "Usage: %s <rows> <cols> <y1> <y2> <x1> <x2> <lamda> <no. of iter>\n", argv[0]);
  fprintf(stderr, "\t<rows>   - number of rows\n");
  fprintf(stderr, "\t<cols>    - number of cols\n");
  fprintf(stderr, "\t<y1> 	 - y1 value of the speckle\n");
  fprintf(stderr, "\t<y2>      - y2 value of the speckle\n");
  fprintf(stderr, "\t<x1>       - x1 value of the speckle\n");
  fprintf(stderr, "\t<x2>       - x2 value of the speckle\n");
  fprintf(stderr, "\t<lamda>   - lambda (0,1)\n");
  fprintf(stderr, "\t<no. of iter>   - number of iterations\n");

  exit(1);
}
////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
  int
main( int argc, char** argv)
{
  runTest( argc, argv);

  return EXIT_SUCCESS;
}


  void
runTest( int argc, char** argv)
{
  int rows, cols, size_I, size_R, niter = 10, iter;
  double *I, *J, lambda, q0sqr, sum, sum2, tmp, meanROI,varROI ;

#ifdef CPU
  double Jc, G2, L, num, den, qsqr;
  int *iN,*iS,*jE,*jW, k;
  double *dN,*dS,*dW,*dE;
  double cN,cS,cW,cE,D;
#endif

#ifdef GPU

  double *J_cuda;
  double *C_cuda;
  double *E_C, *W_C, *N_C, *S_C;

#endif

  unsigned int r1, r2, c1, c2;
  double *c;



  if (argc == 9)
  {
    rows = atoi(argv[1]);  //number of rows in the domain
    cols = atoi(argv[2]);  //number of cols in the domain
    if ((rows%16!=0) || (cols%16!=0)){
      fprintf(stderr, "rows and cols must be multiples of 16\n");
      exit(1);
    }
    r1   = atoi(argv[3]);  //y1 position of the speckle
    r2   = atoi(argv[4]);  //y2 position of the speckle
    c1   = atoi(argv[5]);  //x1 position of the speckle
    c2   = atoi(argv[6]);  //x2 position of the speckle
    lambda = atof(argv[7]); //Lambda value
    niter = atoi(argv[8]); //number of iterations

  }
  else{
    usage(argc, argv);
  }



  size_I = cols * rows;
  size_R = (r2-r1+1)*(c2-c1+1);

  I = (double *)malloc( size_I * sizeof(double) );
  J = (double *)malloc( size_I * sizeof(double) );
  c  = (double *)malloc(sizeof(double)* size_I) ;


#ifdef CPU

  iN = (int *)malloc(sizeof(unsigned int*) * rows) ;
  iS = (int *)malloc(sizeof(unsigned int*) * rows) ;
  jW = (int *)malloc(sizeof(unsigned int*) * cols) ;
  jE = (int *)malloc(sizeof(unsigned int*) * cols) ;


  dN = (double *)malloc(sizeof(double)* size_I) ;
  dS = (double *)malloc(sizeof(double)* size_I) ;
  dW = (double *)malloc(sizeof(double)* size_I) ;
  dE = (double *)malloc(sizeof(double)* size_I) ;


  for (int i=0; i< rows; i++) {
    iN[i] = i-1;
    iS[i] = i+1;
  }
  for (int j=0; j< cols; j++) {
    jW[j] = j-1;
    jE[j] = j+1;
  }
  iN[0]    = 0;
  iS[rows-1] = rows-1;
  jW[0]    = 0;
  jE[cols-1] = cols-1;

#endif

#ifdef GPU
  printf("size_I = %d\n", size_I);
  //Allocate device memory
  //cudaMalloc((void**)& J_cuda, sizeof(double)* size_I);
  J_cuda = (double*)malloc(sizeof(double)*size_I);
  //cudaMalloc((void**)& C_cuda, sizeof(double)* size_I);
  C_cuda = (double*)malloc(sizeof(double)*size_I);
  //cudaMalloc((void**)& E_C, sizeof(double)* size_I);
  E_C = (double*)malloc(sizeof(double)*size_I);
  //cudaMalloc((void**)& W_C, sizeof(double)* size_I);
  W_C = (double*)malloc(sizeof(double)*size_I);
  //cudaMalloc((void**)& S_C, sizeof(double)* size_I);
  S_C = (double*)malloc(sizeof(double)*size_I);
  //cudaMalloc((void**)& N_C, sizeof(double)* size_I);
  N_C = (double*)malloc(sizeof(double)*size_I);

#endif

  printf("Randomizing the input matrix\n");
  //Generate a random matrix
  random_matrix(I, rows, cols);

  for (int k = 0;  k < size_I; k++ ) {
    J[k] = exp(I[k]*1.0) ;
  }
  printf("Start the SRAD main loop\n");
  for (iter=0; iter< niter; iter++){
    sum=0; sum2=0;
    for (int i=r1; i<=r2; i++) {
      for (int j=c1; j<=c2; j++) {
        tmp   = J[i * cols + j];
        sum  += tmp ;
        sum2 += tmp*tmp;
      }
    }
    meanROI = sum / (size_R * 1.0);
    varROI  = (sum2 / (size_R*1.0)) - meanROI*meanROI;
    q0sqr   = varROI / (1.0*(meanROI*meanROI));

#ifdef CPU

    for (int i = 0 ; i < rows ; i++) {
      for (int j = 0; j < cols; j++) {

        k = i * cols + j;
        Jc = J[k];

        // directional derivates
        dN[k] = J[iN[i] * cols + j] - Jc;
        dS[k] = J[iS[i] * cols + j] - Jc;
        dW[k] = J[i * cols + jW[j]] - Jc;
        dE[k] = J[i * cols + jE[j]] - Jc;

        G2 = (dN[k]*dN[k] + dS[k]*dS[k]
            + dW[k]*dW[k] + dE[k]*dE[k]) / (Jc*Jc);

        L = (dN[k] + dS[k] + dW[k] + dE[k]) / Jc;

        num  = (0.5*G2) - ((1.0/16.0)*(L*L)) ;
        den  = 1.0 + (.25*L);
        qsqr = num/(den*den*1.0);

        // diffusion coefficent (equ 33)
        den = (qsqr-q0sqr) / (q0sqr * (1.0+q0sqr)) ;
        c[k] = 1.0 / (1.0+den) ;

        // saturate diffusion coefficent
        if (c[k] < 0) {c[k] = 0;}
        else if (c[k] > 1) {c[k] = 1;}
      }
    }
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {

        // current index
        k = i * cols + j;

        // diffusion coefficent
        cN = c[k];
        cS = c[iS[i] * cols + j];
        cW = c[k];
        cE = c[i * cols + jE[j]];

        // divergence (equ 58)
        D = cN * dN[k] + cS * dS[k] + cW * dW[k] + cE * dE[k];

        // image update (equ 61)
        J[k] = J[k] + 0.25*lambda*D;
      }
    }

#endif // CPU


#ifdef GPU

    //Currently the input size must be divided by 16 - the block size
    int block_x = cols/BLOCK_SIZE ;
    int block_y = rows/BLOCK_SIZE ;

    dim3 dimBlock(BLOCK_SIZE, BLOCK_SIZE);
    dim3 dimGrid(block_x , block_y);


    //Copy data from main memory to device memory
    //cudaMemcpy(J_cuda, J, sizeof(double) * size_I, cudaMemcpyHostToDevice);
    memcpy(J_cuda, J, sizeof(double) * size_I);
    //Run kernels
    //srad_cuda_1<<<dimGrid, dimBlock>>>(E_C, W_C, N_C, S_C, J_cuda, C_cuda, cols, rows, q0sqr);
    srad_cuda_1(E_C, W_C, N_C, S_C, J_cuda, C_cuda, cols, rows, q0sqr, dimGrid, dimBlock, 1, 0);
    //srad_cuda_2<<<dimGrid, dimBlock>>>(E_C, W_C, N_C, S_C, J_cuda, C_cuda, cols, rows, lambda, q0sqr);
    srad_cuda_2(E_C, W_C, N_C, S_C, J_cuda, C_cuda, cols, rows, lambda, q0sqr, dimGrid, dimBlock, 1, 0);

    //Copy data from device memory to main memory
    //cudaMemcpy(J, J_cuda, sizeof(double) * size_I, cudaMemcpyDeviceToHost);
    memcpy(J, J_cuda, sizeof(double) * size_I);

#endif
  }

  //cudaThreadSynchronize();
#define OUTPUT
#ifdef OUTPUT
  //Printing output
  printf("Printing Output:\n");
  int passed = 1;
  FILE *gp = fopen("cuda/gold_output.txt", "r");
  if (gp == NULL) {
    printf("Cannot open file.\n");
  }
  double gold_J_val;
  for( int i = 0 ; i < rows ; i++){
    for ( int j = 0 ; j < cols ; j++){
      fscanf(gp, "%lf", &gold_J_val);
      //printf("%.8f ", J[i * cols + j]);
      if (fabs(gold_J_val - J[i * cols + j]) > EPSILON) {
        printf("Mismatch at %d: gold = %f, calc = %f.\n",
            i * cols + j, gold_J_val, J[i * cols + j]);
        passed = 0;
        break;
      }
    }
    if (passed == 0)
      break;
    //printf("\n");
  }
  fclose(gp);
  if (passed == 1)
    printf("PASSED.\n");
  else
    printf("FAILED.\n");
#endif

  printf("Computation Done\n");

  free(I);
  free(J);
#ifdef CPU
  free(iN); free(iS); free(jW); free(jE);
  free(dN); free(dS); free(dW); free(dE);
#endif
#ifdef GPU
  /*cudaFree(C_cuda);
    cudaFree(J_cuda);
    cudaFree(E_C);
    cudaFree(W_C);
    cudaFree(N_C);
    cudaFree(S_C);*/
  free(C_cuda);
  free(J_cuda);
  free(E_C);
  free(W_C);
  free(N_C);
  free(S_C);

#endif
  free(c);

}


void random_matrix(double *I, int rows, int cols){

  srand(7);

  for( int i = 0 ; i < rows ; i++){
    for ( int j = 0 ; j < cols ; j++){
      I[i * cols + j] = rand()/(RAND_MAX*1.0) ;
    }
  }

}
