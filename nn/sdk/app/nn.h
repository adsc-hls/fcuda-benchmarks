#ifndef _NN_H_
#define _NN_H_
struct latLong
{
float lat;
float lng;
};

typedef struct latLong LatLong;
void euclid(LatLong * d_locations, float * d_distances,
		int numRecords, float lat, float lng,
		dim3 gridDim, dim3 blockDim,
                int num_cores, int core_id);

#endif
