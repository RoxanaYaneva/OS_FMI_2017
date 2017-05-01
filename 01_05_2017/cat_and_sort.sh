#!/bin/bash

echo -n "Enter names of three files: "
read file1 file2 file3

if [ ! -f "${file1}" ] || [ ! -f "${file2}" ] || [ ! -f "${file3}" ] ; then
	echo "Invalid arguments."
	exit 1
fi

cat "${file1}" "${file2}" | sort > "${file3}"

