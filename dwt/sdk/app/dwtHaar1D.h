#ifndef _DWT_H_
#define _DWT_H_

#define INV_SQRT_2 0.70710678118654752440f
//const unsigned int  LOG_NUM_BANKS = 4;
#define LOG_NUM_BANKS 4
//const unsigned int  NUM_BANKS     = 16;
#define NUM_BANKS 16

typedef float DATATYPE;
///*
void dwtHaar1D(DATATYPE *id, DATATYPE *od, DATATYPE *approx_final,
		const unsigned int dlevels,
		const unsigned int slength_step_half,
		const int bdim,
		dim3 gridDim, dim3 blockDim, int num_cores, int core_id);
//*/
//void dwthaar1d(DATATYPE *memport, int core_id);
#endif

