/*
 * Copyright 1993-2010 NVIDIA Corporation.  All rights reserved.
 *
 * Please refer to the NVIDIA end user license agreement (EULA) associated
 * with this source code for terms and conditions that govern your use of
 * this software. Any use, reproduction, disclosure, or distribution of
 * this software and related documentation outside the terms of the EULA
 * is strictly prohibited.
 *
 */

/**
 **************************************************************************
 * \file dct8x8_kernel1.cu
 * \brief Contains 1st CUDA implementations of DCT, IDCT and quantization routines, 
 *        used in JPEG internal data processing. Device code.
 *
 * This code implements first CUDA versions of forward and inverse Discrete Cosine 
 * Transform to blocks of image pixels (of 8x8 size), as in JPEG standard. The data 
 * processing is done using DATATYPEing point representation.
 * The routine that performs quantization of coefficients can be found in 
 * dct8x8_kernel_quantization.cu file.
 */
#include <stdio.h>
#include <fcuda.h>

//#include "Common.h"
/**
 *  The dimension of pixels block
 */
#define BLOCK_SIZE			8

/**
 *  Square of dimension of pixels block
 */
#define BLOCK_SIZE2			64

/**
 *  log_2{BLOCK_SIZE), used for quick multiplication or division by the 
 *  pixels block dimension via shifting
 */
#define BLOCK_SIZE_LOG2		3

/**
 *  log_2{BLOCK_SIZE*BLOCK_SIZE), used for quick multiplication or division by the 
 *  square of pixels block via shifting
 */
#define BLOCK_SIZE2_LOG2	6

/**
 *  Wrapper to the fastest integer multiplication function on CUDA
 */
#ifdef __MUL24_FASTER_THAN_ASTERIX
#define FMUL(x,y)	(__mul24(x,y))
#else
#define FMUL(x,y)	((x)*(y))
#endif


/**
 *  This unitary matrix performs discrete cosine transform of rows of the matrix to the left
 */
/*
   __constant__ DATATYPE DCTv8matrix[] = {
   0.3535533905932738f,  0.4903926402016152f,  0.4619397662556434f,  0.4157348061512726f,  0.3535533905932738f,  0.2777851165098011f,  0.1913417161825449f,  0.0975451610080642f, 
   0.3535533905932738f,  0.4157348061512726f,  0.1913417161825449f, -0.0975451610080641f, -0.3535533905932737f, -0.4903926402016152f, -0.4619397662556434f, -0.2777851165098011f, 
   0.3535533905932738f,  0.2777851165098011f, -0.1913417161825449f, -0.4903926402016152f, -0.3535533905932738f,  0.0975451610080642f,  0.4619397662556433f,  0.4157348061512727f, 
   0.3535533905932738f,  0.0975451610080642f, -0.4619397662556434f, -0.2777851165098011f,  0.3535533905932737f,  0.4157348061512727f, -0.1913417161825450f, -0.4903926402016153f, 
   0.3535533905932738f, -0.0975451610080641f, -0.4619397662556434f,  0.2777851165098009f,  0.3535533905932738f, -0.4157348061512726f, -0.1913417161825453f,  0.4903926402016152f, 
   0.3535533905932738f, -0.2777851165098010f, -0.1913417161825452f,  0.4903926402016153f, -0.3535533905932733f, -0.0975451610080649f,  0.4619397662556437f, -0.4157348061512720f, 
   0.3535533905932738f, -0.4157348061512727f,  0.1913417161825450f,  0.0975451610080640f, -0.3535533905932736f,  0.4903926402016152f, -0.4619397662556435f,  0.2777851165098022f, 
   0.3535533905932738f, -0.4903926402016152f,  0.4619397662556433f, -0.4157348061512721f,  0.3535533905932733f, -0.2777851165098008f,  0.1913417161825431f, -0.0975451610080625f
   };
 */



/**
 **************************************************************************
 *  Performs 1st implementation of 8x8 block-wise Forward Discrete Cosine Transform of the given 
 *  image plane and outputs result to the array of coefficients.
 *
 * \param Dst			[OUT] - Coefficients plane
 * \param ImgWidth		[IN] - Stride of Dst
 * \param OffsetXBlocks	[IN] - Offset along X in blocks from which to perform processing
 * \param OffsetYBlocks	[IN] - Offset along Y in blocks from which to perform processing
 *  
 * \return None
 */
