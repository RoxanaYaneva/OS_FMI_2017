#!/bin/bash

if [ $# -ne 2 ] ; then
	echo "Invalid arguments!"
fi

DIR=${1}
NUMBER=${2}

for ITEM in $(ls "${DIR}")
do
	if [ -f "${DIR}"/"${ITEM}" ] ; then
		if [ $(wc -c "${DIR}"/"${ITEM}" | cut -d " " -f 1) -gt ${NUMBER} ]; then
			echo "${ITEM}"
		fi
	fi
done
		
