#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <string.h>
#include <fcuda.h>
#include "power_512.h"
#include "temp_512.h"
#include "platform.h"
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

#define EPSILON 0.001
#define BLOCK_SIZE 16
#define STR_SIZE 256

/* maximum power density possible (say 300W for a 10mm x 10mm chip) */
#define MAX_PD	(3.0e6)
/* required precision in degrees */
#define PRECISION 0.001
#define SPEC_HEAT_SI 1.75e6
#define K_SI 100
/* capacitance fitting factor */
#define FACTOR_CHIP 0.5

/* chip parameters */
float t_chip = 0.0005;
float chip_height = 0.016;
float chip_width = 0.016;
/* ambient temperature, assuming no package at all */
float amb_temp = 80.0;

void calculate_temp(int , float *, float *, float *,
    int, int, int, int, float, float, float, float, float, float, dim3, dim3, int, int);

int run(int argc, char** argv);

/* define timer macros */
#define pin_stats_reset()   startCycle()
#define pin_stats_pause(cycles)   stopCycle(cycles)
#define pin_stats_dump(cycles)    printf("timer: %Lu\n", cycles)

#define IN_RANGE(x, min, max)   ((x)>=(min) && (x)<=(max))
#define CLAMP_RANGE(x, min, max) x = (x<(min)) ? min : ((x>(max)) ? max : x )
#define MIN(a, b) ((a)<=(b) ? (a) : (b))

void fatal(char *s)
{
  fprintf(stderr, "error: %s\n", s);

}

void writeoutput(float *vect, int grid_rows, int grid_cols, char *file){

  int i,j, index=0;
  FILE *fp;
  char str[STR_SIZE];

  if( (fp = fopen(file, "w" )) == 0 )
    printf( "The file was not opened\n" );


  for (i=0; i < grid_rows; i++)
    for (j=0; j < grid_cols; j++)
    {
      sprintf(str, "%d\t%g\n", index, vect[i*grid_cols+j]);
      fputs(str,fp);
      index++;
    }
  fclose(fp);
}

int test_output(float *vect, int grid_rows, int grid_cols, char *file) {
  int i,j, index=0;
  FILE *fp;
  char str[STR_SIZE];
  int gold_index;
  float gold_vect_value;

  if( (fp = fopen(file, "r" )) == 0 )
    printf( "The file was not opened\n" );


  for (i=0; i < grid_rows; i++)
    for (j=0; j < grid_cols; j++)
    {
      fgets(str, STR_SIZE, fp);
      if (feof(fp)) {
        printf("not enough lines in file");
        return 0;
      }
      sscanf(str, "%d\t%g\n", &gold_index, &gold_vect_value);
      if (!(gold_index == index && 
            (gold_vect_value - vect[i * grid_cols + j] >= -EPSILON &&
             gold_vect_value - vect[i * grid_cols + j] <= EPSILON))) {
        return 0;
      }
      index++;
    }
  fclose(fp);
  return 1;
}

int compare_output(float *sw, float *hw, int grid_rows, int grid_cols) {

  int i, j;

  for (i=0; i < grid_rows; i++)
    for (j=0; j < grid_cols; j++)
    {
      if ((sw[i * grid_cols + j] - hw[i * grid_cols + j] < -EPSILON ||
            sw[i * grid_cols + j] - hw[i * grid_cols + j] > EPSILON)) {
        printf("%d %d %f %f\n", i, j, sw[i * grid_cols + j], hw[i * grid_cols + j]);
        return 0;
      }
    }
  return 1;
}

