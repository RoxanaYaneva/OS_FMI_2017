#!/bin/bash

if [[ $# -ne 1 ]] || [[ ! -d "${1}" ]] ; then
        echo "Invalid input!"
        exit 1
fi

function convert_to_spec_name {
	#check if first argument is a number
        if [[ "${1}" -eq "${1}" ]] ; then
		DATE=$(date -d @"${1}" +%Y-%m-%dT%H%M_)
	fi
        DESCRIPTION=$(echo "${2}" | tr -cd '[0-9a-zA-Z ]' | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
        FILE_NAME="${DATE}${DESCRIPTION}.jpg"
        echo "${FILE_NAME}" | tr -s '_'
}

DIR="${1}"
cd "${DIR}"

declare -a FILE_NAMES

for FILE in *.log ; do

        while read LINE ; do

                FIRST_LINE=$(echo "${LINE}" | cut -d ' ' -f 1)
                read LINE
                SECOND_LINE=$(echo "${LINE}")

                FILE_NAMES[i++]=$(convert_to_spec_name "${FIRST_LINE}" "${SECOND_LINE}")

                while [[ "${LINE}" != "" ]] ; do
                        read LINE
                done

        done < "${FILE}"

        LOG_DIR=$(echo "${FILE}" | cut -d '.' -f 1)

        while read IMAGE ; do
                mv "${IMAGE}" "${LOG_DIR}"/"${FILE_NAMES[j++]}"
        done < <(stat -c "%Z %n" "${LOG_DIR}"/*.jpg | sort -n -k 1 | cut -d ' ' -f 2)

done
