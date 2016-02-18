#include <fcuda.h>
typedef int DATATYPE;

struct Node
{
  int starting;
  int no_of_edges;
};

typedef struct Node Node;

void Kernel(Node* g_graph_nodes, int* g_graph_edges, DATATYPE* g_graph_mask,
    DATATYPE* g_updating_graph_mask, DATATYPE *g_graph_visited,
    int* g_cost, int no_of_nodes, dim3 gridDim, dim3 blockDim,
    int num_cores, int core_id);

void Kernel2( DATATYPE* g_graph_mask, DATATYPE *g_updating_graph_mask,
    DATATYPE* g_graph_visited, DATATYPE *g_over,
    int no_of_nodes, dim3 gridDim, dim3 blockDim,
    int num_cores, int core_id);

