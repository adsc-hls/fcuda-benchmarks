#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <fcuda.h>
#include <string.h>
#include "xil_cache.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "hardware_timer.h"
#include "xfcuda.h"
#define HW
#define SW
#define VERIFY
#define VERBOSE

#define BLOCK_SIZE 256
#define STR_SIZE 256
#define DEVICE 0
#define HALO 1 // halo width along one direction when advancing to the next iteration
//#define BENCH_PRINT

void dynproc_kernel(
    int iteration,
    int *gpuWall,
    int *gpuSrc,
    int *gpuResults,
    int cols,
    int rows,
    int startStep,
    int border,
    dim3 dimGrid,
    dim3 dimBlock,
    int num_cores, int core_id
    );

int run(int argc, char** argv);

int rows, cols;
int* data;
int** wall;
int* result;
#define M_SEED 9
int pyramid_height;
  void
init(int argc, char** argv)
{
  /*
     if(argc==4)
     {
     cols = atoi(argv[1]);
     rows = atoi(argv[2]);
     pyramid_height=atoi(argv[3]);
     } else {
     printf("Usage: dynproc row_len col_len pyramid_height\n");
     exit(0);
     }
     */
  cols = 100000;
  rows = 100;
  pyramid_height = 20;

  data = (int*)malloc(rows * cols * sizeof(int)); //new int[rows*cols];
  wall = (int**)malloc(rows * sizeof(int*)); //new int*[rows];
  for(int n=0; n<rows; n++)
    wall[n]=data+cols*n;
  result = (int*)malloc(cols * sizeof(int)); //new int[cols];
  int seed = M_SEED;
  srand(seed);

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      wall[i][j] = rand() % 10;
    }
  }

#ifdef BENCH_PRINT
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      printf("%d ",wall[i][j]);
    }
    printf("\n") ;
  }
#endif

}

int test_output(int *result, int rows, int cols, char *gold_file) {
  int i, j;
  FILE *fp;
  if ((fp = fopen(gold_file, "r")) == 0) {
    printf("Unable to open the file %s.\n", gold_file);
    return 0;
  }

  int gold_wall_val;
  for (i = 0; i < rows; i++) {
    for (j = 0; j < cols; j++) {
      fscanf(fp, "%d", &gold_wall_val);
      if (gold_wall_val != wall[i][j]) {
        printf("The init wall value mismatched.\n");
        return 0;
      }
    }
  }
  int gold_data_val;
  for (i = 0; i < cols; i++) {
    fscanf(fp, "%d", &gold_data_val);
    if (gold_data_val != data[i]) {
      printf("The init data value mismatched.\n");
      return 0;
    }
  }
  int gold_result_val;
  for (i = 0; i < cols; i++) {
    fscanf(fp, "%d", &gold_result_val);
    if (gold_result_val != result[i]) {
      printf("Result mismatched.\n");
      return 0;
    }
  }
  fclose(fp);
  return 1;
}

int compare_output(int *gpu_sw, int *gpu_hw, int cols) {

  int i;

  for (i = 0; i < cols; i++) {
    if (gpu_sw[i] != gpu_hw[i]) {
      printf("Result mismatched at index %d: sw = %d, hw = %d.\n",
          i, gpu_sw[i], gpu_hw[i]);
      return 0;
    }
  }
  return 1;
}

void fatal(char *s)
{
  fprintf(stderr, "error: %s\n", s);

}

#define IN_RANGE(x, min, max)   ((x)>=(min) && (x)<=(max))
#define CLAMP_RANGE(x, min, max) x = (x<(min)) ? min : ((x>(max)) ? max : x )
#define MIN(a, b) ((a)<=(b) ? (a) : (b))

/*
   compute N time steps
   */
int calc_path_sw(int *gpuWall, int *gpuResult[2], int rows, int cols, \
    int pyramid_height, int blockCols, int borderCols)
{
  dim3 dimBlock(BLOCK_SIZE);
  dim3 dimGrid(blockCols);

  int src = 1, dst = 0;
  for (int t = 0; t < rows-1; t+=pyramid_height) {
    int temp = src;
    src = dst;
    dst = temp;
    dynproc_kernel(MIN(pyramid_height, rows-t-1), gpuWall, gpuResult[src], gpuResult[dst],
        cols, rows, t, borderCols, dimGrid, dimBlock, 1, 0);
  }
  return dst;
}

