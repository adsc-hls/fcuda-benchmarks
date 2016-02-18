#define LIMIT -999
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "needle.h"
//#include <cuda.h>
#include <fcuda.h>
#include "gold_output.h"
//#include <sys/time.h>

#include "xil_cache.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "hardware_timer.h"
#include "xfcuda.h"
#define HW
#define TRACEBACK
#define VERBOSE
/*
   int maximum(int a, int b, int c) {
   int k;
   if( a <= b )
   k = b;
   else
   k = a;

   if (k <=c )
   return(c);
   else
   return(k);
   }
   */
// includes, kernels
////////////////////////////////////////////////////////////////////////////////
// declaration, forward
void runTest( int argc, char** argv);

int blosum62[24][24] = {
  { 4, -1, -2, -2,  0, -1, -1,  0, -2, -1, -1, -1, -1, -2, -1,  1,  0, -3, -2,  0, -2, -1,  0, -4},
  {-1,  5,  0, -2, -3,  1,  0, -2,  0, -3, -2,  2, -1, -3, -2, -1, -1, -3, -2, -3, -1,  0, -1, -4},
  {-2,  0,  6,  1, -3,  0,  0,  0,  1, -3, -3,  0, -2, -3, -2,  1,  0, -4, -2, -3,  3,  0, -1, -4},
  {-2, -2,  1,  6, -3,  0,  2, -1, -1, -3, -4, -1, -3, -3, -1,  0, -1, -4, -3, -3,  4,  1, -1, -4},
  { 0, -3, -3, -3,  9, -3, -4, -3, -3, -1, -1, -3, -1, -2, -3, -1, -1, -2, -2, -1, -3, -3, -2, -4},
  {-1,  1,  0,  0, -3,  5,  2, -2,  0, -3, -2,  1,  0, -3, -1,  0, -1, -2, -1, -2,  0,  3, -1, -4},
  {-1,  0,  0,  2, -4,  2,  5, -2,  0, -3, -3,  1, -2, -3, -1,  0, -1, -3, -2, -2,  1,  4, -1, -4},
  { 0, -2,  0, -1, -3, -2, -2,  6, -2, -4, -4, -2, -3, -3, -2,  0, -2, -2, -3, -3, -1, -2, -1, -4},
  {-2,  0,  1, -1, -3,  0,  0, -2,  8, -3, -3, -1, -2, -1, -2, -1, -2, -2,  2, -3,  0,  0, -1, -4},
  {-1, -3, -3, -3, -1, -3, -3, -4, -3,  4,  2, -3,  1,  0, -3, -2, -1, -3, -1,  3, -3, -3, -1, -4},
  {-1, -2, -3, -4, -1, -2, -3, -4, -3,  2,  4, -2,  2,  0, -3, -2, -1, -2, -1,  1, -4, -3, -1, -4},
  {-1,  2,  0, -1, -3,  1,  1, -2, -1, -3, -2,  5, -1, -3, -1,  0, -1, -3, -2, -2,  0,  1, -1, -4},
  {-1, -1, -2, -3, -1,  0, -2, -3, -2,  1,  2, -1,  5,  0, -2, -1, -1, -1, -1,  1, -3, -1, -1, -4},
  {-2, -3, -3, -3, -2, -3, -3, -3, -1,  0,  0, -3,  0,  6, -4, -2, -2,  1,  3, -1, -3, -3, -1, -4},
  {-1, -2, -2, -1, -3, -1, -1, -2, -2, -3, -3, -1, -2, -4,  7, -1, -1, -4, -3, -2, -2, -1, -2, -4},
  { 1, -1,  1,  0, -1,  0,  0,  0, -1, -2, -2,  0, -1, -2, -1,  4,  1, -3, -2, -2,  0,  0,  0, -4},
  { 0, -1,  0, -1, -1, -1, -1, -2, -2, -1, -1, -1, -1, -2, -1,  1,  5, -2, -2,  0, -1, -1,  0, -4},
  {-3, -3, -4, -4, -2, -2, -3, -2, -2, -3, -2, -3, -1,  1, -4, -3, -2, 11,  2, -3, -4, -3, -2, -4},
  {-2, -2, -2, -3, -2, -1, -2, -3,  2, -1, -1, -2, -1,  3, -3, -2, -2,  2,  7, -1, -3, -2, -1, -4},
  { 0, -3, -3, -3, -1, -2, -2, -3, -3,  3,  1, -2,  1, -1, -2, -2,  0, -3, -1,  4, -3, -2, -1, -4},
  {-2, -1,  3,  4, -3,  0,  1, -1,  0, -3, -4,  0, -3, -3, -2,  0, -1, -4, -3, -3,  4,  1, -1, -4},
  {-1,  0,  0,  1, -3,  3,  4, -2,  0, -3, -3,  1, -1, -3, -1,  0, -1, -3, -2, -2,  1,  4, -1, -4},
  { 0, -1, -1, -1, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2,  0,  0, -2, -1, -1, -1, -1, -1, -4},
  {-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,  1}
};
////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
  int
