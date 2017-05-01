#!/bin/bash

regular_files=0
block_files=0
character_files=0
dirs=0

ls=$(ls)

for item in ${ls} 
do
	if [ -f "${item}" ]
	then 
		regular_files=$((${regular_files}+1))
	elif [ -b "${item}" ]
	then
		block_files=$((${block_files}+1))
	elif [ -c "${item}" ]
	then
		character_files=$((${character_files}+1))
	elif [ -d ${item} ]
	then
		dirs=$((${dirs}+1))
	fi
done

echo "Regular files: ${regular_files}."
echo "Block files: ${block_files}."
echo "Character files: ${character_files}."
echo "Directories: ${dirs}."


