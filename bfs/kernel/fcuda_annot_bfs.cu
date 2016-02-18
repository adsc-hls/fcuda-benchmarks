#include <fcuda.h>
#include "bfs.h"
typedef int DATATYPE;
/*
   struct Node {
   int starting;
   int no_of_edges;
   };
   typedef struct Node Node;
 */
/*********************************************************************************
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

  The CUDA Kernel for Applying BFS on a loaded Graph. Created By Pawan Harish
 **********************************************************************************/
#pragma FCUDA GRID x_dim=512
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=g_graph_nodes port_id=0 data_pack=yes
#pragma FCUDA PORTMERGE remove_port_name=g_graph_edges port_id=1
#pragma FCUDA PORTMERGE remove_port_name=g_cost port_id=1
#pragma FCUDA PORTMERGE remove_port_name=g_graph_mask port_id=2
#pragma FCUDA PORTMERGE remove_port_name=g_updating_graph_mask port_id=2
#pragma FCUDA PORTMERGE remove_port_name=g_graph_visited port_id=2
__global__ void Kernel(Node* g_graph_nodes, int* g_graph_edges, DATATYPE* g_graph_mask, DATATYPE* g_updating_graph_mask, DATATYPE *g_graph_visited, int* g_cost, int no_of_nodes)
{
#pragma FCUDA COMPUTE begin name=computek1 cores=[1] unroll=1
  int tid = blockIdx.x*blockDim.x + threadIdx.x;
  int i;
  if( tid<no_of_nodes && g_graph_mask[tid])
  {
    g_graph_mask[tid]=0;//false;
    //int starting = g_graph_nodes[tid].starting;
    //int no_of_edges = g_graph_nodes[tid].no_of_edges;
    //i = g_graph_nodes[tid].starting;
    //while (i < g_graph_nodes[tid].no_of_edges + g_graph_nodes[tid].starting)
    for (i = g_graph_nodes[tid].starting; i < g_graph_nodes[tid].no_of_edges + g_graph_nodes[tid].starting; i++)
    {
      int id = g_graph_edges[i];
      if(!g_graph_visited[id])
      {
        g_cost[id]=g_cost[tid]+1;
        g_updating_graph_mask[id]=1;//true;
      }
      //i++;
    }
  }
#pragma FCUDA COMPUTE end name=computek1 cores=[1] unroll=1
}


#pragma FCUDA GRID x_dim=512
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=g_graph_mask port_id=2
#pragma FCUDA PORTMERGE remove_port_name=g_updating_graph_mask port_id=2
#pragma FCUDA PORTMERGE remove_port_name=g_graph_visited port_id=2
#pragma FCUDA PORTMERGE remove_port_name=g_over port_id=2
  __global__ void
Kernel2( DATATYPE* g_graph_mask, DATATYPE *g_updating_graph_mask, DATATYPE* g_graph_visited, DATATYPE *g_over, int no_of_nodes)
{
#pragma FCUDA COMPUTE begin name=computek1 cores=[1] unroll=1
  int tid = blockIdx.x*blockDim.x + threadIdx.x;
  if( tid<no_of_nodes && g_updating_graph_mask[tid])
  {

    g_graph_mask[tid]=1;//true;
    g_graph_visited[tid]=1;//true;
    *g_over=1;//true;
    g_updating_graph_mask[tid]=0;//false;
  }
#pragma FCUDA COMPUTE end name=computek1 cores=[1] unroll=1
}
