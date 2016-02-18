#include <fcuda.h>
#include "device_func.h"

/*****************************
* CUDA Kernel Function to replace FindIndex
* param1: arrayX
* param2: arrayY
* param3: CDF
* param4: u
* param5: xj
* param6: yj
* param7: Nparticles
*****************************/
#pragma FCUDA GRID x_dim=128
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=arrayX port_id=0 offset=0
#pragma FCUDA PORTMERGE remove_port_name=arrayY port_id=0 offset=0
#pragma FCUDA PORTMERGE remove_port_name=CDF port_id=0 offset=0
#pragma FCUDA PORTMERGE remove_port_name=u port_id=0 offset=0
#pragma FCUDA PORTMERGE remove_port_name=xj port_id=0 offset=0
#pragma FCUDA PORTMERGE remove_port_name=yj port_id=0 offset=0
__global__ void kernel(double * arrayX, double * arrayY, double * CDF, double * u, double * xj, double * yj, int Nparticles){

#pragma FCUDA COMPUTE begin name=compute cores=[1] unroll=1 mpart=1 array_split=[]
	int block_id = blockIdx.x;// + gridDim.x * blockIdx.y;
	int i = blockDim.x * block_id + threadIdx.x;

	if(i < Nparticles){

		int index = -1;
		int x;
                int stop = 0;
		for(x = 0; x < Nparticles; x++){
			if(stop == 0 && CDF[x] >= u[i]){
				index = x;
				//break; // Tan: Vivado 2015.4 seems to have an issue with
                                         // break statement here, hence replace this with
                                         // the variable "stop"
                                stop = 1;
			}
		}
		if(index == -1){
			index = Nparticles-1;
		}

		xj[i] = arrayX[index];
		yj[i] = arrayY[index];
	}
#pragma FCUDA COMPUTE end name=compute cores=[1] unroll=1 mpart=1 array_split=[]
}


