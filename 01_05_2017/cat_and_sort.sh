#!/bin/bash

read -p "Enter names of three files: " FILE1 FILE2 FILE3

if [ ! -f "${FILE1}" ] || [ ! -f "${FILE2}" ] || [ ! -f "${FILE3}" ] ; then
	echo "Invalid arguments."
	exit 1
fi

cat "${FILE1}" "${FILE2}" | sort > "${FILE3}"

