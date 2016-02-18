#!/bin/bash

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

./hotspot.exe 512 2 2 data/float/temp_512 data/float/power_512 cuda/gold_output.txt
