/*
 * nn.cu
 * Nearest Neighbor
 *
 */

#include <stdio.h>
#include <sys/time.h>
#include <float.h>
#include <vector>
#include <string.h>
#include <fcuda.h>
#include "nn.h"

#include "data/cane4_0.h"
#include "data/cane4_1.h"
#include "data/cane4_2.h"
#include "data/cane4_3.h"

#include "xil_cache.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "hardware_timer.h"
#include "xfcuda.h"
#define HW
#define VERBOSE
#define min( a, b )			a > b ? b : a
#define ceilDiv( a, b )		( a + b - 1 ) / b
#define print( x )			printf( #x ": %lu\n", (unsigned long) x )
#define DEBUG				false

#define DEFAULT_THREADS_PER_BLOCK 256

#define MAX_ARGS 10
#define REC_LENGTH 53 // size of a record in db
#define LATITUDE_POS 28	// character position of the latitude value in each record
#define OPEN 10000	// initial value of nearest neighbors

/*
   typedef struct latLong
   {
   float lat;
   float lng;
   } LatLong;
   */
typedef struct record
{
  char recString[REC_LENGTH];
  float distance;
} Record;

int loadData(char *filename,std::vector<Record> &records,std::vector<LatLong> &locations);
//int loadData(char *filename, Record *records, LatLong *locations);
void findLowest(std::vector<Record> &records,float *distances,int numRecords,int topN);
//void findLowest(Record *records,float *distances,int numRecords,int topN);
void printUsage();
int parseCommandline(int argc, char *argv[], char* filename,int *r,float *lat,float *lng,
    int *q, int *t, int *p, int *d);

#define EPSILON 0.001f
int test_output(char *filename, std::vector<Record> records, int resultsCount)
{
  int i;
  FILE *gold_file = fopen(filename, "r");

  if (gold_file == NULL) {
    printf("Cannot open file.\n");
    return 0;
  }

  char buffer[100];
  char gold_string[100];
  float gold_distance;

  for (i = 0; i < resultsCount; i++) {
    if (feof(gold_file)) {
      printf("Unexpected end of file.\n");
      return 0;
    }
    fgets(gold_string, 49, gold_file);
    fgetc(gold_file); // newline
    fgets(buffer, sizeof(buffer), gold_file);
    sscanf(buffer, "%f\n", &gold_distance);
    printf("%s %f\n", gold_string, gold_distance);
    if (strcmp(gold_string, records[i].recString) != 0) {
      printf("Record string at %d does not match: gold = %s, result = %s\n",
          i, gold_string, records[i].recString);
      return 0;
    }

    if (gold_distance - records[i].distance < -EPSILON ||
        gold_distance - records[i].distance > EPSILON) {
      printf("Record distance at %d is inaccurate: gold = %f, result = %f\n",
          i, gold_distance, records[i].distance);
      return 0;
    }
  }
  return 1;
}

/**
 * Kernel
 * Executed on GPU
 * Calculates the Euclidean distance from each record in the database to the target position
 */
/*__global__ void euclid(LatLong *d_locations, float *d_distances, int numRecords,float lat, float lng)
  {
//int globalId = gridDim.x * blockDim.x * blockIdx.y + blockDim.x * blockIdx.x + threadIdx.x;
int globalId = blockDim.x * ( gridDim.x * blockIdx.y + blockIdx.x ) + threadIdx.x; // more efficient
LatLong *latLong = d_locations+globalId;
if (globalId < numRecords) {
float *dist=d_distances+globalId;
 *dist = (float)sqrt((lat-latLong->lat)*(lat-latLong->lat)+(lng-latLong->lng)*(lng-latLong->lng));
 }
 }
 */
/**
 * This program finds the k-nearest neighbors
 **/

