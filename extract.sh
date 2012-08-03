#!/bin/bash



if [ $1 -a $1 == "--test" ]; then
    EXIT=0
    seq 10 > test.dat

    ./extract.sh 2 5 test.dat > test2.dat

    size=`wc -l test2.dat`
    set -- $size
    size=$1

    if [ $size -eq 3 ]; then
	echo "TEST 1: OK"
    else
	echo "Wrong number of lines in file"
	EXIT=1
    fi

    rm test.dat test2.dat

    exit $EXIT
fi


if [ $# -ne 3 ]; then
echo "Usage extract.sh <start-line> <end-line> <file>"
echo "Usage extract.sh --test"
exit 1
fi

sliceSize=$(($2 - $1))
filename=$3
START=$1

tail -n +$START $filename | head -n $sliceSize 
