#!/bin/bash

rm -rf kernel/fcuda_output
#fcuda kernel/fcuda_annot_conv1d.cu -param_core -wrapper > log_fcuda.cu 2>&1
fcuda kernel/fcuda_annot_conv1d_noc.cu -param_core > log_fcuda.cu 2>&1
if [ -d kernel/fcuda_output ]
then
	echo "Translation successful."
else
	echo "Failed to translate. Please see the log file log_fcuda.cu for error detail."
	exit
fi

mkdir -p fcuda_gen
#mv kernel/fcuda_output/fcuda_annot_conv1d.cu fcuda_gen/fcuda_gen_conv1d.c
mv kernel/fcuda_output/fcuda_annot_conv1d_noc.cu fcuda_gen/fcuda_gen_conv1d.c
