#!/bin/bash

DIRS=$(echo ${PATH} | tr ':' ' ')
OLD_IFS="${IFS}"
CNT=0

for DIR in "${DIRS}" ; do
	while IFS= read -d $'\0' -r FILE ; do
		let CNT=${CNT}+1
	done < <(find "${DIR}" -executable -type f -print0)
done

echo "Number of executable files: ${CNT}."

IFS="${OLD_IFS}"

