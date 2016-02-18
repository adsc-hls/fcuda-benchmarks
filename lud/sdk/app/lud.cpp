/*
 * =====================================================================================
 *
 *       Filename:  lud.cu
 *
 *    Description:  The main wrapper for the suite
 *
 *        Version:  1.0
 *        Created:  10/22/2009 08:40:34 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Liang Wang (lw2aw), lw2aw@virginia.edu
 *        Company:  CS@UVa
 *
 * =====================================================================================
 */

//#include <cuda.h>
#include <fcuda.h>
#include "lud.h"
#include <stdio.h>
#include <unistd.h>
#include <getopt.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "common/common.h"

#include "xil_cache.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "hardware_timer.h"
#include "xfcuda.h"

#define HW
#define SW
#define BLOCK_SIZE 16
static int do_verify = 1;

static struct option long_options[] = {
  /* name, has_arg, flag, val */
  {"input", 1, NULL, 'i'},
  {"size", 1, NULL, 's'},
  {"verify", 0, NULL, 'v'},
  {0,0,0,0}
};

extern void
lud_cuda(double *d_m, int matrix_dim);


  int
main ( int argc, char *argv[] )
{
  init_timer(timer_ctrl, timer_counter_l, timer_counter_h);
  start_timer(timer_ctrl);

  int matrix_dim =256; /* default matrix_dim */
  int opt, option_index=0;
  func_ret_t ret;
  const char *input_file = NULL;
  double *m, *d_m, *mm;
  //stopwatch sw;

  /*
     while ((opt = getopt_long(argc, argv, "::vs:i:", 
     long_options, &option_index)) != -1 ) {
     switch(opt){
     case 'i':
     input_file = optarg;
     break;
     case 'v':
     do_verify = 1;
     break;
     case 's':
     matrix_dim = atoi(optarg);
     printf("Generate input matrix internally, size =%d\n", matrix_dim);
  // fprintf(stderr, "Currently not supported, use -i instead\n");
  // fprintf(stderr, "Usage: %s [-v] [-s matrix_size|-i input_file]\n", argv[0]);
  // exit(EXIT_FAILURE);
  break;
  case '?':
  fprintf(stderr, "invalid option\n");
  break;
  case ':':
  fprintf(stderr, "missing argument\n");
  break;
  default:
  fprintf(stderr, "Usage: %s [-v] [-s matrix_size|-i input_file]\n",
  argv[0]);
  exit(EXIT_FAILURE);
  }
  }

  if ( (optind < argc) || (optind == 1)) {
  fprintf(stderr, "Usage: %s [-v] [-s matrix_size|-i input_file]\n", argv[0]);
  exit(EXIT_FAILURE);
  }
  */
  if (input_file) {
    //printf("Reading matrix from file %s\n", input_file);
    ret = create_matrix_from_file(&m, input_file, &matrix_dim);
    if (ret != RET_SUCCESS) {
      m = NULL;
      fprintf(stderr, "error create matrix from file %s\n", input_file);
      exit(EXIT_FAILURE);
    }
  } 
  else if (matrix_dim) {
    printf("Creating matrix internally size=%d\n", matrix_dim);
    ret = create_matrix(&m, matrix_dim);
    if (ret != RET_SUCCESS) {
      m = NULL;
      fprintf(stderr, "error create matrix internally size=%d\n", matrix_dim);
      exit(EXIT_FAILURE);
    }
  }
  else {
    printf("No input file specified!\n");
    exit(EXIT_FAILURE);
  }

  if (do_verify){
    //printf("Before LUD\n");
    // print_matrix(m, matrix_dim);
    matrix_duplicate(m, &mm, matrix_dim);
  }

  //cudaMalloc((void**)&d_m, 
  //           matrix_dim*matrix_dim*sizeof(double));
  //d_m = (double*)malloc(matrix_dim*matrix_dim*sizeof(double));
  /* beginning of timing point */
  //stopwatch_start(&sw);
  //cudaMemcpy(d_m, m, matrix_dim*matrix_dim*sizeof(double), 
  //      cudaMemcpyHostToDevice);
  //memcpy(d_m, m, matrix_dim*matrix_dim*sizeof(double));
  //lud_cuda(d_m, matrix_dim);
  lud_cuda(m, matrix_dim);
  //cudaMemcpy(m, d_m, matrix_dim*matrix_dim*sizeof(double), 
  //	     cudaMemcpyDeviceToHost);
  //memcpy(m, d_m, matrix_dim*matrix_dim*sizeof(double));
  /* end of timing point */
  //stopwatch_stop(&sw);
  //printf("Time consumed(ms): %lf\n", 1000*get_interval_by_sec(&sw));

  //cudaFree(d_m);
  //free(d_m);

  double *z = (double*)malloc(matrix_dim * matrix_dim * sizeof(double));
  if (z == NULL) {
    printf("Unable to allocate mem. for z\n");
    exit(1);
  }
#ifdef SW
  if (do_verify){
    printf("After LUD\n");
    printf(">>>Verify<<<<\n");
    lud_verify(mm, m, matrix_dim);
    free(mm);
  }
#endif

  free(m);

  stop_timer(timer_ctrl);
  printf("Execution time %lld us\n\r", elapsed_time());

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


void lud_cuda(double *m, int matrix_dim)
{
  int k=0;
  int i;
  dim3 dimBlock(BLOCK_SIZE, BLOCK_SIZE);

#ifdef HW
  XFcuda xcore;
  Xint32 Status;

  Status = XFcuda_Initialize(&xcore, 0);
  if (Status != XST_SUCCESS) {
    xil_printf("Initialization failed %d\r\n", Status);
    exit(1);
  }

  XFcuda_SetMatrix_dim(&xcore, matrix_dim);
  XFcuda_SetBlockdim_x(&xcore, dimBlock.x);
  XFcuda_SetBlockdim_y(&xcore, dimBlock.y);
  //XFcuda_SetBlockdim_z(&xcore, dimBlock.z);

#endif

  //int kernel_time = 0;

  for (k=0; k < matrix_dim-BLOCK_SIZE; k += BLOCK_SIZE) {

#ifdef HW
    // Kernel 1
    XFcuda_SetOffset(&xcore, k);
    XFcuda_SetGriddim_x(&xcore, 1);
    XFcuda_SetGriddim_y(&xcore, 1);
    //XFcuda_SetGriddim_z(&xcore, 1);
    XFcuda_SetBlockdim_x(&xcore, BLOCK_SIZE);
    XFcuda_SetBlockdim_y(&xcore, 1);

    XFcuda_SetM_addr(&xcore, (int)m / sizeof(double));

    XFcuda_SetEn_fcuda1(&xcore, 1);
    XFcuda_SetEn_fcuda2(&xcore, 0);
    XFcuda_SetEn_fcuda3(&xcore, 0);

    Xil_DCacheDisable();
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));

    Xil_DCacheEnable();

    // Kernel 2
    XFcuda_SetOffset(&xcore, k);
    XFcuda_SetGriddim_x(&xcore, (matrix_dim-k)/BLOCK_SIZE-1);
    XFcuda_SetGriddim_y(&xcore, 1);
    //XFcuda_SetGriddim_z(&xcore, 1);
    XFcuda_SetBlockdim_x(&xcore, BLOCK_SIZE * 2);
    XFcuda_SetM_addr(&xcore, (int)m / sizeof(double));

    XFcuda_SetEn_fcuda1(&xcore, 0);
    XFcuda_SetEn_fcuda2(&xcore, 1);
    XFcuda_SetEn_fcuda3(&xcore, 0);

    Xil_DCacheDisable();
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));

    Xil_DCacheEnable();

    // Kernel 3
    dim3 dimGrid((matrix_dim-k)/BLOCK_SIZE-1, (matrix_dim-k)/BLOCK_SIZE-1);
    XFcuda_SetOffset(&xcore, k);
    XFcuda_SetGriddim_x(&xcore, dimGrid.x);
    XFcuda_SetGriddim_y(&xcore, dimGrid.y);
    //XFcuda_SetGriddim_z(&xcore, dimGrid.z);
    XFcuda_SetBlockdim_x(&xcore, BLOCK_SIZE);
    XFcuda_SetBlockdim_y(&xcore, BLOCK_SIZE);

    XFcuda_SetM_addr(&xcore, (int)m / sizeof(double));

    XFcuda_SetEn_fcuda1(&xcore, 0);
    XFcuda_SetEn_fcuda2(&xcore, 0);
    XFcuda_SetEn_fcuda3(&xcore, 1);

    Xil_DCacheDisable();
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));
    Xil_DCacheEnable();

