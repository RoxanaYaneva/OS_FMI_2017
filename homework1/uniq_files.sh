#!/bin/bash

if [[ $# -ne 1 ]] && [[ ! -d "${1}" ]] ; then
	echo "Invalid input!"
	exit 1
fi

CURR_DIR="${1}"
UNIQ_FILES=0

while IFS= read -d $'\0' -r FILE1 ; do
	NUM_DUPES=0
	while IFS= read -d $'\0' -r FILE2 ; do
		if [[ "${FILE1}" != "${FILE2}" ]] ; then
			cmp -s  "${FILE1}" "${FILE2}"
			RESULT=$?
			if [[ ${RESULT} -eq 0 ]] ; then
				rm -f "${FILE2}"
				let NUM_DUPES=${NUM_DUPES}+1
			fi
		fi
	done < <(find "${CURR_DIR}" -type f -print0)
	if [[ ${NUM_DUPES} -ne 0 ]] ; then
		rm -f "${FILE1}"
		let UNIQ_FILES=${UNIQ_FILES}+1
	fi
done < <(find "${CURR_DIR}" -type f -print0)

CURR_UNIQ_FILES=0
while IFS= read -d $'\0' -r FILE ; do
	let CURR_UNIQ_FILES=${CURR_UNIQ_FILES}+1
done < <(find "${CURR_DIR}" -type f -print0)

let UNIQ_FILES=${UNIQ_FILES}+${CURR_UNIQ_FILES}
echo "Number of files with unique content is: ${UNIQ_FILES}"

