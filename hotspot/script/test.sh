#!/bin/bash

BENCHMARK_NAME=hotspot
echo "***TESTING BENCHMARK ${BENCHMARK_NAME}***"

if [ -z $HOTSPOT_float ]
then
	echo "The environment is not set."
	echo "Please source the script at the fcuda root directory."
	exit 1
fi

if [ "$(pwd)" != "$HOTSPOT_float" ]
then
	echo "Must run the script at $HOTSPOT_float"
	exit 1
fi

echo "1. Translating CUDA kernel input to C file..."

bash script/fcuda_gen.sh $1 $2 $3 $4 $5

if [ $? = 1 ]
then
	echo "Error! Terminated."
	exit 1
fi

echo "2. Compiling..."
make clean > /dev/null

make clean > /dev/null
if [ "$5" == "noc" ]
then
	TYPE=NOC
	CONFIG=noc_
else
	TYPE=SIMPLE
	CONFIG=
fi

make FCONFIG=${CONFIG}$1_c$2_u$3_m$4 CODE=$TYPE > log/log_compile 2>&1

if [ $? = 0 ]
then
	echo "->Done."
else
	echo "->Compile Error. Please see the log file for more details."
	exit 1
fi

echo "3. Executing..."
echo "------------"
bash script/execute.sh
echo "------------"
