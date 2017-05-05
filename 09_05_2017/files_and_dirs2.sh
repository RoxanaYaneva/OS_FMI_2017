#!/bin/bash

for ITEM in "$@" ; do
	if [  -f "${ITEM}" ] && [ -r "${ITEM}" ] ; then
		echo "${ITEM} is a readable file."
	elif [ -d "${ITEM}" ] ; then
		NUM_FILES=$(find "${ITEM}" -type f | wc -l)
		for FILE in $(ls "${ITEM}"); do
			if [ -f "${ITEM}"/"${FILE}" ] ; then
				FILE_SIZE=$(wc -c "${ITEM}"/"${FILE}" | cut -d ' ' -f 1)
				if [ ${FILE_SIZE} -lt ${NUM_FILES} ] ; then
					echo "${FILE}"
				fi
			fi
		done
	else
		echo "${ITEM} is neither a readable file, nor a directory."
	fi
done

