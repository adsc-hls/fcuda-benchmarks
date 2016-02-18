/***********************************************************************************
  Implementing Breadth first search on CUDA using algorithm given in HiPC'07
  paper "Accelerating Large Graph Algorithms on the GPU using CUDA"

  Copyright (c) 2008 International Institute of Information Technology - Hyderabad.
  All rights reserved.

  Permission to use, copy, modify and distribute this software and its documentation for
  educational purpose is hereby granted without fee, provided that the above copyright
  notice and this permission notice appear in all copies of this software and that you do
  not sell the software.

  THE SOFTWARE IS PROVIDED "AS IS" AND WITHOUT WARRANTY OF ANY KIND,EXPRESS, IMPLIED OR
  OTHERWISE.

  Created by Pawan Harish.
 ************************************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
//#include <cuda.h>
#include "bfs.h"

#include "data/cost.h"
#include "data/edgeno.h"
#include "data/id.h"
#include "data/start.h"
#include "data/config.h"
#include "cuda/gold_output.h"
#define MAX_THREADS_PER_BLOCK 512

#include "xil_cache.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "hardware_timer.h"
#include "xfcuda.h"
#define HW
//#define FCUDA_C
#define VERBOSE
#define VERIFY

int no_of_nodes;
int edge_list_size;
FILE *fp;

//Structure to hold a node information
/*struct Node
  {
  int starting;
  int no_of_edges;
  };
  */

int BFSGraph(int argc, char** argv);

////////////////////////////////////////////////////////////////////////////////
// Main Program
////////////////////////////////////////////////////////////////////////////////
int main( int argc, char** argv)
{
  init_timer(timer_ctrl, timer_counter_l, timer_counter_h);
  start_timer(timer_ctrl);

  no_of_nodes=0;
  edge_list_size=0;
  BFSGraph( argc, argv);

  stop_timer(timer_ctrl);
  printf("Execution time %lld us\n\r", elapsed_time());
}

