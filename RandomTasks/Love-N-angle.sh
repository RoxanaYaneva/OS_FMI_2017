#!/bin/bash

argv=("$@")
argc=$#

for(( i=0;i<${n}-1;i++))
do
	echo "${argv[${i}]} loves ${argv[${i}+1]}"
done

