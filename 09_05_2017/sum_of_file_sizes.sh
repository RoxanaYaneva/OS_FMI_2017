#!/bin/bash

if [ $# -ne 2 ] || [ ! -d "${1}" ] ; then
	echo "Invalid arguments!"
fi

DIR="${1}"
NUMBER=${2}
SUM_OF_FILE_SIZES=0

for ITEM in $(ls "${DIR}") ; do
	if [ -f "${DIR}"/"${ITEM}" ] ; then
		FILE_SIZE=$(wc -c "${DIR}"/"${ITEM}" | cut -d ' ' -f 1)
		if [ ${FILE_SIZE} -gt ${NUMBER} ] ; then
			let SUM_OF_FILE_SIZES=${SUM_OF_FILE_SIZES}+${FILE_SIZE}
		fi
	fi
done

echo "All file sizes: ${SUM_OF_FILE_SIZES}"

