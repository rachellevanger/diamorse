#!/bin/bash

# Rename input parameters
BMPDir=$1
BMPPattern=$2
idxStart=$3
idxEnd=$4
BMPSize=$5
OUTDir=$6


for i in `seq ${idxStart} ${idxEnd}`; 
do 
	./compute-persistence-bmp $BMPDir $(printf $BMPPattern "$i") $BMPSize $OUTDir;
done

