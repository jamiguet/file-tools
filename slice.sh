#!/bin/bash

if [ $# -ne 2 ]; then
	echo "usage: slice.sh <slice-size> <filesize>"
	exit 1
fi

sliceSize=$1
filename=$2

TOTAL=`wc -l $filename`
set -- $TOTAL
TOTAL=$1 

echo $TOTAL

START=1
CHUNK_NUM=1

while [ $START -le $TOTAL ]
do
    echo $START
    tail -n +$START $filename | head -n $sliceSize  > $filename.$CHUNK_NUM
    START=$((START + sliceSize))
    CHUNK_NUM=$((CHUNK_NUM +1))
done
