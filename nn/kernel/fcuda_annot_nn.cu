#include <fcuda.h>
#include <math.h>
#include "nn.h"
/**
 * Kernel
 * Executed on GPU
 * Calculates the Euclidean distance from each record in the database to the target position
 */
#pragma FCUDA GRID x_dim=256 y_dim=256
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=d_locations port_id=0 data_pack=yes
#pragma FCUDA PORTMERGE remove_port_name=d_distances port_id=1
__global__ void euclid(LatLong *d_locations, float *d_distances, int numRecords,float lat, float lng)
{
#pragma FCUDA COMPUTE cores=[1] name=compute begin unroll=1 mpart=1 array_split=[]
  int globalId = blockDim.x * ( gridDim.x * blockIdx.y + blockIdx.x ) + threadIdx.x;
  LatLong *latLong = &d_locations[globalId];
  if (globalId < numRecords) {
    float *dist=&d_distances[globalId];
    *dist = (float)sqrt((lat-latLong->lat)*(lat-latLong->lat)+(lng-latLong->lng)*(lng-latLong->lng));
  }
#pragma FCUDA COMPUTE cores=[1] name=compute end unroll=1 mpart=1 array_split=[]
}
