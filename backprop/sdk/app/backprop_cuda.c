

// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
//#include <cuda.h>
#include <sys/time.h>

// includes, kernels
//#include "fcuda_generated_backprop_cuda_kernel.c"
#include "backprop.h"
#include "cuda/gold_output.h"

#include "xil_cache.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "hardware_timer.h"
#include "xfcuda.h"

#define CPU

#define GPU
#define HW

#define VERIFY
#define EPSILON 0.001f
////////////////////////////////////////////////////////////////////////////////

//extern "C"
void bpnn_layerforward(float *l1, float *l2, float **conn, int n1, int n2);

//extern "C"
void bpnn_output_error(float *delta, float *target, float *output, int nj, float *err);

//extern "C"
void bpnn_hidden_error(float *delta_h, int nh, float *delta_o, int no, float **who, float *hidden, float *err);

//extern "C" 
void bpnn_adjust_weights(float *delta, int ndelta, float *ly, int nly, float **w, float **oldw);


//extern "C"
int setup(int argc, char** argv);

//extern "C"
float **alloc_2d_dbl(int m, int n);

//extern "C"
float squash(float x);

unsigned int num_threads = 0;
unsigned int num_blocks = 0;

////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
  int
main( int argc, char** argv) 
{
  setup(argc, argv);

}

