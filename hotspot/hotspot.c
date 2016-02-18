#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <string.h>
#include <fcuda.h>
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

#ifdef NOC
void calculate_temp_core_wrapper(int iteration, int grid_cols, int grid_rows, int border_cols, int border_rows, float Cap, float Rx, float Ry, float Rz, float step, float time_elapsed, float * memport, dim3 grid, dim3 threads);
#endif

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

int compute_tran_temp(float *MatrixPower,float *MatrixTemp[2], int col, int row, \
    int total_iterations, int num_iterations, int blockCols, int blockRows, int borderCols, int borderRows)
{
  dim3 dimBlock(BLOCK_SIZE, BLOCK_SIZE);
  dim3 dimGrid(blockCols, blockRows);
  float grid_height = chip_height / row;
  float grid_width = chip_width / col;

  float Cap = FACTOR_CHIP * SPEC_HEAT_SI * t_chip * grid_width * grid_height;
  float Rx = grid_width / (2.0 * K_SI * t_chip * grid_height);
  float Ry = grid_height / (2.0 * K_SI * t_chip * grid_width);
  float Rz = t_chip / (K_SI * grid_height * grid_width);

  float max_slope = MAX_PD / (FACTOR_CHIP * t_chip * SPEC_HEAT_SI);
  float step = PRECISION / max_slope;
  float t;
  float time_elapsed;
  time_elapsed=0.001;

  int size = col * row;
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
  return run(argc,argv);

}

int run(int argc, char** argv)
{
  int size;
  int grid_rows,grid_cols;
  float *FilesavingTemp,*FilesavingPower,*MatrixOut;
  char *tfile, *pfile, *ofile;

  int total_iterations = 60;
  int pyramid_height = 1; // number of iterations

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

  size=grid_rows*grid_cols;

  /* --------------- pyramid parameters --------------- */
# define EXPAND_RATE 2// add one iteration will extend the pyramid base by 2 per each borderline
  int borderCols = (pyramid_height)*EXPAND_RATE/2;
  int borderRows = (pyramid_height)*EXPAND_RATE/2;
  int smallBlockCol = BLOCK_SIZE-(pyramid_height)*EXPAND_RATE;
  int smallBlockRow = BLOCK_SIZE-(pyramid_height)*EXPAND_RATE;
  int blockCols = grid_cols/smallBlockCol+((grid_cols%smallBlockCol==0)?0:1);
  int blockRows = grid_rows/smallBlockRow+((grid_rows%smallBlockRow==0)?0:1);

  FilesavingTemp = (float *) malloc(size*sizeof(float));
  FilesavingPower = (float *) malloc(size*sizeof(float));
  MatrixOut = (float *) calloc (size, sizeof(float));

  if( !FilesavingPower || !FilesavingTemp || !MatrixOut)
    fatal("unable to allocate memory");

  printf("pyramidHeight: %d\ngridSize: [%d, %d]\nborder:[%d, %d]\nblockGrid:[%d, %d]\ntargetBlock:[%d, %d]\n",\
      pyramid_height, grid_cols, grid_rows, borderCols, borderRows, blockCols, blockRows, smallBlockCol, smallBlockRow);

  readinput(FilesavingTemp, grid_rows, grid_cols, tfile);
  readinput(FilesavingPower, grid_rows, grid_cols, pfile);

  float *MatrixTemp[2], *MatrixPower;
  MatrixTemp[0] = (float*)malloc(size*sizeof(float));
  MatrixTemp[1] = (float*)malloc(size*sizeof(float));
  memcpy(MatrixTemp[0], FilesavingTemp, sizeof(float)*size);
  memset(MatrixTemp[1], 0, sizeof(float)*size);
  MatrixPower = (float*)malloc(size*sizeof(float));
  memcpy(MatrixPower, FilesavingPower, sizeof(float)*size);
  printf("Start computing the transient temperature\n");
  int ret = compute_tran_temp(MatrixPower,MatrixTemp,grid_cols,grid_rows, \
      total_iterations,pyramid_height, blockCols, blockRows, borderCols, borderRows);
  printf("Ending simulation\n");
  memcpy(MatrixOut, MatrixTemp[ret], sizeof(float)*size);
  int passed = test_output(MatrixOut, grid_rows, grid_cols, ofile);
  free(MatrixPower);
  free(MatrixTemp[0]);
  free(MatrixTemp[1]);
  free(MatrixOut);

  if (passed) {
    printf("PASSED.\n");
    return 0;
  } else {
    printf("FAILED.\n");
    return 1;
  }
}
