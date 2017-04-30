#!/bin/bash

echo -n "Enter a string to search in all files: "
read string
for file in $(ls)
do
	echo "${file} has encountered string ${string} $(cat ${file} | grep ${string} | wc -l) time(s) in it."
done

