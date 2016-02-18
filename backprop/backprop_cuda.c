

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

double gettime() {
  struct timeval t;
  gettimeofday(&t,NULL);
  return t.tv_sec*1000000+t.tv_usec;
}

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
  int in, hid, out;
  float out_err, hid_err;

  in = net->input_n;
  hid = net->hidden_n;
  out = net->output_n;   

#ifdef GPU  
  int m = 0;
  float *input_hidden_cuda;
  float *input_cuda;
  //float *output_hidden_cuda;
  float *partial_sum;
  float *hidden_partial_sum;
  float *hidden_delta_cuda;
  float *input_prev_weights_cuda;
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
  input_weights_prev_one_dim = (float *) malloc((in + 1)* (hid + 1) * sizeof(float));
  partial_sum = (float *) malloc(num_blocks * WIDTH * sizeof(float));

  // this preprocessing stage is added to correct the bugs of wrong memcopy using two-dimensional net->inputweights
  for (int k = 0; k <= in; k++) {	
    for (int j = 0; j <= hid; j++) {
      input_weights_one_dim[m] = net->input_weights[k][j];
      input_weights_prev_one_dim[m] = net-> input_prev_weights[k][j];
      m++;
    }
  }

  //cudaMalloc((void**) &input_cuda, (in + 1) * sizeof(float));
  //cudaMalloc((void**) &output_hidden_cuda, (hid + 1) * sizeof(float));
  //cudaMalloc((void**) &input_hidden_cuda, (in + 1) * (hid + 1) * sizeof(float));
  //cudaMalloc((void**) &hidden_partial_sum, num_blocks * WIDTH * sizeof(float));
  input_cuda = (float*)malloc((in + 1) * sizeof(float));
  //output_hidden_cuda = (float*)malloc((hid + 1) * sizeof(float));
  input_hidden_cuda = (float*)malloc((in + 1) * (hid + 1) * sizeof(float));
  hidden_partial_sum = (float*)malloc(num_blocks * WIDTH * sizeof(float));
#endif

#ifdef CPU

  printf("Performing CPU computation\n");
  unsigned int start = gettime();
  bpnn_layerforward(net->input_units, net->hidden_units,net->input_weights, in, hid);
  unsigned int end = gettime();
  printf("CPU time: \t%f\n", (end - start) * 1e-6);
#endif

#ifdef GPU

  printf("Performing GPU computation\n");


  //cudaMemcpy(input_cuda, net->input_units, (in + 1) * sizeof(float), cudaMemcpyHostToDevice);
  //cudaMemcpy(input_hidden_cuda, input_weights_one_dim, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);
  memcpy(input_cuda, net->input_units, (in + 1) * sizeof(float));
  memcpy(input_hidden_cuda, input_weights_one_dim, (in + 1) * (hid + 1) * sizeof(float));

  start = gettime();
  bpnn_layerforward_CUDA(input_cuda, input_hidden_cuda, hidden_partial_sum, in, hid, grid, threads, 1, 0);
  end = gettime();
  printf("GPU time: \t%f\n", (end - start) * 1e-6);
  //cudaThreadSynchronize();

  //cudaError_t error = cudaGetLastError();
  //	if (error != cudaSuccess) {
  //		printf("bpnn kernel error: %s\n", cudaGetErrorString(error));
  //		exit(EXIT_FAILURE);
  //	}

  //cudaMemcpy(partial_sum, hidden_partial_sum, num_blocks * WIDTH * sizeof(float), cudaMemcpyDeviceToHost);
  memcpy(partial_sum, hidden_partial_sum, num_blocks * WIDTH * sizeof(float));   
  for (int j = 1; j <= hid; j++) {
    sum = 0.0;
    for (int k = 0; k < num_blocks; k++) {	
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
  hidden_delta_cuda = (float*)malloc((hid + 1) * sizeof(float));
  input_prev_weights_cuda = (float*)malloc((in + 1) * (hid + 1) * sizeof(float));


  //cudaMemcpy(hidden_delta_cuda, net->hidden_delta, (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);
  //cudaMemcpy(input_prev_weights_cuda, input_weights_prev_one_dim, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);
  //cudaMemcpy(input_hidden_cuda, input_weights_one_dim, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);
  memcpy(hidden_delta_cuda, net->hidden_delta, (hid + 1) * sizeof(float));
  memcpy(input_prev_weights_cuda, input_weights_prev_one_dim, (in + 1) * (hid + 1) * sizeof(float));
  memcpy(input_hidden_cuda, input_weights_one_dim, (in + 1) * (hid + 1) * sizeof(float));

  printf("%d %d\n", hid + 1, (in + 1) * (hid + 1));
  bpnn_adjust_weights_cuda(hidden_delta_cuda, hid, input_cuda, in, input_hidden_cuda, input_prev_weights_cuda, grid, threads, 1, 0);



  //cudaMemcpy(net->input_units, input_cuda, (in + 1) * sizeof(float), cudaMemcpyDeviceToHost);
  //cudaMemcpy(input_weights_one_dim, input_hidden_cuda, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyDeviceToHost);
  memcpy(net->input_units, input_cuda, (in + 1) * sizeof(float));
  memcpy(input_weights_one_dim, input_hidden_cuda, (in + 1) * (hid + 1) * sizeof(float)); 

  int status = 1;
  float EPSILON = 0.001f;
  FILE *pFile;
  pFile = fopen("cuda/gold_output.txt", "r");
  if (pFile == NULL) {
    fputs("fopen example", pFile);
  }
  //fprintf(pFile, "net->input_units\n");
  float gold_input_units_val;
  for (int k = 0; k < in + 1; k++) {
    //fprintf(pFile, "%f\n", net->input_units[k]);
    fscanf(pFile, "%f\n", &gold_input_units_val);
    if (gold_input_units_val - net->input_units[k] < -EPSILON ||
        gold_input_units_val - net->input_units[k] > EPSILON) {
      printf("Mismatch at %d: gold = %f, calc = %f.\n",
          k, gold_input_units_val, net->input_units[k]);
      status = 0;
      break;
    }
  }

  float gold_weights_one_dim_val;
  //fprintf(pFile, "input_weights_one_dim\n");
  for (int k = 0; k < (in + 1) * (hid + 1); k++) {
    //fprintf(pFile, "%f\n", input_weights_one_dim[k]);
    fscanf(pFile, "%f\n", &gold_weights_one_dim_val);
    if (gold_weights_one_dim_val - input_weights_one_dim[k] < -EPSILON ||
        gold_weights_one_dim_val - input_weights_one_dim[k] > EPSILON) {
      printf("Mismatch at %d: gold = %f, calc = %f.\n",
          k, gold_weights_one_dim_val, input_weights_one_dim[k]);
      status = 0;
      break;
    }
  }

  //cudaFree(input_cuda);
  //cudaFree(output_hidden_cuda);
  //cudaFree(input_hidden_cuda);
  //cudaFree(hidden_partial_sum);
  //cudaFree(input_prev_weights_cuda);
  //cudaFree(hidden_delta_cuda);
  free(input_cuda);
  //free(output_hidden_cuda);
  free(input_hidden_cuda);
  free(hidden_partial_sum);
  free(input_prev_weights_cuda);
  free(hidden_delta_cuda);

  free(partial_sum);
  free(input_weights_one_dim);
  free(input_weights_prev_one_dim);

  if (status == 1)
    printf("PASSED.\n");
  else
    printf("FAILED.\n");
#endif   

}