void Usage(int argc, char**argv){

  fprintf(stderr,"Usage: %s <input_file>\n", argv[0]);

}
////////////////////////////////////////////////////////////////////////////////
//Apply BFS on a Graph using CUDA
////////////////////////////////////////////////////////////////////////////////
int BFSGraph( int argc, char** argv)
{
  int i;
#ifdef HW
  XFcuda xcore;
  int Status;

  Status = XFcuda_Initialize(&xcore, 0);
  if (Status != XST_SUCCESS) {
    printf("Initialization failed %d\r\n", Status);
    exit(1);
  }
#endif

  /*
     char *input_f;
     if(argc!=2){
     Usage(argc, argv);
     exit(0);
     }

     input_f = argv[1];
     printf("Reading File\n");
  //Read in Graph from a file
  fp = fopen(input_f,"r");
  if(!fp)
  {
  printf("Error Reading graph file\n");
  return;
  }
  */
  int source = 0;

  //fscanf(fp,"%d",&no_of_nodes);
  no_of_nodes = config[0];

  int num_of_blocks = 1;
  int num_of_threads_per_block = no_of_nodes;

  //Make execution Parameters according to the number of nodes
  //Distribute threads across multiple Blocks if necessary
  if(no_of_nodes>MAX_THREADS_PER_BLOCK)
  {
    num_of_blocks = (int)ceil(no_of_nodes/(double)MAX_THREADS_PER_BLOCK);
    num_of_threads_per_block = MAX_THREADS_PER_BLOCK;
  }
  //printf("num blocks %d\n", num_of_blocks);

  // allocate host memory
  Node* h_graph_nodes = (Node*) malloc(sizeof(Node)*no_of_nodes);
  int *h_graph_mask = (int*) malloc(sizeof(int)*no_of_nodes);
  int *h_updating_graph_mask = (int*) malloc(sizeof(int)*no_of_nodes);
  int *h_graph_visited = (int*) malloc(sizeof(int)*no_of_nodes);

  //int start, edgeno;
  // initalize the memory
  for(int i = 0; i < no_of_nodes; i++)
  {
    //fscanf(fp,"%d %d",&start,&edgeno);
    //h_graph_nodes[i].starting = start;
    //h_graph_nodes[i].no_of_edges = edgeno;
    h_graph_nodes[i].starting = start[i];
    h_graph_nodes[i].no_of_edges = edgeno[i];
    //h_graph_mask[i]=false;
    h_graph_mask[i] = 0;
    //h_updating_graph_mask[i]=false;
    h_updating_graph_mask[i] = 0;
    //h_graph_visited[i]=false;
    h_graph_visited[i] = 0;
  }

  //read the source node from the file
  //fscanf(fp,"%d",&source);
  source = config[1];
  source=0;

  //set the source node as true in the mask
  //h_graph_mask[source]=true;
  h_graph_mask[source] = 1;
  //h_graph_visited[source]=true;
  h_graph_visited[source] = 1;
  //fscanf(fp,"%d",&edge_list_size);
  edge_list_size = config[2];

  //int id,cost;
  int* h_graph_edges = (int*) malloc(sizeof(int)*edge_list_size);
  for(int i=0; i < edge_list_size ; i++)
  {
    //fscanf(fp,"%d",&id);
    //fscanf(fp,"%d",&cost);
    h_graph_edges[i] = id[i];
  }

  //if(fp)
  //fclose(fp);

  //printf("Read File\n");

  //Copy the Node list to device memory
  //Node* d_graph_nodes;
  //cudaMalloc( (void**) &d_graph_nodes, sizeof(Node)*no_of_nodes) ;
  //cudaMemcpy( d_graph_nodes, h_graph_nodes, sizeof(Node)*no_of_nodes, cudaMemcpyHostToDevice) ;

  //Copy the Edge List to device Memory
  //int* d_graph_edges;
  //cudaMalloc( (void**) &d_graph_edges, sizeof(int)*edge_list_size) ;
  //cudaMemcpy( d_graph_edges, h_graph_edges, sizeof(int)*edge_list_size, cudaMemcpyHostToDevice) ;

  //Copy the Mask to device memory
  //int* d_graph_mask;
  //cudaMalloc( (void**) &d_graph_mask, sizeof(int)*no_of_nodes) ;
  //cudaMemcpy( d_graph_mask, h_graph_mask, sizeof(int)*no_of_nodes, cudaMemcpyHostToDevice) ;

  //int* d_updating_graph_mask;
  //cudaMalloc( (void**) &d_updating_graph_mask, sizeof(int)*no_of_nodes) ;
  //cudaMemcpy( d_updating_graph_mask, h_updating_graph_mask, sizeof(int)*no_of_nodes, cudaMemcpyHostToDevice) ;

  //Copy the Visited nodes array to device memory
  //int* d_graph_visited;
  //cudaMalloc( (void**) &d_graph_visited, sizeof(int)*no_of_nodes) ;
  //cudaMemcpy( d_graph_visited, h_graph_visited, sizeof(int)*no_of_nodes, cudaMemcpyHostToDevice) ;

  // allocate mem for the result on host side
  int* h_cost = (int*) malloc( sizeof(int)*no_of_nodes);
  if (h_cost == NULL)
    printf("Cannot allocate memory for h_cost\n");

  for(int i=0;i<no_of_nodes;i++)
    h_cost[i]=-1;
  h_cost[source]=0;

  // allocate device memory for result
  //int* d_cost;
  //cudaMalloc( (void**) &d_cost, sizeof(int)*no_of_nodes);
  //cudaMemcpy( d_cost, h_cost, sizeof(int)*no_of_nodes, cudaMemcpyHostToDevice) ;

  //make a int to check if the execution is over
  ///int *d_over;
  //cudaMalloc( (void**) &d_over, sizeof(int));

  //printf("Copied Everything to GPU memory\n");

  // setup execution parameters
  dim3  grid( num_of_blocks, 1, 1);
  dim3  threads( num_of_threads_per_block, 1, 1);

  int k=0;
#ifdef VERBOSE
  printf("Start traversing the tree\n");
#endif
  int stop;

#ifdef HW

  XFcuda_SetNo_of_nodes(&xcore, no_of_nodes);
  XFcuda_SetGriddim_x(&xcore, grid.x);
  XFcuda_SetGriddim_y(&xcore, grid.y);
  //XFcuda_SetGriddim_z(&xcore, grid.z);
  XFcuda_SetBlockdim_x(&xcore, threads.x);
  //XFcuda_SetBlockdim_y(&xcore, threads.y);
  //XFcuda_SetBlockdim_z(&xcore, threads.z);
  XFcuda_SetG_graph_nodes_addr(&xcore, (u32)h_graph_nodes / sizeof(Node));
  XFcuda_SetG_graph_mask_addr(&xcore, (u32)h_graph_mask / sizeof(int));
  XFcuda_SetG_updating_graph_mask_addr(&xcore, (u32)h_updating_graph_mask / sizeof(int));
  XFcuda_SetG_graph_visited_addr(&xcore, (u32)h_graph_visited / sizeof(int));
  XFcuda_SetG_graph_edges_addr(&xcore, (u32)h_graph_edges / sizeof(int));
  XFcuda_SetG_cost_addr(&xcore, (u32)h_cost / sizeof(int));
#endif
  //Call the Kernel untill all the elements of Frontier are not false
  int *stop1 = (int*)malloc(sizeof(int));
  XFcuda_SetG_over_addr(&xcore, (u32)stop1 / sizeof(int));
  do
  {
    //if no thread changes this value then the loop stops
    stop1[0] = 0;

#ifdef HW
    //XFcuda_SetG_over_addr(&xcore, (u32)&stop / sizeof(int));

    int done;
    //cudaMemcpy( d_over, &stop, sizeof(int), cudaMemcpyHostToDevice) ;
    XFcuda_SetEn_fcuda1(&xcore, 1);
    XFcuda_SetEn_fcuda2(&xcore, 0);
    Xil_DCacheFlush();
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));
    Xil_DCacheFlush();
    XFcuda_SetEn_fcuda1(&xcore, 0);
    XFcuda_SetEn_fcuda2(&xcore, 1);
    Xil_DCacheFlush();
    XFcuda_Start(&xcore);
    while (!XFcuda_IsDone(&xcore));
    Xil_DCacheFlush();
