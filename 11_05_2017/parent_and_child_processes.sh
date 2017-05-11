#!/bin/bash

PIDS=$(ps aux | tr -s ' ' | tail -n +2 | cut -d ' ' -f 2)

for PID in "${PIDS}" ; do

	PARRENT_PID=$(ps -o ppid= -p ${PID})

	if [[ "${PARRENT_PID}" == "" ]] ; then
		continue
	fi

	CURR_PROCESS_CHILDREN=$(pgrep -c -P ${PID})
	PARENT_PROCESS_CHILDREN=$(pgrep -c -P ${PARRENT_PID})

	if [[ ${CURR_PROCESS_CHILDREN} -gt ${PARENT_PROCESS_CHILDREN} ]] ; then
		echo "${PID}"
	fi
done

