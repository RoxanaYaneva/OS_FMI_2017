#!/bin/bash

if [[ $# -ne 2 ]] && [[ ! -d "${1}" ]] && [[ ! ( "${2}" -ne "${2}" ) ]] ; then
	echo "Invalid arguments!"
	exit 1
fi
          

DIR="${1}"
NUMBER=${2}

for ITEM in "${DIR}"/* ; do
	if [ -f "${DIR}"/"${ITEM}" ] ; then
		if [ $(wc -c "${DIR}"/"${ITEM}" | cut -d " " -f 1) -gt ${NUMBER} ]; then 
			echo "${ITEM}"
                fi
        fi
done

