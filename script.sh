#!/bin/bash
dirs=$(ls -R $1 | cut -d '.' -f 2 | uniq)
cd $2
for var in $dirs
do
	mkdir $var
done