int calc_path_hw(int *gpuWall, int *gpuResult[2], int rows, int cols, \
    int pyramid_height, int blockCols, int borderCols)
{
  int i;
  int Status;
  XFcuda xcore;
  Status = XFcuda_Initialize(&xcore, 0);
  if (Status != XST_SUCCESS) {
    printf("Initialization failed %d\n", 0);
    return 1;
  }

  dim3 dimBlock; //(BLOCK_SIZE);
  dimBlock.x = BLOCK_SIZE;
  dimBlock.y = 1;
  dimBlock.z = 1;
  dim3 dimGrid; //(blockCols);
  dimGrid.x = blockCols;
  dimGrid.y = 1;
  dimGrid.z = 1;

  XFcuda_SetCols(&xcore, cols);
  //XFcuda_SetRows(&xcore, rows);
  XFcuda_SetBorder(&xcore, borderCols);
  XFcuda_SetGriddim_x(&xcore, dimGrid.x);
  XFcuda_SetGriddim_y(&xcore, dimGrid.y);
  //XFcuda_SetGriddim_z(&xcore, dimGrid.z);
  XFcuda_SetBlockdim_x(&xcore, dimBlock.x);
  //XFcuda_SetBlockdim_y(&xcore, dimBlock.y);
  //XFcuda_SetBlockdim_z(&xcore, dimBlock.z);
  XFcuda_SetGpuwall_addr(&xcore, (int)gpuWall / sizeof(int));

  int done;
  int src = 1, dst = 0;
  for (int t = 0; t < rows-1; t+=pyramid_height) {
    XFcuda_SetIteration(&xcore, MIN(pyramid_height, rows-t-1));
    XFcuda_SetStartstep(&xcore, t);
    int temp = src;
    src = dst;
    dst = temp;
    XFcuda_SetGpusrc_addr(&xcore, (int)gpuResult[src] / sizeof(int));
    XFcuda_SetGpuresults_addr(&xcore, (int)gpuResult[dst] / sizeof(int));
    XFcuda_SetEn_fcuda1(&xcore, 1);
    Xil_DCacheFlush();
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));
    Xil_DCacheFlush();
  }
  return dst;
}

int main(int argc, char** argv)
{
  printf("Starting ...\n");
  //int num_devices;
  init_timer(timer_ctrl, timer_counter_l, timer_counter_h);
  start_timer(timer_ctrl);
  run(argc,argv);
  stop_timer(timer_ctrl);
  printf("Execution time %lld us\n\r", elapsed_time());
}

int run(int argc, char** argv)
{
  init(argc, argv);

  /* --------------- pyramid parameters --------------- */
  int borderCols = (pyramid_height)*HALO;
  int smallBlockCol = BLOCK_SIZE-(pyramid_height)*HALO*2;
  int blockCols = cols/smallBlockCol+((cols%smallBlockCol==0)?0:1);

#ifdef VERBOSE
  printf("pyramidHeight: %d\ngridSize: [%d]\nborder:[%d]\nblockSize: %d\nblockGrid:[%d]\ntargetBlock:[%d]\n",\
      pyramid_height, cols, borderCols, BLOCK_SIZE, blockCols, smallBlockCol);
#endif

  int *gpuWall, *gpuResult_sw[2], *gpuResult_hw[2];
  int size = rows*cols;

  gpuResult_sw[0] = (int*)malloc(sizeof(int)*cols);
  gpuResult_hw[0] = (int*)malloc(sizeof(int)*cols);
  gpuResult_sw[1] = (int*)malloc(sizeof(int)*cols);
  gpuResult_hw[1] = (int*)malloc(sizeof(int)*cols);;
  memcpy(gpuResult_sw[0], data, sizeof(int)*cols);
  memcpy(gpuResult_hw[0], data, sizeof(int)*cols);
  gpuWall = (int*)malloc(sizeof(int)*(size-cols));
  memcpy(gpuWall, data+cols, sizeof(int)*(size-cols));
#ifdef SW
  int final_ret_sw = calc_path_sw(gpuWall, gpuResult_sw, rows, cols, \
      pyramid_height, blockCols, borderCols);
#endif

#ifdef HW
  int final_ret_hw = calc_path_hw(gpuWall, gpuResult_hw, rows, cols, \
      pyramid_height, blockCols, borderCols);
#endif

#ifdef BENCH_PRINT
  for (int i = 0; i < cols; i++)
    printf("%d ",data[i]);
  printf("\n");
  for (int i = 0; i < cols; i++)
    printf("%d ",result[i]);
  printf("\n");
#endif

#ifdef HW && SW && VERIFY
  int passed = compare_output(gpuResult_sw[final_ret_sw], gpuResult_hw[final_ret_hw], cols);
  if (passed) {
    printf("PASSED.\n");
    return 0;
  } else {
    printf("FAILED.\n");
    return 1;
  }
#endif
  free(gpuWall);
  free(gpuResult_sw[0]);
  free(gpuResult_sw[1]);
  free(gpuResult_hw[0]);
  free(gpuResult_hw[1]);
  delete [] data;
  delete [] wall;
  delete [] result;
}
