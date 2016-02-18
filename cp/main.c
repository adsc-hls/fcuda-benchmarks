/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/
/*
 * CUDA accelerated coulombic potential grid test code
 *   John E. Stone <johns@ks.uiuc.edu>
 *   http://www.ks.uiuc.edu/~johns/
 *
 * Coulombic potential grid calculation microbenchmark based on the time
 * consuming portions of the 'cionize' ion placement tool.
 */

#include "parboil.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "cuenergy.h"
#include "cenergy.c"
#define EPSILON 0.1
/* initatoms()
 * Store a pseudorandom arrangement of point charges in *atombuf.
 */
float atomdata[4 * ATOMCOUNT];
static int initatoms(float **atombuf, int count, dim3 volsize, float gridspacing) {
  dim3 size;
  int i;
  float *atoms;

  srand(54321); // Ensure that atom placement is repeatable
  atoms = (float *) malloc(count * 4 * sizeof(float));
  *atombuf = atoms;

  // compute grid dimensions in angstroms
  size.x = gridspacing * volsize.x;
  size.y = gridspacing * volsize.y;
  size.z = gridspacing * volsize.z;

  for (i=0; i<count; i++) {
    int addr = i * 4;
    atoms[addr    ] = (rand() / (float) RAND_MAX) * size.x;
    atoms[addr + 1] = (rand() / (float) RAND_MAX) * size.y;
    atoms[addr + 2] = (rand() / (float) RAND_MAX) * size.z;
    atoms[addr + 3] = ((rand() / (float) RAND_MAX) * 2.0) - 1.0;  // charge
  }
  return 0;
}

/* writeenergy()
 * Write part of the energy array to an output file for verification.
 */
static int writeenergy(char *filename, float *energy, dim3 volsize)
{
  FILE *outfile;
  int x, y;

  outfile = fopen(filename, "w");
  if (outfile == NULL) {
    fputs("Cannot open output file\n", stderr);
    return -1;
  }

  /* Print the execution parameters */
  fprintf(outfile, "%d %d %d %d\n", volsize.x, volsize.y, volsize.z, ATOMCOUNT);

  /* Print a checksum */
  double sum = 0.0;

  for (y = 0; y < volsize.y; y++) {
    for (x = 0; x < volsize.x; x++) {
      double t = energy[y*volsize.x+x];
      t = fmax(-20.0, fmin(20.0, t));
      sum += t;
    }
  }
  fprintf(outfile, "%.4g\n", sum);

  /* Print several rows of the computed data */
  for (y = 0; y < volsize.y; y++) {
    for (x = 0; x < volsize.x; x++) {
      int addr = y * volsize.x + x;
      fprintf(outfile, "%.4g\n", energy[addr]);
    }
    //fprintf(outfile, "\n");
  }

  fclose(outfile);
  return 0;
}

static int test_output(char *filename, float *energy, dim3 volsize)
{
  int x, y;
  FILE *goldfile = fopen(filename, "r");
  if (goldfile == NULL) {
    fputs("Cannot open gold file\n", stderr);
    return 0;
  }

  /* Check the execution parameters */
  int gold_volsize_x, gold_volsize_y, gold_volsize_z, gold_atomcount;
  fscanf(goldfile, "%d %d %d %d\n", &gold_volsize_x, &gold_volsize_y, &gold_volsize_z, &gold_atomcount);
  if (gold_volsize_x != volsize.x || gold_volsize_y != volsize.y || gold_volsize_z != volsize.z ||
      gold_atomcount != ATOMCOUNT) {

    printf("Execution parameters mismatched.\n");
    return 0;	
  }

  /* Check checksum */
  double sum = 0.0;
  for (y = 0; y < volsize.y; y++) {
    for (x = 0; x < volsize.x; x++) {
      double t = energy[y*volsize.x+x];
      t = fmax(-20.0, fmin(20.0, t));
      sum += t;
    }
  }
  double gold_sum;
  fscanf(goldfile, "%lf\n", &gold_sum);
  double diff_sum = sum - gold_sum;

  if (diff_sum > EPSILON || diff_sum < -EPSILON) {
    printf("Checksum mismatched.\n");
    return 0;
  }

  /* Check the computed data */
  double gold_energy, energy_diff;
  for (y = 0; y < volsize.y; y++) {
    for (x = 0; x < volsize.x; x++) {
      int addr = y * volsize.x + x;
      fscanf(goldfile, "%lf\n", &gold_energy);
      energy_diff = energy[addr] - gold_energy;
      if (diff_sum > EPSILON || energy_diff < -EPSILON) {
        printf("Data mismatched.\n");
        return 0;
      }
    }
  }

  fclose(goldfile);
  return 1;
}

static int compare_output(float *cpu_energy, float *energy, dim3 volsize)
{
  int x, y;

  /* Check the computed data */
  double gold_energy, energy_diff;
  for (y = 0; y < volsize.y; y++) {
    for (x = 0; x < volsize.x; x++) {
      int addr = y * volsize.x + x;
      energy_diff = energy[addr] - cpu_energy[addr];
      if (energy_diff > EPSILON || energy_diff < -EPSILON) {
        printf("Data mismatched at %d: cpu = %f, result = %f.\n", addr,
            cpu_energy[addr], energy[addr]);
        return 0;
      }
    }
  }
  return 1;
}

