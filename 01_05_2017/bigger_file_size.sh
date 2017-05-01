#!/bin/bash

if [ $# -ne 2 ] ; then
	echo "Invalid arguments!"
fi

dir=${1}
number=${2}

for item in "${dir}"
do
	if [ -f "${item}" ] ; then
		echo yes
	#elif	 [ $(wc -c "${dir}"/"${item}" | cut -d " " -f 1) -gt ${number} ]; then
	#	echo "${item}"
	fi
done
		