#else
    //Kernel<<< grid, threads, 0 >>>( d_graph_nodes, d_graph_edges, d_graph_mask, d_updating_graph_mask, d_graph_visited, d_cost, no_of_nodes);
    Kernel(h_graph_nodes, h_graph_edges, h_graph_mask, h_updating_graph_mask, h_graph_visited, h_cost, no_of_nodes, grid, threads, 1, 0);
    //Kernel2<<< grid, threads, 0 >>>( d_graph_mask, d_updating_graph_mask, d_graph_visited, d_over, no_of_nodes);
    Kernel2(h_graph_mask, h_updating_graph_mask, h_graph_visited, &stop, no_of_nodes, grid, threads, 1, 0);
    /*
    for(int tid = 0; tid < no_of_nodes; tid++ )
    {
      if (h_graph_mask[tid] == true){
        h_graph_mask[tid]=false;
        for(int i=h_graph_nodes[tid].starting; i<(h_graph_nodes[tid].no_of_edges + h_graph_nodes[tid].starting); i++)
        {
          int id = h_graph_edges[i];
          if(!h_graph_visited[id])
          {
            h_cost[id]=h_cost[tid]+1;
            h_updating_graph_mask[id]=true;
          }
        }
      }
    }

    for(int tid=0; tid< no_of_nodes ; tid++ )
    {
      if (h_updating_graph_mask[tid] == true){
        h_graph_mask[tid]=true;
        h_graph_visited[tid]=true;
        stop=true;
        h_updating_graph_mask[tid]=false;
      }
    }
    */
    //#endif

    //cudaMemcpy( &stop, d_over, sizeof(int), cudaMemcpyDeviceToHost) ;
#endif

      k++;
  } while(stop1[0] == 1);

#ifdef VERBOSE
  printf("Kernel Executed %d times\n",k);

  // copy result from device to host
  //cudaMemcpy( h_cost, d_cost, sizeof(int)*no_of_nodes, cudaMemcpyDeviceToHost) ;

  for (i = 0; i < 10; i++)
    printf("index %d: %d\n", i, h_cost[i]);
#endif

#ifdef VERIFY
  //Store the result into a file
  //FILE *fpo = fopen("cuda/gold_output.txt", "r");
  //int gold_cost_val;
  int status = 1;
  for(i=0;i<no_of_nodes;i++) {
    //fprintf(fpo,"%d) cost:%d\n",i,h_cost[i]);
    //fscanf(fpo, "%d\n", &gold_cost_val);
    //printf("%d\n", h_cost[i]);
    if (gold_output[i] != h_cost[i]) {
      printf("Mismatch at %d: gold = %d, calc = %d.\n",
        i, gold_output[i], h_cost[i]);
      status = 0;
      break;
    }
  }
  if (status == 1)
    printf("PASSED.\n");
  else
    printf("FAILED.\n");
#endif

  //fclose(fpo);
  //printf("Result stored in result.txt\n");


  // cleanup memory
  free( h_graph_nodes);
  free( h_graph_edges);
  free( h_graph_mask);
  free( h_updating_graph_mask);
  free( h_graph_visited);
  free( h_cost);
#ifdef CDMA
  //free(memport);
#endif
  //cudaFree(d_graph_nodes);
  //cudaFree(d_graph_edges);
  //cudaFree(d_graph_mask);
  //cudaFree(d_updating_graph_mask);
  //cudaFree(d_graph_visited);
  //cudaFree(d_cost);
  }