int main(int argc, char* argv[])
{
  printf("Starting ...\n");

  init_timer(timer_ctrl, timer_counter_l, timer_counter_h);
  start_timer(timer_ctrl);

  int    i=0;
  float lat, lng;
  int quiet=0,timing=0,platform=0,device=0;

#ifdef HW
  int Status, done;
  XFcuda xcore;

  Status = XFcuda_Initialize(&xcore, 0);
  if (Status != XST_SUCCESS) {
    xil_printf("Initialization failed %d\r\n", 0);
    exit(1);
  }
#endif

  std::vector<Record> records;
  //Record *records = (Record *)0x10000000;
  std::vector<LatLong> locations;
  //LatLong *locations = (LatLong *)0x11000000;
  char filename[100];
  int resultsCount=10;

  // parse command line
  /*if (parseCommandline(argc, argv, filename,&resultsCount,&lat,&lng,
    &quiet, &timing, &platform, &device)) {
    printUsage();
    return 0;
    }
    */
  resultsCount = 5;
  lat = 30;
  lng = 90;

  int numRecords = loadData(filename,records,locations);
  if (resultsCount > numRecords) resultsCount = numRecords;
  //for(i=0;i<numRecords;i++)
  //  printf("%s, %f, %f\n",(records[i].recString),locations[i].lat,locations[i].lng);


  //Pointers to host memory
  float *distances;
  //Pointers to device memory
  LatLong *d_locations;
  float *d_distances;


  // Scaling calculations - added by Sam Kauffman
  //cudaDeviceProp deviceProp;
  //cudaGetDeviceProperties( &deviceProp, 0 );
  //cudaThreadSynchronize();
  unsigned long maxGridX = 2147483647;//deviceProp.maxGridSize[0];
  unsigned long threadsPerBlock = DEFAULT_THREADS_PER_BLOCK; //min( deviceProp.maxThreadsPerBlock, DEFAULT_THREADS_PER_BLOCK );
  //size_t totalDeviceMemory;
  //size_t freeDeviceMemory;
  //cudaMemGetInfo(  &freeDeviceMemory, &totalDeviceMemory );
  //cudaThreadSynchronize();
  //unsigned long usableDeviceMemory = freeDeviceMemory * 85 / 100; // 85% arbitrary throttle to compensate for known CUDA bug
  //unsigned long maxThreads = usableDeviceMemory / 12; // 4 bytes in 3 vectors per thread
  /*if ( numRecords > maxThreads )
    {
    fprintf( stderr, "Error: Input too large.\n" );
    exit( 1 );
    }*/
  unsigned long blocks = ceilDiv( numRecords, threadsPerBlock ); // extra threads will do nothing
  unsigned long gridY = ceilDiv( blocks, maxGridX );
  unsigned long gridX = ceilDiv( blocks, gridY );
  // There will be no more than (gridY - 1) extra blocks
  dim3 gridDim( gridX, gridY );
  /*
     if ( DEBUG )
     {
     print( totalDeviceMemory ); // 804454400
     print( freeDeviceMemory );
     print( usableDeviceMemory );
     print( maxGridX ); // 65535
     print( deviceProp.maxThreadsPerBlock ); // 1024
     print( threadsPerBlock );
     print( maxThreads );
     print( blocks ); // 130933
     print( gridY );
     print( gridX );
     }
     */
  /**
   * Allocate memory on host and device
   */
#ifdef VERBOSE
  printf("%d\n", numRecords);
#endif

  distances = (float *)malloc(sizeof(float) * numRecords);
  //cudaMalloc((void **) &d_locations,sizeof(LatLong) * numRecords);
  d_locations = (LatLong*)malloc(sizeof(LatLong) * numRecords);
  //cudaMalloc((void **) &d_distances,sizeof(float) * numRecords);
  d_distances = (float*)malloc(sizeof(float) * numRecords);

  /**
   * Transfer data from host to device
   */
  //cudaMemcpy( d_locations, &locations[0], sizeof(LatLong) * numRecords, cudaMemcpyHostToDevice);
  memcpy(d_locations, &locations[0], sizeof(LatLong) * numRecords);


#ifdef HW
  XFcuda_SetNumrecords(&xcore, numRecords);
  XFcuda_SetLat(&xcore, lat);
  XFcuda_SetLng(&xcore, lng);
  XFcuda_SetGriddim_x(&xcore, gridDim.x);
  XFcuda_SetGriddim_y(&xcore, gridDim.y);
  //XFcuda_SetGriddim_z(&xcore, gridDim.z);
  XFcuda_SetBlockdim_x(&xcore, DEFAULT_THREADS_PER_BLOCK);
  XFcuda_SetBlockdim_y(&xcore, 1);
  //XFcuda_SetBlockdim_z(&xcore, 1);
  XFcuda_SetD_locations_addr(&xcore, (int)d_locations / sizeof(LatLong));
  XFcuda_SetD_distances_addr(&xcore, (int)d_distances / sizeof(float));

  XFcuda_SetEn_fcuda1(&xcore, 1);
  Xil_DCacheDisable();

  XFcuda_Start(&xcore);
  while (!XFcuda_IsDone(&xcore));

  Xil_DCacheEnable();
#else
  /**
   * Execute kernel
   */
  //euclid<<< gridDim, threadsPerBlock >>>(d_locations,d_distances,numRecords,lat,lng);
  euclid(d_locations, d_distances, numRecords, lat, lng, gridDim, threadsPerBlock, 1, 0);
  //cudaThreadSynchronize();
#endif

  //Copy data from device memory to host memory
  //cudaMemcpy( distances, d_distances, sizeof(float)*numRecords, cudaMemcpyDeviceToHost );
  memcpy(distances, d_distances, sizeof(float)*numRecords);
  // find the resultsCount least distances
  findLowest(records,distances,numRecords,resultsCount);

#ifdef VERBOSE
  // print out results
  //if (!quiet)
  for(i=0;i<resultsCount;i++) {
    printf("%s --> Distance=%f\n",records[i].recString,records[i].distance);
  }
#endif
  /*
     int passed = test_output("cuda/gold_output.txt", records, resultsCount);

     if (passed == 1)
     printf("PASSED.\n");
     else
     printf("FAILED.\n");
     */
  free(distances);
  //Free memory
  //cudaFree(d_locations);
  //cudaFree(d_distances);
  free(d_locations);
  free(d_distances);

  stop_timer(timer_ctrl);
  printf("Execution time %lld us\n\r", elapsed_time());
}

