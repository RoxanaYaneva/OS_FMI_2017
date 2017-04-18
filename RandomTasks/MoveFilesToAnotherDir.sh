#!/bin/bash

dir1=$1
dir2=$2

for var in $(ls ${dir1})
do
	if [ -f ${dir1}/${var} ]
	then
		cp ${dir1}/${var} ${dir2}
	else
		echo "${var} is not a file"
	fi
done

