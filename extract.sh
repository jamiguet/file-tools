#!/bin/bash

if [ $# -ne 3 ]; then
echo "Usage extract.sh <start-line> <end-line> <file>"
exit 1
fi

sliceSize=$(($2 - $1))
filename=$3
START=$1

tail -n +$START $filename | head -n $sliceSize 
