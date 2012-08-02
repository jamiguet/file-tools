#!/bin/bash

seq 10 > test.dat

./extract.sh 2 5 test.dat > test2.dat

size=`wc -l test2.dat`
set -- $size
size=$1

if [ $size -eq 3 ]; then
	echo "TEST 1: OK"
else
	echo "Wrong number of lines in file"
fi

rm test.dat test2.dat
