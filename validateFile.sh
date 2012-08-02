#!/bin/bash

du -h $1
echo "Number of broken lines: "
grep -c -e '[^0-9.e+ ]' $1

# for the characters that break the file run
# grep -o -e '[^01.e+ ]' $1
