#!/bin/bash

USER=$(whoami)

USER_PROCESSES=$(ps aux | tr -s ' ' | sort -n -k 5 | grep "${USER}")

for PROCESS in "${USER_PROCESSES}" ; do

	PID=$(echo PROCESS | cut -d ' ' -f 2)
	RSS=$(echo PROCESS | cut -d ' ' -f 6)
	VSZ=$(echo PROCESS | cut -d ' ' -f 5)

	echo "${PID} : $(echo "scale=2; ${RSS}/${VSZ}" | bc)"
done