int loadData(char *filename,std::vector<Record> &records,std::vector<LatLong> &locations){
  //int loadData(char *filename, Record *records, LatLong *locations){
  FILE   *flist,*fp;
  int    i=0;
  char dbname[64];
  int recNum=0;

  /**Main processing **/

  //flist = fopen(filename, "r");
  int index = 0;
  //while(!feof(flist)) {
  while (index < 4) {
    /**
     * Read in all records of length REC_LENGTH
     * If this is the last file in the filelist, then done
     * else open next file to be read next iteration
     */

    //if(fscanf(flist, "%s\n", dbname) != 1) {
    //fprintf(stderr, "error reading filelist\n");
    //exit(0);
    //}
    //fp = fopen(dbname, "r");
    //if(!fp) {
    //printf("error opening a db\n");
    //exit(1);
    //}


    // read each record
    //while(!feof(fp)){
    for (int j = 0; j < 10692; j++) {
      Record record;
      LatLong latLong;

      //fgets(record.recString,49,fp);
      //fgetc(fp); // newline
      //if (feof(fp)) break;
      if (index == 0)
        strcpy(record.recString, cane4_0[j]);
      else if (index == 1)
        strcpy(record.recString, cane4_1[j]);
      else if (index == 2)
        strcpy(record.recString, cane4_2[j]);
      else
        strcpy(record.recString, cane4_3[j]);

      // parse for lat and long
      char substr[6];

      for(i=0;i<5;i++) substr[i] = *(record.recString+i+28);
      substr[5] = '\0';
      latLong.lat = atof(substr);

      for(i=0;i<5;i++) substr[i] = *(record.recString+i+33);
      substr[5] = '\0';
      latLong.lng = atof(substr);

      locations.push_back(latLong);
      records.push_back(record);
      //locations[recNum] = latLong;
      //records[recNum] = record;
      recNum++;
    }

    index++;
    //fclose(fp);
  }

  //fclose(flist);
  //    for(i=0;i<rec_count*REC_LENGTH;i++) printf("%c",sandbox[i]);
  return recNum;
  }

  void findLowest(std::vector<Record> &records,float *distances,int numRecords,int topN){
    //void findLowest(Record *records,float *distances,int numRecords,int topN){
    int i,j;
    float val;
    int minLoc;
    Record *tempRec;
    float tempDist;

    for(i=0;i<topN;i++) {
      minLoc = i;
      for(j=i;j<numRecords;j++) {
        val = distances[j];
        if (val < distances[minLoc]) minLoc = j;
      }
      // swap locations and distances
      tempRec = &records[i];
      records[i] = records[minLoc];
      records[minLoc] = *tempRec;

      tempDist = distances[i];
      distances[i] = distances[minLoc];
      distances[minLoc] = tempDist;

      // add distance to the min we just found
      records[i].distance = distances[i];
    }
  }

  int parseCommandline(int argc, char *argv[], char* filename,int *r,float *lat,float *lng,
      int *q, int *t, int *p, int *d){
    int i;
    if (argc < 2) return 1; // error
    strncpy(filename,argv[1],100);
    char flag;

    for(i=1;i<argc;i++) {
      if (argv[i][0]=='-') {// flag
        flag = argv[i][1];
        switch (flag) {
          case 'r': // number of results
            i++;
            *r = atoi(argv[i]);
            break;
          case 'l': // lat or lng
            if (argv[i][2]=='a') {//lat
              *lat = atof(argv[i+1]);
            }
            else {//lng
              *lng = atof(argv[i+1]);
            }
            i++;
            break;
          case 'h': // help
            return 1;
          case 'q': // quiet
            *q = 1;
            break;
          case 't': // timing
            *t = 1;
            break;
          case 'p': // platform
            i++;
            *p = atoi(argv[i]);
            break;
          case 'd': // device
            i++;
            *d = atoi(argv[i]);
            break;
        }
      }
    }
    if ((*d >= 0 && *p<0) || (*p>=0 && *d<0)) // both p and d must be specified if either are specified
      return 1;
    return 0;
  }

  void printUsage(){
    printf("Nearest Neighbor Usage\n");
    printf("\n");
    printf("nearestNeighbor [filename] -r [int] -lat [float] -lng [float] [-hqt] [-p [int] -d [int]]\n");
    printf("\n");
    printf("example:\n");
    printf("$ ./nearestNeighbor filelist.txt -r 5 -lat 30 -lng 90\n");
    printf("\n");
    printf("filename     the filename that lists the data input files\n");
    printf("-r [int]     the number of records to return (default: 10)\n");
    printf("-lat [float] the latitude for nearest neighbors (default: 0)\n");
    printf("-lng [float] the longitude for nearest neighbors (default: 0)\n");
    printf("\n");
    printf("-h, --help   Display the help file\n");
    printf("-q           Quiet mode. Suppress all text output.\n");
    printf("-t           Print timing information.\n");
    printf("\n");
    printf("-p [int]     Choose the platform (must choose both platform and device)\n");
    printf("-d [int]     Choose the device (must choose both platform and device)\n");
    printf("\n");
    printf("\n");
    printf("Notes: 1. The filename is required as the first parameter.\n");
    printf("       2. If you declare either the device or the platform,\n");
    printf("          you must declare both.\n\n");
  }
