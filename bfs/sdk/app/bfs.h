#include <fcuda.h>
typedef int DATATYPE;

struct Node
{
	int starting;
	int no_of_edges;
};

typedef struct Node Node;

void Kernel(Node* g_graph_nodes, int* g_graph_edges, int* g_graph_mask,
		int* g_updating_graph_mask, int *g_graph_visited,
		int* g_cost, int no_of_nodes, dim3 gridDim, dim3 blockDim,
                int num_cores, int core_id);

void Kernel2(int* g_graph_mask, int *g_updating_graph_mask,
	      int* g_graph_visited, int *g_over,
	      int no_of_nodes, dim3 gridDim, dim3 blockDim,
              int num_cores, int core_id);