void readinput(float *vect, int grid_rows, int grid_cols, char *file)
{
  int i,j;
  FILE *fp;
  char str[STR_SIZE];
  float val;

  if( (fp  = fopen(file, "r" )) ==0 )
    printf( "The file was not opened\n" );


  for (i=0; i <= grid_rows-1; i++)
    for (j=0; j <= grid_cols-1; j++)
    {
      fgets(str, STR_SIZE, fp);
      if (feof(fp))
        fatal("not enough lines in file");
      //if ((sscanf(str, "%d%f", &index, &val) != 2) || (index != ((i-1)*(grid_cols-2)+j-1)))
      if ((sscanf(str, "%f", &val) != 1))
        fatal("invalid file format");
      vect[i*grid_cols+j] = val;
    }
  fclose(fp);
}


/*
   compute N time steps
   */

int compute_tran_temp_hw(float *MatrixPower,float *MatrixTemp[2], int col, int row, \
    int total_iterations, int num_iterations, int blockCols, int blockRows, int borderCols, int borderRows)
{
  int i;
  int Status;
  XFcuda xcore;

  Status = XFcuda_Initialize(&xcore, 0);
  if (Status != XST_SUCCESS) {
    xil_printf("Initialization failed %d\r\n", 0);
    return XST_FAILURE;
  }

  //dim3 dimBlock(BLOCK_SIZE, BLOCK_SIZE);
  dim3 dimBlock;
  dimBlock.x = BLOCK_SIZE;
  dimBlock.y = BLOCK_SIZE;
  dimBlock.z = 1;
  //dim3 dimGrid(blockCols, blockRows);
  dim3 dimGrid;
  dimGrid.x = blockCols;
  dimGrid.y = blockRows;
  dimGrid.z = 1;

  float grid_height = chip_height / row;
  float grid_width = chip_width / col;

  float Cap = FACTOR_CHIP * SPEC_HEAT_SI * t_chip * grid_width * grid_height;
  float Rx = grid_width / (2.0 * K_SI * t_chip * grid_height);
  float Ry = grid_height / (2.0 * K_SI * t_chip * grid_width);
  float Rz = t_chip / (K_SI * grid_height * grid_width);

  float max_slope = MAX_PD / (FACTOR_CHIP * t_chip * SPEC_HEAT_SI);
  float step = PRECISION / max_slope;
  int t;
  float time_elapsed;
  time_elapsed=0.001;
  XFcuda_SetGrid_cols(&xcore, col);
  XFcuda_SetGrid_rows(&xcore, row);
  XFcuda_SetBorder_cols(&xcore, borderCols);
  XFcuda_SetBorder_rows(&xcore, borderRows);
  XFcuda_SetCap(&xcore, Cap);
  XFcuda_SetRx(&xcore, Rx);
  XFcuda_SetRy(&xcore, Ry);
  XFcuda_SetRz(&xcore, Rz);
  XFcuda_SetStep(&xcore, step);
  //XFcuda_SetTime_elapsed(&xcore, time_elapsed);
  XFcuda_SetGriddim_x(&xcore, dimGrid.x);
  XFcuda_SetGriddim_y(&xcore, dimGrid.y);
  //XFcuda_SetGriddim_z(&xcore, dimGrid.z);
  XFcuda_SetBlockdim_x(&xcore, dimBlock.x);
  XFcuda_SetBlockdim_y(&xcore, dimBlock.y);
  //XFcuda_SetBlockdim_z(&xcore, dimBlock.z);
  XFcuda_SetPower_addr(&xcore, (int)MatrixPower / sizeof(float));
  int src = 1, dst = 0;
  for (t = 0; t < total_iterations; t+=num_iterations) {
    XFcuda_SetIteration(&xcore, MIN(num_iterations, total_iterations-t));

    Xil_DCacheDisable();

    int temp = src;
    src = dst;
    dst = temp;
    XFcuda_SetTemp_src_addr(&xcore, (int)MatrixTemp[src] / sizeof(float));
    XFcuda_SetTemp_dst_addr(&xcore, (int)MatrixTemp[dst] / sizeof(float));
    XFcuda_SetEn_fcuda1(&xcore, 1);
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));
    Xil_DCacheEnable();
  }
  return dst;
}

