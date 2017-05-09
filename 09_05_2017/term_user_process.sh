#!/bin/bash

if [ $# -ne 1 ] ; then
	echo "Invalid argument!"
	exit 1
fi

USER="${1}"

ALL_PROCESSES=$(ps aux | grep -v "ssh\|bash" | tr -s ' ' | cut -d ' ' -f 1,2 | grep "${USER}" | cut -d ' ' -f 2)

for PROCESS in "${ALL_PROCESSES}" ; do
	echo "Killing process ${PROCESS}..."
	pkill "${PROCESS}"
done

