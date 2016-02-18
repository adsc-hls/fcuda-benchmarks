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
#define MAX_THREADS_PER_BLOCK 512

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
//#include "fcuda_generated_kernel.c"
//#include "fcuda_generated_kernel2.c"

void BFSGraph(int argc, char** argv);

////////////////////////////////////////////////////////////////////////////////
// Main Program
////////////////////////////////////////////////////////////////////////////////
int main( int argc, char** argv)
{
  no_of_nodes=0;
  edge_list_size=0;
  BFSGraph( argc, argv);
}

void Usage(int argc, char**argv){

  fprintf(stderr,"Usage: %s <input_file>\n", argv[0]);

}
////////////////////////////////////////////////////////////////////////////////
//Apply BFS on a Graph using CUDA
////////////////////////////////////////////////////////////////////////////////
void BFSGraph( int argc, char** argv)
{

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

  int source = 0;

  fscanf(fp,"%d",&no_of_nodes);

  int num_of_blocks = 1;
  int num_of_threads_per_block = no_of_nodes;

  //Make execution Parameters according to the number of nodes
  //Distribute threads across multiple Blocks if necessary
  if(no_of_nodes>MAX_THREADS_PER_BLOCK)
  {
    num_of_blocks = (int)ceil(no_of_nodes/(double)MAX_THREADS_PER_BLOCK);
    num_of_threads_per_block = MAX_THREADS_PER_BLOCK;
  }

  // allocate host memory
  Node* h_graph_nodes = (Node*) malloc(sizeof(Node)*no_of_nodes);
  DATATYPE *h_graph_mask = (DATATYPE*) malloc(sizeof(DATATYPE)*no_of_nodes);
  DATATYPE *h_updating_graph_mask = (DATATYPE*) malloc(sizeof(DATATYPE)*no_of_nodes);
  DATATYPE *h_graph_visited = (DATATYPE*) malloc(sizeof(DATATYPE)*no_of_nodes);

  int start, edgeno;
  // initalize the memory
  for( unsigned int i = 0; i < no_of_nodes; i++)
  {
    fscanf(fp,"%d %d",&start,&edgeno);
    h_graph_nodes[i].starting = start;
    h_graph_nodes[i].no_of_edges = edgeno;
    h_graph_mask[i]=false;
    h_updating_graph_mask[i]=false;
    h_graph_visited[i]=false;
  }

  //read the source node from the file
  fscanf(fp,"%d",&source);
  source=0;

  //set the source node as true in the mask
  h_graph_mask[source]=true;
  h_graph_visited[source]=true;

  fscanf(fp,"%d",&edge_list_size);

  printf("%d %d\n", no_of_nodes, edge_list_size);
  int id,cost;
  int* h_graph_edges = (int*) malloc(sizeof(int)*edge_list_size);
  for(int i=0; i < edge_list_size ; i++)
  {
    fscanf(fp,"%d",&id);
    fscanf(fp,"%d",&cost);
    h_graph_edges[i] = id;
  }

  if(fp)
    fclose(fp);

  printf("Read File\n");

  //Copy the Node list to device memory
  //Node* d_graph_nodes;
  //cudaMalloc( (void**) &d_graph_nodes, sizeof(Node)*no_of_nodes) ;
  //cudaMemcpy( d_graph_nodes, h_graph_nodes, sizeof(Node)*no_of_nodes, cudaMemcpyHostToDevice) ;

  //Copy the Edge List to device Memory
  //int* d_graph_edges;
  //cudaMalloc( (void**) &d_graph_edges, sizeof(int)*edge_list_size) ;
  //cudaMemcpy( d_graph_edges, h_graph_edges, sizeof(int)*edge_list_size, cudaMemcpyHostToDevice) ;

  //Copy the Mask to device memory
  //DATATYPE* d_graph_mask;
  //cudaMalloc( (void**) &d_graph_mask, sizeof(DATATYPE)*no_of_nodes) ;
  //cudaMemcpy( d_graph_mask, h_graph_mask, sizeof(DATATYPE)*no_of_nodes, cudaMemcpyHostToDevice) ;

  //DATATYPE* d_updating_graph_mask;
  //cudaMalloc( (void**) &d_updating_graph_mask, sizeof(DATATYPE)*no_of_nodes) ;
  //cudaMemcpy( d_updating_graph_mask, h_updating_graph_mask, sizeof(DATATYPE)*no_of_nodes, cudaMemcpyHostToDevice) ;

  //Copy the Visited nodes array to device memory
  //DATATYPE* d_graph_visited;
  //cudaMalloc( (void**) &d_graph_visited, sizeof(DATATYPE)*no_of_nodes) ;
  //cudaMemcpy( d_graph_visited, h_graph_visited, sizeof(DATATYPE)*no_of_nodes, cudaMemcpyHostToDevice) ;

  // allocate mem for the result on host side
  int* h_cost = (int*) malloc( sizeof(int)*no_of_nodes);
  for(int i=0;i<no_of_nodes;i++)
    h_cost[i]=-1;
  h_cost[source]=0;

  // allocate device memory for result
  //int* d_cost;
  //cudaMalloc( (void**) &d_cost, sizeof(int)*no_of_nodes);
  //cudaMemcpy( d_cost, h_cost, sizeof(int)*no_of_nodes, cudaMemcpyHostToDevice) ;

  //make a DATATYPE to check if the execution is over
  ///DATATYPE *d_over;
  //cudaMalloc( (void**) &d_over, sizeof(DATATYPE));
  printf("Copied Everything to GPU memory\n");

  // setup execution parameters
  dim3  grid( num_of_blocks, 1, 1);
  dim3  threads( num_of_threads_per_block, 1, 1);

  int k=0;
  printf("Start traversing the tree\n");
  DATATYPE stop;
  //Call the Kernel untill all the elements of Frontier are not false
  do
  {
    //if no thread changes this value then the loop stops
    stop=false;
    //cudaMemcpy( d_over, &stop, sizeof(DATATYPE), cudaMemcpyHostToDevice) ;
    //Kernel<<< grid, threads, 0 >>>( d_graph_nodes, d_graph_edges, d_graph_mask, d_updating_graph_mask, d_graph_visited, d_cost, no_of_nodes);
    Kernel(h_graph_nodes, h_graph_edges, h_graph_mask, h_updating_graph_mask, h_graph_visited, h_cost, no_of_nodes, grid, threads, 1, 0);
    // check if kernel execution generated and error


    //Kernel2<<< grid, threads, 0 >>>( d_graph_mask, d_updating_graph_mask, d_graph_visited, d_over, no_of_nodes);
    Kernel2(h_graph_mask, h_updating_graph_mask, h_graph_visited, &stop, no_of_nodes, grid, threads, 1, 0);
    // check if kernel execution generated and error


    //cudaMemcpy( &stop, d_over, sizeof(DATATYPE), cudaMemcpyDeviceToHost) ;
    k++;
  }
  while(stop);


  printf("Kernel Executed %d times\n",k);

  // copy result from device to host
  //cudaMemcpy( h_cost, d_cost, sizeof(int)*no_of_nodes, cudaMemcpyDeviceToHost) ;

  //Store the result into a file
  FILE *fpo = fopen("cuda/gold_output.txt", "r");
  int gold_cost_val;
  int status = 1;
  for(int i=0;i<no_of_nodes;i++) {
    //fprintf(fpo,"%d) cost:%d\n",i,h_cost[i]);
    fscanf(fpo, "%d\n", &gold_cost_val);
    if (gold_cost_val != h_cost[i]) {
      printf("Mismatch at %d: gold = %d, calc = %d.\n",
          i, gold_cost_val, h_cost[i]);
      status = 0;
      break;
    }
  }

  fclose(fpo);
  //printf("Result stored in result.txt\n");


  // cleanup memory
  free( h_graph_nodes);
  free( h_graph_edges);
  free( h_graph_mask);
  free( h_updating_graph_mask);
  free( h_graph_visited);
  free( h_cost);
  //cudaFree(d_graph_nodes);
  //cudaFree(d_graph_edges);
  //cudaFree(d_graph_mask);
  //cudaFree(d_updating_graph_mask);
  //cudaFree(d_graph_visited);
  //cudaFree(d_cost);
  if (status == 1)
    printf("PASSED.\n");
  else
    printf("FAILED.\n");
}