int compute_tran_temp_sw(float *MatrixPower,float *MatrixTemp[2], int col, int row, \
    int total_iterations, int num_iterations, int blockCols, int blockRows, int borderCols, int borderRows)
{
  //dim3 dimBlock(BLOCK_SIZE, BLOCK_SIZE);
  dim3 dimBlock;
  dimBlock.x = BLOCK_SIZE;
  dimBlock.y = BLOCK_SIZE;
  dimBlock.z = 1;
  //dim3 dimGrid(blockCols, blockRows);
  dim3 dimGrid;
  dimGrid.x = blockCols;
  dimGrid.y = blockRows;
  dimGrid.z = 1;

  float grid_height = chip_height / row;
  float grid_width = chip_width / col;

  float Cap = FACTOR_CHIP * SPEC_HEAT_SI * t_chip * grid_width * grid_height;
  float Rx = grid_width / (2.0 * K_SI * t_chip * grid_height);
  float Ry = grid_height / (2.0 * K_SI * t_chip * grid_width);
  float Rz = t_chip / (K_SI * grid_height * grid_width);

  float max_slope = MAX_PD / (FACTOR_CHIP * t_chip * SPEC_HEAT_SI);
  float step = PRECISION / max_slope;
  int t;
  float time_elapsed;
  time_elapsed=0.001;
  int src = 1, dst = 0;
  for (t = 0; t < total_iterations; t+=num_iterations) {
    int temp = src;
    src = dst;
    dst = temp;
    calculate_temp(MIN(num_iterations, total_iterations-t), MatrixPower,MatrixTemp[src],\
        MatrixTemp[dst], col,row,borderCols, borderRows, Cap,Rx,Ry,Rz,step,time_elapsed, dimGrid, dimBlock, 1, 0);
  }
  return dst;
}

void usage(int argc, char **argv)
{
  fprintf(stderr, "Usage: %s <grid_rows/grid_cols> <pyramid_height> <sim_time> <temp_file> <power_file> <output_file>\n", argv[0]);
  fprintf(stderr, "\t<grid_rows/grid_cols>  - number of rows/cols in the grid (positive integer)\n");
  fprintf(stderr, "\t<pyramid_height> - pyramid heigh(positive integer)\n");
  fprintf(stderr, "\t<sim_time>   - number of iterations\n");
  fprintf(stderr, "\t<temp_file>  - name of the file containing the initial temperature values of each cell\n");
  fprintf(stderr, "\t<power_file> - name of the file containing the dissipated power values of each cell\n");
  fprintf(stderr, "\t<output_file> - name of the output file\n");
  exit(1);
}

int main(int argc, char** argv)
{
  printf("Start ...\n");
  init_timer(timer_ctrl, timer_counter_l, timer_counter_h);
  start_timer(timer_ctrl);
  run(argc,argv);
  stop_timer(timer_ctrl);
  printf("Execution time %lld us\n\r", elapsed_time());
}

