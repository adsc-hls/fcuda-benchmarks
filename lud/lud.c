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
//#include "fcuda_generated_lud_kernel.c"
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
  int matrix_dim = 32; /* default matrix_dim */
  int opt, option_index=0;
  func_ret_t ret;
  const char *input_file = NULL;
  double *m, *d_m, *mm;
  stopwatch sw;

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
  d_m = (double*)malloc(matrix_dim*matrix_dim*sizeof(double));
  /* beginning of timing point */
  stopwatch_start(&sw);
  //cudaMemcpy(d_m, m, matrix_dim*matrix_dim*sizeof(double), 
  //      cudaMemcpyHostToDevice);
  memcpy(d_m, m, matrix_dim*matrix_dim*sizeof(double));
  lud_cuda(d_m, matrix_dim);

  //cudaMemcpy(m, d_m, matrix_dim*matrix_dim*sizeof(double), 
  //	     cudaMemcpyDeviceToHost);
  memcpy(m, d_m, matrix_dim*matrix_dim*sizeof(double));
  /* end of timing point */
  stopwatch_stop(&sw);
  //printf("Time consumed(ms): %lf\n", 1000*get_interval_by_sec(&sw));

  //cudaFree(d_m);
  free(d_m);

  if (do_verify){
    //printf("After LUD\n");
    //print_matrix(m, matrix_dim);
    printf(">>>Verify<<<<\n");
    lud_verify(mm, m, matrix_dim); 
    free(mm);
  }

  free(m);

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


void lud_cuda(double *m, int matrix_dim)
{
  int i=0;
  dim3 dimBlock(BLOCK_SIZE, BLOCK_SIZE);
  double *m_debug = (double*)malloc(matrix_dim*matrix_dim*sizeof(double));

  for (i=0; i < matrix_dim-BLOCK_SIZE; i += BLOCK_SIZE) {
    //lud_diagonal<<<1, BLOCK_SIZE>>>(m, matrix_dim, i);
    lud_diagonal(m, matrix_dim, i, 1, BLOCK_SIZE, 1, 0);
    //lud_perimeter<<<(matrix_dim-i)/BLOCK_SIZE-1, BLOCK_SIZE*2>>>(m, matrix_dim, i);
    lud_perimeter(m, matrix_dim, i, (matrix_dim-i)/BLOCK_SIZE-1, BLOCK_SIZE*2, 1, 0);
    dim3 dimGrid((matrix_dim-i)/BLOCK_SIZE-1, (matrix_dim-i)/BLOCK_SIZE-1);
    //lud_internal<<<dimGrid, dimBlock>>>(m, matrix_dim, i); 
    lud_internal(m, matrix_dim, i, dimGrid, dimBlock, 1, 0);
  }
  //lud_diagonal<<<1,BLOCK_SIZE>>>(m, matrix_dim, i);
  lud_diagonal(m, matrix_dim, i, 1, BLOCK_SIZE, 1, 0);
}
