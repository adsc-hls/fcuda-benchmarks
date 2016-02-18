#include <string.h>
#include <stdlib.h>
#include <stdio.h>
//#include <time.h>
#include <math.h>

#include "common.h"
#define VERIFY

void stopwatch_start(stopwatch *sw){
    if (sw == NULL)
        return;

    //bzero(&sw->begin, sizeof(struct timeval));
    //bzero(&sw->end  , sizeof(struct timeval));

    //gettimeofday(&sw->begin, NULL);
}

void stopwatch_stop(stopwatch *sw){
    if (sw == NULL)
        return;

    //gettimeofday(&sw->end, NULL);
}

double 
get_interval_by_sec(stopwatch *sw){
    if (sw == NULL)
        return 0;
    //return ((double)(sw->end.tv_sec-sw->begin.tv_sec)+(double)(sw->end.tv_usec-sw->begin.tv_usec)/1000000);
}

int 
get_interval_by_usec(stopwatch *sw){
    if (sw == NULL)
        return 0;
    //return ((sw->end.tv_sec-sw->begin.tv_sec)*1000000+(sw->end.tv_usec-sw->begin.tv_usec));
}

func_ret_t 
create_matrix_from_file(double **mp, const char* filename, int *size_p){
  int i, j, size;
  double *m;
  FILE *fp = NULL;

  fp = fopen(filename, "rb");
  if ( fp == NULL) {
      return RET_FAILURE;
  }

  fscanf(fp, "%d\n", &size);

  m = (double*) malloc(sizeof(double)*size*size);
  if ( m == NULL) {
      fclose(fp);
      return RET_FAILURE;
  }

  for (i=0; i < size; i++) {
      for (j=0; j < size; j++) {
          fscanf(fp, "%lf ", m+i*size+j);
      }
  }

  fclose(fp);

  *size_p = size;
  *mp = m;

  return RET_SUCCESS;
}


func_ret_t
create_matrix_from_random(double **mp, int size){
  double *l, *u, *m;
  int i,j,k;

  srand(7);

  l = (double*)malloc(size*size*sizeof(double));
  if ( l == NULL)
    return RET_FAILURE;

  u = (double*)malloc(size*size*sizeof(double));
  if ( u == NULL) {
      free(l);
      return RET_FAILURE;
  }

  for (i = 0; i < size; i++) {
      for (j=0; j < size; j++) {
          if (i>j) {
              l[i*size+j] = GET_RAND_FP;
          } else if (i == j) {
              l[i*size+j] = 1;
          } else {
              l[i*size+j] = 0;
          }
      }
  }

  for (j=0; j < size; j++) {
      for (i=0; i < size; i++) {
          if (i>j) {
              u[j*size+i] = 0;
          }else {
              u[j*size+i] = GET_RAND_FP; 
          }
      }
  }

  for (i=0; i < size; i++) {
      for (j=0; j < size; j++) {
          for (k=0; k <= MIN(i,j); k++)
            m[i*size+j] = l[i*size+k] * u[j*size+k];
      }
  }

  free(l);
  free(u);

  *mp = m;

  return RET_SUCCESS;
}

void
matrix_multiply(double *inputa, double *inputb, double *output, int size){
  int i, j, k;

  for (i=0; i < size; i++)
    for (k=0; k < size; k++)
      for (j=0; j < size; j++)
        output[i*size+j] = inputa[i*size+k] * inputb[k*size+j];

}

func_ret_t
lud_verify(double *m, double *lu, int matrix_dim){
  int i,j,k;
  printf("%d\n", matrix_dim);
  double *tmp = (double*)malloc(matrix_dim*matrix_dim*sizeof(double));
  if (tmp == NULL) {
    printf("Unable to allocate mem. for tmp\n");
    exit(1);
  }
  for (i=0; i < matrix_dim; i ++)
    for (j=0; j< matrix_dim; j++) {
        double sum = 0;
        double l,u;
        for (k=0; k <= MIN(i,j); k++){
            if ( i==k)
              l=1;
            else
              l=lu[i*matrix_dim+k];
            u=lu[k*matrix_dim+j];
            sum+=l*u;
        }
        tmp[i*matrix_dim+j] = sum;
    }
  /* printf(">>>>>LU<<<<<<<\n"); */
  /* for (i=0; i<matrix_dim; i++){ */
  /*   for (j=0; j<matrix_dim;j++){ */
  /*       printf("%f ", lu[i*matrix_dim+j]); */
  /*   } */
  /*   printf("\n"); */
  /* } */
  /* printf(">>>>>result<<<<<<<\n"); */
  /* for (i=0; i<matrix_dim; i++){ */
  /*   for (j=0; j<matrix_dim;j++){ */
  /*       printf("%f ", tmp[i*matrix_dim+j]); */
  /*   } */
  /*   printf("\n"); */
  /* } */
  /* printf(">>>>>input<<<<<<<\n"); */
  /* for (i=0; i<matrix_dim; i++){ */
  /*   for (j=0; j<matrix_dim;j++){ */
  /*       printf("%f ", m[i*matrix_dim+j]); */
  /*   } */
  /*   printf("\n"); */
  /* } */

#ifdef VERIFY
  int passed = 1;
  for (i=0; i<matrix_dim; i++){
      for (j=0; j<matrix_dim; j++){
          if ( fabs(m[i*matrix_dim+j]-tmp[i*matrix_dim+j]) > 0.0001) {
            printf("dismatch at (%d, %d): (o)%lf (n)%lf\n", i, j, m[i*matrix_dim+j], tmp[i*matrix_dim+j]);
	    passed = 0;
	    break;
	  }
      }
  }
  free(tmp);
 
  if (passed)
	printf("PASSED.\n");
  else
	printf("FAILED.\n");
#endif
}

void
matrix_duplicate(double *src, double **dst, int matrix_dim) {
    int s = matrix_dim*matrix_dim*sizeof(double);
   double *p = (double *) malloc (s);
   memcpy(p, src, s);
   *dst = p;
}

void
print_matrix(double *m, int matrix_dim) {
    int i, j;
    for (i=0; i<matrix_dim;i++) {
      for (j=0; j<matrix_dim;j++)
        printf("%lf ", m[i*matrix_dim+j]);
      printf("\n");
    }
}


// Generate well-conditioned matrix internally  by Ke Wang 2013/08/07 22:20:06

func_ret_t
create_matrix(double **mp, int size){
  double *m;
  int i,j;
  double lamda = -0.001;
  double coe[2*size-1];
  double coe_i =0.0;

  for (i=0; i < size; i++)
    {
      coe_i = 10*exp(lamda*i); 
      j=size-1+i;     
      coe[j]=coe_i;
      j=size-1-i;     
      coe[j]=coe_i;
    }

  m = (double*) malloc(sizeof(double)*size*size);
  if ( m == NULL) {
      return RET_FAILURE;
  }

  for (i=0; i < size; i++) {
      for (j=0; j < size; j++) {
	m[i*size+j]=coe[size-1-i+j];
      }
  }

  *mp = m;

  return RET_SUCCESS;
}
