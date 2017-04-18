#!/bin/bash

echo "Enter a string to search in all files: "
read string
for file in $(ls)
do
	echo "$file has encountered string $string $(cat $file | grep $string | wc -l) times in it"
done

