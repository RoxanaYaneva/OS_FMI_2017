#!/bin/bash
	 
if [[ $# -ne 1 ]] ; then
 	echo "Invalid arguments!"
	exit 1
fi
	 
USER="${1}"
while [[ 0 ]] ; do
	sleep 1
	BOOL=$(last | grep ${USER} | grep "still logged in" | wc -l)
	if [[ ${BOOL} -eq 1 ]] ; then
		echo "${USER} has logged in."
		exit 0
	fi
done