main( int argc, char** argv)
{
  runTest( argc, argv);
  return EXIT_SUCCESS;
}

void usage(int argc, char **argv)
{
  fprintf(stderr, "Usage: %s <max_rows/max_cols> <penalty> \n", argv[0]);
  fprintf(stderr, "\t<dimension>  - x and y dimensions\n");
  fprintf(stderr, "\t<penalty> - penalty(positive integer)\n");
  exit(1);
}

void runTest( int argc, char** argv)
{
  int max_rows, max_cols, penalty;
  int *input_itemsets, *output_itemsets, *referrence;
  int *matrix_cuda, *matrix_cuda_out, *referrence_cuda;
  int size, i;

#ifdef HW
  XFcuda xcore;
  Xint32 Status;

  Status = XFcuda_Initialize(&xcore, 0);
  if (Status != XST_SUCCESS) {
    xil_printf("Initialization failed %d\r\n", Status);
    exit(1);
  }
#endif

  // the lengths of the two sequences should be able to divided by 16.
  // And at current stage  max_rows needs to equal max_cols
  /*
     if (argc == 3)
     {
     max_rows = atoi(argv[1]);
     max_cols = atoi(argv[1]);
     penalty = atoi(argv[2]);
     }
     else{
     usage(argc, argv);
     }

     if(atoi(argv[1])%16!=0){
     fprintf(stderr,"The dimension values must be a multiple of 16\n");
     exit(1);
     }
     */

  max_rows = 2048;
  max_cols = 2048;
  penalty = 10;

  max_rows = max_rows + 1;
  max_cols = max_cols + 1;
  referrence = (int *)malloc( max_rows * max_cols * sizeof(int) );
  input_itemsets = (int *)malloc( max_rows * max_cols * sizeof(int) );
  output_itemsets = (int *)malloc( max_rows * max_cols * sizeof(int) );


  if (!input_itemsets)
    fprintf(stderr, "error: can not allocate memory");

  srand ( 7 );


  for (int i = 0 ; i < max_cols; i++){
    for (int j = 0 ; j < max_rows; j++){
      input_itemsets[i*max_cols+j] = 0;
    }
  }

#ifdef VERBOSE
  printf("Start Needleman-Wunsch\n");
#endif

  for( int i=1; i< max_rows ; i++){    //please define your own sequence.
    input_itemsets[i*max_cols] = rand() % 10 + 1;
  }
  for( int j=1; j< max_cols ; j++){    //please define your own sequence.
    input_itemsets[j] = rand() % 10 + 1;
  }


  for (int i = 1 ; i < max_cols; i++){
    for (int j = 1 ; j < max_rows; j++){
      referrence[i*max_cols+j] = blosum62[input_itemsets[i*max_cols]][input_itemsets[j]];
    }
  }

  for( int i = 1; i< max_rows ; i++)
    input_itemsets[i*max_cols] = -i * penalty;
  for( int j = 1; j< max_cols ; j++)
    input_itemsets[j] = -j * penalty;


  size = max_cols * max_rows;
  //cudaMalloc((void**)& referrence_cuda, sizeof(int)*size);
  referrence_cuda = (int*)malloc(sizeof(int)*size);
  if (referrence_cuda == NULL) {
    printf("Cannot allocate memory for referrence_cuda\n");
    exit(1);
  }
  //cudaMalloc((void**)& matrix_cuda, sizeof(int)*size);
  matrix_cuda = (int*)malloc(sizeof(int)*size);
  if (matrix_cuda == NULL) {
    printf("Cannot allocate memory for matrix_cuda\n");
    exit(1);
  }

  //cudaMalloc((void**)& matrix_cuda_out, sizeof(int)*size);
  matrix_cuda_out = (int*)malloc(sizeof(int)*size);
  if (matrix_cuda_out == NULL) {
    printf("Cannot allocate memory for matrix_cuda_out\n");
    exit(1);
  }

  //cudaMemcpy(referrence_cuda, referrence, sizeof(int) * size, cudaMemcpyHostToDevice);
  memcpy(referrence_cuda, referrence, sizeof(int) * size);
  //cudaMemcpy(matrix_cuda, input_itemsets, sizeof(int) * size, cudaMemcpyHostToDevice);
  memcpy(matrix_cuda, input_itemsets, sizeof(int) * size);
  dim3 dimGrid;
  dim3 dimBlock(BLOCK_SIZE, 1);
  int block_width = ( max_cols - 1 )/BLOCK_SIZE;
  //printf("%d\n", size);

#ifdef HW

  XFcuda_SetCols(&xcore, max_cols);
  XFcuda_SetPenalty(&xcore, penalty);
  XFcuda_SetBlockdim_x(&xcore, dimBlock.x);
  //XFcuda_SetBlockdim_y(&xcore, dimBlock.y);
  //XFcuda_SetBlockdim_z(&xcore, dimBlock.z);
  XFcuda_SetReferrence_addr(&xcore, (u32)referrence_cuda / sizeof(float));
  XFcuda_SetMatrix_cuda_addr(&xcore, (u32)matrix_cuda / sizeof(float));

  XFcuda_SetCols(&xcore, max_cols);
  XFcuda_SetPenalty(&xcore, penalty);
  XFcuda_SetBlock_width(&xcore, block_width);
  XFcuda_SetBlockdim_x(&xcore, dimBlock.x);
  //XFcuda_SetBlockdim_y(&xcore, dimBlock.y);
  //XFcuda_SetBlockdim_z(&xcore, dimBlock.z);
  XFcuda_SetReferrence_addr(&xcore, (u32)referrence_cuda / sizeof(float));
  XFcuda_SetMatrix_cuda_addr(&xcore, (u32)matrix_cuda / sizeof(float));

#endif

  int t, index;
#ifdef VERBOSE
  printf("Processing top-left matrix\n");
#endif
  //process top-left matrix
#ifdef HW
  //int kernel_time = 0;
  for( int i = 1 ; i <= block_width ; i++){
    dimGrid.x = i;
    dimGrid.y = 1;

    XFcuda_SetI(&xcore, i);
    XFcuda_SetGriddim_x(&xcore, dimGrid.x);
    XFcuda_SetGriddim_y(&xcore, dimGrid.y);
    //XFcuda_SetGriddim_z(&xcore, dimGrid.z);

    XFcuda_SetEn_fcuda1(&xcore, 1);
    XFcuda_SetEn_fcuda2(&xcore, 0);

    Xil_DCacheDisable();
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));
    Xil_DCacheEnable();
  }
