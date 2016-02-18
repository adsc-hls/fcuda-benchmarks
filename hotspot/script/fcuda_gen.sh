#!/bin/bash

Usage()
{
	echo "Usage:"
	echo "	     bash script/fcuda_gen.sh {pipeline} {core} {unroll} {mpart} {noc} {blockmerge}"
	echo "flags:"
	echo "	     pipeline: pipe -- introduce ping-pong buffer"
	echo "		       nopipe -- not using ping-pong buffer"
	echo "	     core, unroll, mpart: numbers > 0"
	echo "	     noc: generate code having NOC interface"
	echo "	     blockmerge: generate code having blockmerge feature"
	echo "Example: bash script/fcuda_gen.sh pipe 1 2 4"
	echo "	   or  bash script/fcuda_gen.sh nopipe 4 1 1 noc blockmerge"
	echo "------"
}

if [ -z $HOTSPOT_float ]
then
	echo "The environment is not set."
	echo "Please source the script at the fcuda root directory."
	exit 1
fi

if [ "$(pwd)" != "$HOTSPOT_float" ]
then
	Usage
	echo "Must run the script at $HOTSPOT_float"
	exit 1
fi

FCUDA=fcuda
KERNEL=hotspot
KERN_FILE=fcuda_annot_${KERNEL}.cu
pipeline=nopipe
core=1
unroll=1
mpart=1

if [ "$1" = "pipe" ]
then
	pipe=
	pipeline=pipe
elif [ "$1" = "nopipe" ]
then
	pipe=-nopipe
	pipeline=nopipe
else
	Usage
	exit 1
fi

number='^[0-9]+$'
if ! [[ $2 =~ $number ]]
then
	Usage
	exit 1
elif [ $2 =  0 ]
then
	echo "Cannot be zero."
	exit 1
else
	core=$2
	python script/gen_core_wrapper.py $core
fi

if ! [[ $3 =~ $number ]]
then
	Usage
	exit 1
elif [ $3 =  0 ]
then
	echo "Cannot be zero."
	exit 1
else
	unroll=$3
fi

if ! [[ $4 =~ $number ]]
then
	Usage
	exit 1
elif [ $4 =  0 ]
then
	echo "Cannot be zero."
	exit 1
else
	mpart=$4
fi

if [ "$5" = "noc" ]
then
	noc=-NoC
	noc_str="_noc"
	#python script/gen_core_wrapper.py $core
else
	noc=
	noc_str=
fi

if [ "$6" = "blockmerge" ]
then
	blockmerge=-bmerge
	blockmerge_str="_bmerge"
else
	blockmerge=
	blockmerge_str=
fi

rm -rf kernel/fcuda_output log_fcuda.cu fcuda_gen/fcuda_gen_${KERNEL}${noc_str}${blockmerge_str}_${pipeline}_c${core}_u${unroll}_m${mpart}.c

echo "Generating FCUDA file with the following configuration:
	pipeline=$pipeline, cores=$core, unroll=$unroll, mpart=$mpart, additional option(s): $noc_str $blockmerge_str"

sed 's/cores=\[[0-9]*\]/cores=\['$core'\]/g' < kernel/${KERN_FILE} > kernel/tmp.c
sed 's/unroll=[0-9]*/unroll='$unroll'/g' < kernel/tmp.c > kernel/tmp1.c
sed 's/mpart=[0-9]*/mpart='$mpart'/g' < kernel/tmp1.c > kernel/tmp2.c

if [ ! -d log ]
then
	mkdir log
fi

${FCUDA} kernel/tmp2.c -numDims=2 $pipe $noc $blockmerge -param_core -wrapper > log/log_fcuda.cu 2>&1
rm kernel/tmp*.c

if [ -d kernel/fcuda_output ]
then
	echo "Translation successful."
else
	echo "Failed to translate."
	cat log/log_fcuda.cu
	exit
fi

mv kernel/fcuda_output/tmp2.c fcuda_gen/fcuda_gen_${KERNEL}${noc_str}${blockmerge_str}_${pipeline}_c${core}_u${unroll}_m${mpart}.c