int main(int argc, char** argv) {

  struct pb_TimerSet timers;
  struct pb_Parameters *parameters;

  float *energy = NULL;		// Output of device calculation
  float *atoms = NULL;
  dim3 volsize, Gsz, Bsz;

  // number of atoms to simulate
  int atomcount = ATOMCOUNT;

  // voxel spacing
  const float gridspacing = 0.1;

  // Size of buffer on GPU
  int volmemsz;

  printf("CUDA accelerated coulombic potential microbenchmark\n");
  printf("Original version by John E. Stone <johns@ks.uiuc.edu>\n");
  printf("This version maintained by Chris Rodrigues\n");

  parameters = pb_ReadParameters(&argc, argv);
  if (!parameters)
    return -1;

  if (parameters->inpFiles[0]) {
    fputs("No input files expected\n", stderr);
    return -1;
  }

  pb_InitializeTimerSet(&timers);
  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  // setup energy grid size
  volsize.x = VOLSIZEX;
  volsize.y = VOLSIZEY;
  volsize.z = 1;

  // setup CUDA grid and block sizes
  Bsz.x = BLOCKSIZEX;			// each thread does multiple Xs
  Bsz.y = BLOCKSIZEY;
  Bsz.z = 1;
  Gsz.x = volsize.x / (Bsz.x * UNROLLX); // each thread does multiple Xs
  Gsz.y = volsize.y / Bsz.y;
  Gsz.z = volsize.z / Bsz.z;

  printf("Grid size: %d x %d x %d\n", volsize.x, volsize.y, volsize.z);
  printf("Running kernel(atoms:%d, gridspacing %g, z %d)\n", atomcount, gridspacing, 0);

  // allocate and initialize atom coordinates and charges
  if (initatoms(&atoms, atomcount, volsize, gridspacing))
    return -1;

  // allocate and initialize the GPU output array
  int volsz = volsize.x * volsize.y * volsize.z;
  volmemsz = sizeof(float) * volsz;

  // Main computation
  float *d_output = NULL;	// Output on device
  float *d_input = NULL;
  int iterations=0;
  int atomstart;

  pb_SwitchToTimer(&timers, pb_TimerID_COPY);

  d_output = (float*)malloc(volmemsz);
  d_input = (float*)malloc(volmemsz);
  memset(d_output, 0, volmemsz);
  memset(d_input, 0, volmemsz);

  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
  int runatoms;
  for (atomstart = 0; atomstart < atomcount; atomstart += MAXATOMS) {
    int atomsremaining = atomcount - atomstart;
    runatoms = (atomsremaining > MAXATOMS) ? MAXATOMS : atomsremaining;
    iterations++;

    // copy the atoms to the GPU
    if (copyatomstoconstbuf(atoms + 4 * atomstart, runatoms, 0*gridspacing, atomstart))
      return -1;
  }

  cenergy_Stream(atomdata, runatoms, 0.1, d_output, Gsz, Bsz, 1, 0);

  float *cpu_output = (float*)malloc(volmemsz);
  memset(cpu_output, 0, volmemsz);
  cpuenergy(volsize, ATOMCOUNT, gridspacing, 0, atomdata, cpu_output);

  // Copy the GPU output data back to the host and use/store it..
  energy = (float *) malloc(volmemsz);
  pb_SwitchToTimer(&timers, pb_TimerID_COPY);
  memcpy(energy, d_output, volmemsz);

  int passed = compare_output(cpu_output, energy, volsize);

  free(d_output);
  free(d_input);
  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);


  /* Print a subset of the results to a file */
  pb_SwitchToTimer(&timers, pb_TimerID_IO);
  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  free(atoms);
  free(energy);
  free(cpu_output);

  pb_SwitchToTimer(&timers, pb_TimerID_NONE);
  pb_PrintTimerSet(&timers);
  pb_FreeParameters(parameters);

  if (passed == 0) {
    printf("FAILED.\n");
    return 1;
  } else {
    printf("PASSED.\n");
    return 0;
  }

}

int copyatomstoconstbuf(DATATYPE *atoms, int count, DATATYPE zplane, int offset) {
  if (count > MAXATOMS) {
    printf("Atom count exceeds constant buffer storage capacity\n");
    return -1;
  }

  DATATYPE atompre[4*MAXATOMS];
  int i;
  for (i=0; i<count*4; i+=4) {
    atompre[i    ] = atoms[i    ];
    atompre[i + 1] = atoms[i + 1];
    DATATYPE dz = zplane - atoms[i + 2];
    atompre[i + 2]  = dz*dz;
    atompre[i + 3] = atoms[i + 3];
  }
  memcpy(atomdata +  4 * offset, atompre, count * 4 * sizeof(DATATYPE));
  return 0;
}

