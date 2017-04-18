#!/bin/bash

numbers=("$@")
n=$#

for (( i=0;i<n;i++))
do
	number=${numbers[${i}]}
	echo $(($number*$number))
done