//extern "C"
void bpnn_train_cuda(BPNN *net, float *eo, float *eh)
{
  init_timer(timer_ctrl, timer_counter_l, timer_counter_h);
  start_timer(timer_ctrl);

  int i, j, m;
  int in, hid, out;
  float out_err, hid_err;

  in = net->input_n;
  hid = net->hidden_n;
  out = net->output_n;

#ifdef GPU

#ifdef HW
  XFcuda xcore;
  int Status;

  Status = XFcuda_Initialize(&xcore, 0);
  if (Status != XST_SUCCESS) {
    printf("Initialization failed %d\n", Status);
    exit(1);
  }
#endif

  m = 0;
  //float *input_hidden_cuda;
  //float *input_cuda;
  //float *output_hidden_cuda;
  float *partial_sum;
  float *hidden_partial_sum;
  //float *hidden_delta_cuda;
  //float *input_prev_weights_cuda;
  float sum;
  float *input_weights_one_dim;
  float *input_weights_prev_one_dim;
  num_blocks = in / 16;
  dim3  grid;//( 1 , num_blocks, 0);
  grid.x = 1;
  grid.y = num_blocks;
  grid.z = 1;
  dim3  threads;//(16 , 16, 0);
  threads.x = 16;
  threads.y = 16;
  threads.z = 1;

  input_weights_one_dim = (float *) malloc((in + 1)* (hid + 1) * sizeof(float));
  if (input_weights_one_dim == NULL) {
    printf("Cannot allocate memory for input_weights_one_dim");
    exit(1);
  }
  input_weights_prev_one_dim = (float *) malloc((in + 1)* (hid + 1) * sizeof(float));
  if (input_weights_prev_one_dim == NULL) {
    printf("Cannot allocate memory for input_weights_prev_one_dim");
    exit(1);
  }
  partial_sum = (float *) malloc(num_blocks * WIDTH * sizeof(float));
  if (partial_sum == NULL) {
    printf("Cannot allocate memory for partial_sum");
    exit(1);
  }

  // this preprocessing stage is added to correct the bugs of wrong memcopy using two-dimensional net->inputweights
  int k;
  for (k = 0; k <= in; k++) {	
    for (j = 0; j <= hid; j++) {
      input_weights_one_dim[m] = net->input_weights[k][j];
      input_weights_prev_one_dim[m] = net-> input_prev_weights[k][j];
      m++;
    }
  }
#endif

#ifdef CPU
  bpnn_layerforward(net->input_units, net->hidden_units,net->input_weights, in, hid);
#endif

#ifdef GPU
#ifdef HW
  //XFcuda_SetIn(&xcore, in);
  XFcuda_SetHid(&xcore, hid);
  XFcuda_SetGriddim_x(&xcore, grid.x);
  XFcuda_SetGriddim_y(&xcore, grid.y);
  //XFcuda_SetGriddim_z(&xcore, grid.z);
  XFcuda_SetBlockdim_x(&xcore, threads.x);
  XFcuda_SetBlockdim_y(&xcore, threads.y);
  //XFcuda_SetBlockdim_z(&xcore, threads.z);
  XFcuda_SetInput_cuda_addr(&xcore, (int)net->input_units / sizeof(float));
  XFcuda_SetInput_hidden_cuda_addr(&xcore, (int)input_weights_one_dim / sizeof(float));
  XFcuda_SetHidden_partial_sum_addr(&xcore, (int)partial_sum / sizeof(float));

  XFcuda_SetEn_fcuda1(&xcore, 1);
  XFcuda_SetEn_fcuda2(&xcore, 0);
  Xil_DCacheFlush();
  XFcuda_Start(&xcore);
  while (!XFcuda_IsDone(&xcore));
#else
  bpnn_layerforward_CUDA(input_cuda, input_hidden_cuda, hidden_partial_sum, in, hid, grid, threads, 1, 0);
#endif
  //cudaMemcpy(partial_sum, hidden_partial_sum, num_blocks * WIDTH * sizeof(float), cudaMemcpyDeviceToHost);
  //memcpy(partial_sum, hidden_partial_sum, num_blocks * WIDTH * sizeof(float));
  for (j = 1; j <= hid; j++) {
    sum = 0.0;
    for (k = 0; k < num_blocks; k++) {	
      sum += partial_sum[k * hid + j-1] ;
    }
    sum += net->input_weights[0][j];
    net-> hidden_units[j] = (float)(1.0 / (1.0 + exp(-sum)));
  }
#endif

  bpnn_layerforward(net->hidden_units, net->output_units, net->hidden_weights, hid, out);


  bpnn_output_error(net->output_delta, net->target, net->output_units, out, &out_err);
  bpnn_hidden_error(net->hidden_delta, hid, net->output_delta, out, net->hidden_weights, net->hidden_units, &hid_err);
  bpnn_adjust_weights(net->output_delta, out, net->hidden_units, hid, net->hidden_weights, net->hidden_prev_weights);

#ifdef CPU
  bpnn_adjust_weights(net->hidden_delta, hid, net->input_units, in, net->input_weights, net->input_prev_weights);
#endif  


#ifdef GPU

  //cudaMalloc((void**) &hidden_delta_cuda, (hid + 1) * sizeof(float));
  //cudaMalloc((void**) &input_prev_weights_cuda, (in + 1) * (hid + 1) * sizeof(float));
  /*
     hidden_delta_cuda = (float*)malloc((hid + 1) * sizeof(float));
     if (hidden_delta_cuda == NULL) {
     printf("Cannot allocate memory for hidden_delta_cuda");
     exit(1);
     }
     input_prev_weights_cuda = (float*)malloc((in + 1) * (hid + 1) * sizeof(float));
     if (input_prev_weights_cuda == NULL) {
     printf("Cannot allocate memory for input_prev_weights_cuda");
     exit(1);
     }
     */

  //cudaMemcpy(hidden_delta_cuda, net->hidden_delta, (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);
  //cudaMemcpy(input_prev_weights_cuda, input_weights_prev_one_dim, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);
  //cudaMemcpy(input_hidden_cuda, input_weights_one_dim, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);

  //memcpy(hidden_delta_cuda, net->hidden_delta, (hid + 1) * sizeof(float));
  //memcpy(input_prev_weights_cuda, input_weights_prev_one_dim, (in + 1) * (hid + 1) * sizeof(float));
  //memcpy(input_hidden_cuda, input_weights_one_dim, (in + 1) * (hid + 1) * sizeof(float));

  m = 0;
  for (k = 0; k <= in; k++) {
    for (j = 0; j <= hid; j++) {
      input_weights_one_dim[m] = net->input_weights[k][j];
      m++;
    }
  }
#ifdef HW
  //XFcuda_SetIn(&xcore, in);
  XFcuda_SetHid(&xcore, hid);
  XFcuda_SetGriddim_x(&xcore, grid.x);
  XFcuda_SetGriddim_y(&xcore, grid.y);
  //XFcuda_SetGriddim_z(&xcore, grid.z);
  XFcuda_SetBlockdim_x(&xcore, threads.x);
  XFcuda_SetBlockdim_y(&xcore, threads.y);
  //XFcuda_SetBlockdim_z(&xcore, threads.z);
  XFcuda_SetDelta_addr(&xcore, (u32)net->hidden_delta / sizeof(float));
  XFcuda_SetLy_addr(&xcore, (u32)net->input_units / sizeof(float));
  XFcuda_SetW_addr(&xcore, (u32)input_weights_one_dim / sizeof(float));
  XFcuda_SetOldw_addr(&xcore, (u32)input_weights_prev_one_dim / sizeof(float));

  XFcuda_SetEn_fcuda1(&xcore, 0);
  XFcuda_SetEn_fcuda2(&xcore, 1);
  Xil_DCacheFlush();
  XFcuda_Start(&xcore);
  while (!XFcuda_IsDone(&xcore));
#else
  bpnn_adjust_weights_CUDA(net->hidden_delta, hid, net->input_units, in, input_weights_one_dim, input_weights_prev_one_dim, grid, threads, 1, 0);
#endif

  //cudaMemcpy(net->input_units, input_cuda, (in + 1) * sizeof(float), cudaMemcpyDeviceToHost);
  //cudaMemcpy(input_weights_one_dim, input_hidden_cuda, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyDeviceToHost);

  //memcpy(net->input_units, input_cuda, (in + 1) * sizeof(float));
  //memcpy(input_weights_one_dim, input_hidden_cuda, (in + 1) * (hid + 1) * sizeof(float));
#endif

#ifdef VERIFY

  bpnn_adjust_weights(net->hidden_delta, hid, net->input_units, in, net->input_weights, net->input_prev_weights);

  int status = 1;

#ifdef GPU
  m = 0;
  for (i = 0; i < in + 1; i++) {
    for (j = 0; j < hid + 1; j++) {
      if (input_weights_one_dim[m] - net->input_weights[i][j] < -EPSILON ||
          input_weights_one_dim[m] - net->input_weights[i][j] > EPSILON) {
        printf("Mismatch at %d: calc = %f, gold = %f.\n",
            m, input_weights_one_dim[m], net->input_weights[i][j]);
        status = 0;
        break;
      }
      m++;
    }
    if (status == 0)
      break;
  }
#endif
  if (status == 1)
    printf("PASSED.\n");
  else
    printf("FAILED.\n");
#endif

#ifdef GPU
  //cudaFree(input_cuda);
  //cudaFree(output_hidden_cuda);
  //cudaFree(input_hidden_cuda);
  //cudaFree(hidden_partial_sum);
  //cudaFree(input_prev_weights_cuda);
  //cudaFree(hidden_delta_cuda);
  //free(input_cuda);
  //free(output_hidden_cuda);
  //free(input_hidden_cuda);
  //free(hidden_partial_sum);
  //free(input_prev_weights_cuda);
  //free(hidden_delta_cuda);
  free(partial_sum);
  free(input_weights_one_dim);
  free(input_weights_prev_one_dim);
#endif

  stop_timer(timer_ctrl);
  printf("Execution time %lld us\n\r", elapsed_time());
}