#else
  for(int i = 0 ; i < max_cols-2 ; i++) {
    for(int idx = 0 ; idx <= i ; idx++){
      index = (idx + 1) * max_cols + (i + 1 - idx);
      matrix_cuda[index]= maximum(matrix_cuda[index-1-max_cols]+ referrence[index],
          matrix_cuda[index-1] - penalty,
          matrix_cuda[index-max_cols]  - penalty);
    }
  }
#endif

#ifdef VERBOSE
  printf("Processing bottom-right matrix\n");
#endif

  //process bottom-right matrix
#ifdef HW
  //kernel_time = 0;
  for( int i = block_width - 1  ; i >= 1 ; i--){
    dimGrid.x = i;
    dimGrid.y = 1;

    XFcuda_SetI(&xcore, i);
    XFcuda_SetGriddim_x(&xcore, dimGrid.x);
    XFcuda_SetGriddim_y(&xcore, dimGrid.y);
    //XFcuda_SetGriddim_z(&xcore, dimGrid.z);

    Xil_DCacheDisable();
    XFcuda_SetEn_fcuda1(&xcore, 0);
    XFcuda_SetEn_fcuda2(&xcore, 1);
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));
    Xil_DCacheEnable();
  }
#else
  for( int i = max_cols - 4 ; i >= 0 ; i--){
    for(int idx = 0 ; idx <= i ; idx++){
      index =  ( max_cols - idx - 2 ) * max_cols + idx + max_cols - i - 2 ;
      matrix_cuda[index]= maximum(matrix_cuda[index-1-max_cols] + referrence[index],
          matrix_cuda[index-1] - penalty,
          matrix_cuda[index-max_cols]  - penalty);
    }
  }
