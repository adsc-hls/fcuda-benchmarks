#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <fcuda.h>
#include <string.h>
#include <pathfinder.h>

#define BLOCK_SIZE 256
#define STR_SIZE 256
#define DEVICE 0
#define HALO 1 // halo width along one direction when advancing to the next iteration
//#define BENCH_PRINT

#ifdef NOC
void dynproc_kernel_core_wrapper(int iteration, int cols, int rows, int startStep, int border, DATATYPE *memport, dim3 grid, dim3 threads);
#endif

void dynproc_kernel(
    int iteration,
    DATATYPE *gpuWall,
    DATATYPE *gpuSrc,
    DATATYPE *gpuResults,
    int cols,
    int rows,
    int startStep,
    int border,
    dim3 dimGrid,
    dim3 dimBlock,
    int num_cores,  int core_id
    );

int run(int argc, char** argv);

int rows, cols;
DATATYPE* data;
DATATYPE** wall;
DATATYPE* result;
#define M_SEED 9
int pyramid_height;
  void
init(int argc, char** argv)
{
  if(argc==4)
  {
    cols = atoi(argv[1]);
    rows = atoi(argv[2]);
    pyramid_height=atoi(argv[3]);
  } else {
    printf("Usage: dynproc row_len col_len pyramid_height\n");
    exit(0);
  }

  data = new DATATYPE[rows*cols];
  wall = new DATATYPE*[rows];
  for(int n=0; n<rows; n++)
    wall[n]=data+cols*n;
  result = new DATATYPE[cols];
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

int test_output(DATATYPE *result, int rows, int cols, char *gold_file) {
  int i, j;
  FILE *fp;
  if ((fp = fopen(gold_file, "r")) == 0) {
    printf("Unable to open the file %s.\n", gold_file);
    return 0;
  }

  DATATYPE gold_wall_val;
  for (i = 0; i < rows; i++) {
    for (j = 0; j < cols; j++) {
      if (sizeof(DATATYPE) == 4)
        fscanf(fp, "%d", &gold_wall_val);
      else if (sizeof(DATATYPE) == 2)
        fscanf(fp, "%hd", &gold_wall_val);
      if (gold_wall_val != wall[i][j]) {
        printf("The init wall value mismatched.\n");
        return 0;
      }
    }
  }
  DATATYPE gold_data_val;
  for (i = 0; i < cols; i++) {
    if (sizeof(DATATYPE) == 4)
      fscanf(fp, "%d", &gold_data_val);
    else if (sizeof(DATATYPE) == 2)
      fscanf(fp, "%hd", &gold_data_val);
    if (gold_data_val != data[i]) {
      printf("The init data value mismatched.\n");
      return 0;
    }
  }
  DATATYPE gold_result_val;
  for (i = 0; i < cols; i++) {
    if (sizeof(DATATYPE) == 4)
      fscanf(fp, "%d", &gold_result_val);
    else if (sizeof(DATATYPE) == 2)
      fscanf(fp, "%hd", &gold_result_val);
    if (gold_result_val != result[i]) {
      if (sizeof(DATATYPE) == 4)
        printf("Result mismatched at %d: gold = %d, calc = %d.\n",
            i, gold_result_val, result[i]);
      else if (sizeof(DATATYPE) == 2)
        printf("Result mismatched at %hd: gold = %hd, calc = %hd.\n",
            i, gold_result_val, result[i]);

      return 0;
    }
  }
  fclose(fp);
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
   __global__ void dynproc_kernel(
   int iteration,
   int *gpuWall,
   int *gpuSrc,
   int *gpuResults,
   int cols,
   int rows,
   int startStep,
   int border)
   {

   __shared__ int prev[BLOCK_SIZE];
   __shared__ int result[BLOCK_SIZE];

   int bx = blockIdx.x;
   int tx=threadIdx.x;

// each block finally computes result for a small block
// after N iterations.
// it is the non-overlapping small blocks that cover
// all the input data

// calculate the small block size
int small_block_cols = BLOCK_SIZE-iteration*HALO*2;

// calculate the boundary for the block according to
// the boundary of its small block
int blkX = small_block_cols*bx-border;
int blkXmax = blkX+BLOCK_SIZE-1;

// calculate the global thread coordination
int xidx = blkX+tx;

// effective range within this block that falls within
// the valid range of the input data
// used to rule out computation outside the boundary.
int validXmin = (blkX < 0) ? -blkX : 0;
int validXmax = (blkXmax > cols-1) ? BLOCK_SIZE-1-(blkXmax-cols+1) : BLOCK_SIZE-1;

int W = tx-1;
int E = tx+1;

W = (W < validXmin) ? validXmin : W;
E = (E > validXmax) ? validXmax : E;

bool isValid = IN_RANGE(tx, validXmin, validXmax);

if(IN_RANGE(xidx, 0, cols-1)){
prev[tx] = gpuSrc[xidx];
}
__syncthreads(); // [Ronny] Added sync to avoid race on prev Aug. 14 2012
bool computed;
for (int i=0; i<iteration ; i++){
computed = false;
if( IN_RANGE(tx, i+1, BLOCK_SIZE-i-2) &&  \
isValid){
computed = true;
int left = prev[W];
int up = prev[tx];
int right = prev[E];
int shortest = MIN(left, up);
shortest = MIN(shortest, right);
int index = cols*(startStep+i)+xidx;
result[tx] = shortest + gpuWall[index];

}
__syncthreads();
if(i==iteration-1)
break;
if(computed)	 //Assign the computation range
prev[tx]= result[tx];
__syncthreads(); // [Ronny] Added sync to avoid race on prev Aug. 14 2012
}

// update the global memory
// after the last iteration, only threads coordinated within the
// small block perform the calculation and switch on ``computed''
if (computed){
  gpuResults[xidx]=result[tx];
}
}
*/
/*
   compute N time steps
   */
int calc_path(DATATYPE *gpuWall, DATATYPE *gpuResult[2], int rows, int cols, \
    int pyramid_height, int blockCols, int borderCols)
{
  dim3 dimBlock(BLOCK_SIZE);
  dim3 dimGrid(blockCols);

  int size = rows * cols;

  int src = 1, dst = 0;

#ifdef NOC
  DATATYPE *memport = (DATATYPE*)malloc(sizeof(DATATYPE) * ((size - cols) + cols + cols));
  memcpy(memport, gpuWall, sizeof(DATATYPE) * (size - cols));
#endif

  for (int t = 0; t < rows-1; t+=pyramid_height) {
    int temp = src;
    src = dst;
    dst = temp;
    dynproc_kernel(MIN(pyramid_height, rows-t-1), gpuWall, gpuResult[src], gpuResult[dst],
        cols, rows, t, borderCols, dimGrid, dimBlock, 1, 0);
  }
  return dst;
}

int main(int argc, char** argv)
{
  int num_devices;
  return run(argc,argv);
}

int run(int argc, char** argv)
{
  init(argc, argv);

  /* --------------- pyramid parameters --------------- */
  int borderCols = (pyramid_height)*HALO;
  int smallBlockCol = BLOCK_SIZE-(pyramid_height)*HALO*2;
  int blockCols = cols/smallBlockCol+((cols%smallBlockCol==0)?0:1);

  printf("pyramidHeight: %d\ngridSize: [%d]\nborder:[%d]\nblockSize: %d\nblockGrid:[%d]\ntargetBlock:[%d]\n",\
      pyramid_height, cols, borderCols, BLOCK_SIZE, blockCols, smallBlockCol);

  DATATYPE *gpuWall, *gpuResult[2];
  int size = rows*cols;

  gpuResult[0] = (DATATYPE*)malloc(sizeof(DATATYPE)*cols);
  gpuResult[1] = (DATATYPE*)malloc(sizeof(DATATYPE)*cols);
  memcpy(gpuResult[0], data, sizeof(DATATYPE)*cols);
  gpuWall = (DATATYPE*)malloc(sizeof(DATATYPE)*(size-cols));
  memcpy(gpuWall, data+cols, sizeof(DATATYPE)*(size-cols));
  int final_ret = calc_path(gpuWall, gpuResult, rows, cols, \
      pyramid_height, blockCols, borderCols);

  memcpy(result, gpuResult[final_ret], sizeof(DATATYPE)*cols);

#ifdef BENCH_PRINT
  for (int i = 0; i < cols; i++)
    printf("%d ",data[i]);
  printf("\n");
  for (int i = 0; i < cols; i++)
    printf("%d ",result[i]);
  printf("\n");
#endif
  int passed = test_output(result, rows, cols, "cuda/gold_output.txt");
  free(gpuWall);
  free(gpuResult[0]);
  free(gpuResult[1]);
  delete [] data;
  delete [] wall;
  delete [] result;

  if (passed) {
    printf("PASSED.\n");
    return 0;
  } else {
    printf("FAILED.\n");
    return 1;
  }
}
