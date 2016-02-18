#include <fcuda.h>
/*-------------------------------------------------------
 ** Fan1() -- Calculate multiplier matrix
 ** Pay attention to the index.  Index i give the range
 ** which starts from 0 to range-1.  The real values of
 ** the index should be adjust and related with the value
 ** of t which is defined on the ForwardSub().
 **-------------------------------------------------------
 */
#pragma FCUDA GRID x_dim=512
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=m_cuda port_id=0
#pragma FCUDA PORTMERGE remove_port_name=a_cuda port_id=0
__global__ void Fan1(float *m_cuda, float *a_cuda, int Size, int t)
{
#pragma FCUDA COMPUTE cores=[1] begin name=cmp_fan1 unroll=1
  int index = threadIdx.x + blockIdx.x * blockDim.x;
  if (index < Size-1 - t) {
    //*(m_cuda + (Size * (index + t + 1) + t)) = *(a_cuda + (Size*(index + t + 1) + t)) / *(a_cuda + (Size * t + t));
    m_cuda[Size * (index + t + 1) + t] = a_cuda[Size * (index + t + 1) + t] / a_cuda[Size * t + t];
  }
#pragma FCUDA COMPUTE cores=[1] end name=cmp_fan1 unroll=1
}

#pragma FCUDA GRID x_dim=512 y_dim=512
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=m_cuda port_id=0
#pragma FCUDA PORTMERGE remove_port_name=a_cuda port_id=0
#pragma FCUDA PORTMERGE remove_port_name=b_cuda port_id=0
__global__ void Fan2(float *m_cuda, float *a_cuda, float *b_cuda,int Size, int j1, int t)
{
#pragma FCUDA COMPUTE cores=[1] begin name=cmp_fan2 unroll=1
  int xidx = blockIdx.x * blockDim.x + threadIdx.x;
  int yidx = blockIdx.y * blockDim.y + threadIdx.y;

  if(xidx < Size-1-t) {
    //return;
    //}
    if(yidx < Size-t) {
      //return;
      //}
      a_cuda[Size*(xidx+1+t)+(yidx+t)] -= m_cuda[Size*(xidx+1+t)+t] * a_cuda[Size*t+(yidx+t)];
  if(yidx == 0) {
    b_cuda[xidx+1+t] -= m_cuda[Size*(xidx+1+t)+(yidx+t)] * b_cuda[t];
  }
}
}
#pragma FCUDA COMPUTE cores=[1] end name=cmp_fan2 unroll=1
}

