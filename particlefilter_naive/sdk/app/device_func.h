#ifndef _DEVICE_FUNC_H_
#define _DEVICE_FUNC_H_

#include <math.h>
#include <fcuda.h>
void kernel(double * arrayX, double * arrayY, double * CDF,
	double * u, double * xj, double * yj, int Nparticles, dim3 gridDim, dim3 blockDim);

int findIndexSeq(double * CDF, int lengthCDF, double value);
int findIndexBin(double * CDF, int beginIndex, int endIndex, double value);
#endif
