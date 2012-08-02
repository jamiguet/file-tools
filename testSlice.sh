#!/bin/bash

seq 10 > test.dat
./slice.sh 3 test.dat

fileNum=`ls test.dat.* | wc -l`
if [ $fileNum -ne 4 ]; then
echo "Incorrect number of files made"
else
echo "Test 1: OK"
fi

fileNum=` wc -l test.dat.* `
set -- $fileNum
fileNum=$1
if [ $fileNum -ne 3 ]; then
echo "Incorrect number of lines in file"
else
echo "Test 2: OK"
fi

rm test.dat*