#define GRID_X 2
#define GRID_Y 2
#define SIZE_SRC (GRID_X * GRID_Y * 8 * 8)
#define SIZE_DST (512 * GRID_Y + 8 * GRID_X - 64)
#define SIZE (64 + SIZE_SRC + SIZE_DST)

typedef int DATATYPE;


#define ImgWidth 64
//int OffsetXBlocks
//int OffsetYBlocks

#pragma FCUDA GRID x_dim=8 y_dim=8  
#pragma FCUDA COREINFO num_cores=1 pipeline=no
#pragma FCUDA PORTMERGE remove_port_name=dct_const port_id=0
#pragma FCUDA PORTMERGE remove_port_name=TexSrc port_id=0
#pragma FCUDA PORTMERGE remove_port_name=Dst port_id=0
__global__ void InvDCT(DATATYPE *Dst, DATATYPE *TexSrc, DATATYPE *dct_const)
{

  // Temporary blocks
  __shared__ DATATYPE CurBlockLocal1[BLOCK_SIZE2];
  __shared__ DATATYPE CurBlockLocal2[BLOCK_SIZE2];
  //#pragma FCUDA PORTMERGE remove_port_name=DCTv8matrix
  __shared__ DATATYPE DCTv8matrix[BLOCK_SIZE2];
#pragma FCUDA COMPUTE begin name=compute
  // Block index
  int bx;
  bx = blockIdx.x;
  int by;
  by= blockIdx.y;

  // Thread index (current coefficient)
  int tx;
  tx = threadIdx.x;
  int ty;
  ty = threadIdx.y;

  int i;
  i = BLOCK_SIZE * ty + tx;

  DCTv8matrix[i] = dct_const[i];
  __syncthreads();

  // Texture coordinates
  int tex_x;
  tex_x = ( (bx << BLOCK_SIZE_LOG2) + tx );// + 0.5f;
  int tex_y;
  tex_y = ( (by << BLOCK_SIZE_LOG2) + ty );// + 0.5f;

  int offset;
  int j;
  offset = ((by*(gridDim.x*BLOCK_SIZE2))+(bx*BLOCK_SIZE2));
  j = BLOCK_SIZE*ty + tx;
  //copy current image pixel to the first block
  CurBlockLocal1[ (ty << BLOCK_SIZE_LOG2) + tx ] = TexSrc[offset + j]; //tex2D(TexSrc, tex_x, tex_y);

  //synchronize threads to make sure the block is copied
  __syncthreads();

  //calculate the multiplication of DCTv8matrixT * A and place it in the second block
  DATATYPE curelem;
  curelem = 0.0;
  int DCTv8matrixIndex;
  DCTv8matrixIndex = (ty << BLOCK_SIZE_LOG2) + 0;
  int CurBlockLocal1Index;
  CurBlockLocal1Index = 0 * BLOCK_SIZE + tx;

  for (i=0; i<BLOCK_SIZE; i++)
  {
    curelem = curelem + DCTv8matrix[DCTv8matrixIndex] * CurBlockLocal1[CurBlockLocal1Index];
    DCTv8matrixIndex += 1;
    CurBlockLocal1Index += BLOCK_SIZE;
  }
  CurBlockLocal2[ (ty << BLOCK_SIZE_LOG2) + tx ] = curelem;

  //synchronize threads to make sure the first 2 matrices are multiplied and the result is stored in the second block
  __syncthreads();


  //calculate the multiplication of (DCTv8matrixT * A) * DCTv8matrix and place it in the first block
  curelem = 0;
  int CurBlockLocal2Index;
  CurBlockLocal2Index = (ty << BLOCK_SIZE_LOG2) + 0;
  DCTv8matrixIndex = (tx << BLOCK_SIZE_LOG2) + 0;

  for (i=0; i<BLOCK_SIZE; i++)
  {
    curelem += CurBlockLocal2[CurBlockLocal2Index] * DCTv8matrix[DCTv8matrixIndex];
    CurBlockLocal2Index += 1;
    DCTv8matrixIndex += 1;
  }
  CurBlockLocal1[ (ty << BLOCK_SIZE_LOG2) + tx ] = curelem;

  //synchronize threads to make sure the matrices are multiplied and the result is stored back in the first block
  __syncthreads();

  //copy current coefficient to its place in the result array
  Dst[ FMUL(((by << BLOCK_SIZE_LOG2) + ty), ImgWidth) + ((bx << BLOCK_SIZE_LOG2) + tx) ] = CurBlockLocal1[ (ty << BLOCK_SIZE_LOG2) + tx ];
#pragma FCUDA COMPUTE end name=compute
}