int run(int argc, char** argv)
{
  int i, size;
  int grid_rows,grid_cols;
  //float *FilesavingTemp,*FilesavingPower,*MatrixOut;
  //char *tfile, *pfile, *ofile;

  int total_iterations = 60;
  int pyramid_height = 1; // number of iterations
  /*
     if (argc != 7)
     usage(argc, argv);
     if((grid_rows = atoi(argv[1]))<=0||
     (grid_cols = atoi(argv[1]))<=0||
     (pyramid_height = atoi(argv[2]))<=0||
     (total_iterations = atoi(argv[3]))<=0)
     usage(argc, argv);

     tfile=argv[4];
     pfile=argv[5];
     ofile=argv[6];
     */
  grid_rows = 512;
  grid_cols = 512;
  pyramid_height = 2;
  total_iterations = 2;
  size=grid_rows*grid_cols;

  /* --------------- pyramid parameters --------------- */
# define EXPAND_RATE 2// add one iteration will extend the pyramid base by 2 per each borderline
  int borderCols = (pyramid_height)*EXPAND_RATE/2;
  int borderRows = (pyramid_height)*EXPAND_RATE/2;
  int smallBlockCol = BLOCK_SIZE-(pyramid_height)*EXPAND_RATE;
  int smallBlockRow = BLOCK_SIZE-(pyramid_height)*EXPAND_RATE;
  int blockCols = grid_cols/smallBlockCol+((grid_cols%smallBlockCol==0)?0:1);
  int blockRows = grid_rows/smallBlockRow+((grid_rows%smallBlockRow==0)?0:1);

  //FilesavingTemp = (float *) malloc(size*sizeof(float));
  //FilesavingPower = (float *) malloc(size*sizeof(float));
  //float *MatrixOut = 0x10000000; //(float *) calloc (size, sizeof(float));

  //if( !FilesavingPower || !FilesavingTemp || !MatrixOut)
  //fatal("unable to allocate memory");

#ifdef VERBOSE
  printf("pyramidHeight: %d\ngridSize: [%d, %d]\nborder:[%d, %d]\nblockGrid:[%d, %d]\ntargetBlock:[%d, %d]\n",\
      pyramid_height, grid_cols, grid_rows, borderCols, borderRows, blockCols, blockRows, smallBlockCol, smallBlockRow);
#endif
  //readinput(FilesavingTemp, grid_rows, grid_cols, tfile);
  //readinput(FilesavingPower, grid_rows, grid_cols, pfile);

  float *MatrixTemp_sw[2], *MatrixTemp_hw[2], *MatrixPower;
  MatrixTemp_hw[0] = (float*)malloc(size*sizeof(float));
  MatrixTemp_sw[0] = (float*)malloc(size*sizeof(float));
  MatrixTemp_hw[1] = (float*)malloc(size*sizeof(float));
  MatrixTemp_sw[1] = (float*)malloc(size*sizeof(float));
  memcpy(MatrixTemp_hw[0], temp_input, sizeof(float)*size);
  memset(MatrixTemp_hw[1], 0, sizeof(float)*size);
  memcpy(MatrixTemp_sw[0], temp_input, sizeof(float)*size);
  memset(MatrixTemp_sw[1], 0, sizeof(float)*size);
  MatrixPower = (float*)malloc(size*sizeof(float));
  memcpy(MatrixPower, power_input, sizeof(float)*size);
#ifdef VERBOSE
  printf("Start computing the transient temperature\n");
#endif

#ifdef SW
  int ret = compute_tran_temp_sw(MatrixPower,MatrixTemp_sw,grid_cols,grid_rows, \
      total_iterations,pyramid_height, blockCols, blockRows, borderCols, borderRows);
#endif

#ifdef HW
  int ret1 = compute_tran_temp_hw(MatrixPower,MatrixTemp_hw,grid_cols,grid_rows, \
      total_iterations,pyramid_height, blockCols, blockRows, borderCols, borderRows);
#endif

#ifdef VERBOSE
  printf("Ending simulation\n");
#endif
  //memcpy(MatrixOut, MatrixTemp[ret], sizeof(float)*size);
  //writeoutput(MatrixOut,grid_rows, grid_cols, ofile);

#ifdef HW && SW && VERIFY
  int passed = compare_output(MatrixTemp_sw[ret], MatrixTemp_hw[ret1], grid_rows, grid_cols);
  for (i = 0; i < 10; i++)
    printf("index %d: sw = %f vs hw = %f\n", i, MatrixTemp_sw[ret][i], MatrixTemp_hw[ret1][i]);

  if (passed) {
    printf("PASSED.\n");
    return 0;
  } else {
    printf("FAILED.\n");
    return 1;
  }
#endif

  free(MatrixPower);
  free(MatrixTemp_hw[0]);
  free(MatrixTemp_hw[1]);
  free(MatrixTemp_sw[0]);
  free(MatrixTemp_sw[1]);
}