#endif


  //cudaMemcpy(output_itemsets, matrix_cuda, sizeof(int) * size, cudaMemcpyDeviceToHost);
  memcpy(output_itemsets, matrix_cuda, sizeof(int)*size);

#ifdef TRACEBACK

  //FILE *fpo = fopen("result/fcuda_result.txt","w");
  //fprintf(fpo, "print traceback value GPU:\n");
  /*
     FILE *gold_fp = fopen("cuda/gold_output.txt", "r");
     if (gold_fp == NULL) {
     printf("Cannot open gold file.\n");
     exit(1);
     }
     */
  //int *output = (int*)malloc(2 * max_rows * sizeof(int));
  int gold_output_itemsets_val, gold_traceback_val, passed;
  passed = 1;
  int count = 0;
  for (int i = max_rows - 2,  j = max_rows - 2; i>=0, j>=0;){
    int nw, n, w, traceback;
    if ( i == max_rows - 2 && j == max_rows - 2 ) {
      //fprintf(fpo, "%d ", output_itemsets[ i * max_cols + j]); //print the first element
      //fscanf(gold_fp, "%d", &gold_output_itemsets_val);

      //output[count] = output_itemsets[i * max_cols + j];
      //count++;
      ///*
      gold_output_itemsets_val = gold_output[count];
      count++;
      if (output_itemsets[i * max_cols + j] != gold_output_itemsets_val) {
        printf("mismatch output_itemsets at %d: gold = %d, calc = %d\n",
            i, gold_output_itemsets_val, output_itemsets[i * max_cols + j]);
        passed = 0;
        break;
      }
      //*/
    }
    if ( i == 0 && j == 0 )
      break;
    if ( i > 0 && j > 0 ){
      nw = output_itemsets[(i - 1) * max_cols + j - 1];
      w  = output_itemsets[ i * max_cols + j - 1 ];
      n  = output_itemsets[(i - 1) * max_cols + j];
    }
    else if ( i == 0 ){
      nw = n = LIMIT;
      w  = output_itemsets[ i * max_cols + j - 1 ];
    }
    else if ( j == 0 ){
      nw = w = LIMIT;
      n  = output_itemsets[(i - 1) * max_cols + j];
    }
    else{
    }

    //traceback = maximum(nw, w, n);
    int new_nw, new_w, new_n;
    new_nw = nw + referrence[i * max_cols + j];
    new_w = w - penalty;
    new_n = n - penalty;

    traceback = maximum(new_nw, new_w, new_n);
    if(traceback == new_nw)
      traceback = nw;
    if(traceback == new_w)
      traceback = w;
    if(traceback == new_n)
      traceback = n;

    //output[count] = traceback;
    //count++;
    //fprintf(fpo, "%d ", traceback);
    //fscanf(gold_fp, "%d", &gold_traceback_val);
    ///*
    gold_traceback_val = gold_output[count];
    count++;
    if (gold_traceback_val != traceback) {
      printf("mismatch traceback at %d: gold = %d, calc = %d\n",
          i, gold_traceback_val, traceback);
      passed = 0;
      break;
    }
    //*/
    if(traceback == nw )
    {i--; j--; continue;}

    else if(traceback == w )
    {j--; continue;}

    else if(traceback == n )
    {i--; continue;}

    else
      ;
  }

  //fclose(fpo);
  //fclose(gold_fp);
  /*
     printf("%d\n", count);
     for (int i = 0; i < count; i++)
     printf("%d,\n", output[i]);
     free(output);
     */

  if (passed)
    printf("PASSED.\n");
  else
    printf("FAILED.\n");
#endif

  /*cudaFree(referrence_cuda);
    cudaFree(matrix_cuda);
    cudaFree(matrix_cuda_out);*/
  free(referrence_cuda);
  free(matrix_cuda);
  free(matrix_cuda_out);
  free(referrence);
  free(input_itemsets);
  free(output_itemsets);
}

