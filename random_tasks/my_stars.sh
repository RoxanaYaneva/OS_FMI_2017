#!/bin/bash

#print
#
#  ***
#   **
#    *

N=${1}

for (( i=${N};i>=0;i--))
do
	for ((k=${N}-1;k>=${i};k--))
	do
		echo -n " "
	done
	for (( j=0;j<=${i};j++))
	do
		echo -n "*"
	done
	echo ""
done