#else
    //lud_diagonal<<<1, BLOCK_SIZE>>>(m, matrix_dim, i);
    lud_diagonal(m, matrix_dim, k, 1, BLOCK_SIZE, 1, 0);
    //lud_perimeter<<<(matrix_dim-i)/BLOCK_SIZE-1, BLOCK_SIZE*2>>>(m, matrix_dim, i);
    lud_perimeter(m, matrix_dim, k, (matrix_dim-k)/BLOCK_SIZE-1, BLOCK_SIZE*2, 1, 0);
    dim3 dimGrid((matrix_dim-k)/BLOCK_SIZE-1, (matrix_dim-k)/BLOCK_SIZE-1);
    //lud_internal<<<dimGrid, dimBlock>>>(m, matrix_dim, i); 
    lud_internal(m, matrix_dim, k, dimGrid, dimBlock, 1, 0);
#endif
  }

#ifdef HW
  // Kernel 1
  XFcuda_SetOffset(&xcore, k);
  XFcuda_SetGriddim_x(&xcore, 1);
  XFcuda_SetGriddim_y(&xcore, 1);
  //XFcuda_SetGriddim_z(&xcore, 1);
  XFcuda_SetBlockdim_x(&xcore, BLOCK_SIZE);
  XFcuda_SetBlockdim_y(&xcore, BLOCK_SIZE);

  XFcuda_SetM_addr(&xcore, (int)m / sizeof(double));

  XFcuda_SetEn_fcuda1(&xcore, 1);
  XFcuda_SetEn_fcuda2(&xcore, 0);
  XFcuda_SetEn_fcuda3(&xcore, 0);

  Xil_DCacheDisable();
  XFcuda_Start(&xcore);
  while (!XFcuda_IsDone(&xcore));
#else
  //lud_diagonal<<<1,BLOCK_SIZE>>>(m, matrix_dim, i);
  lud_diagonal(m, matrix_dim, k, 1, BLOCK_SIZE, 1, 0);
#endif
}
