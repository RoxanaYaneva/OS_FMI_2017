#!/bin/bash

if [ ${1} -lt ${2} ]
then
	echo "${1} is smaller than ${2}"
elif [ ${1} -ge ${2} ] && [ ${1} -le ${3} ]
then
	echo "${1} is in the interval [${2};${3}]."
else
	echo "${1} is greater than ${3}."
fi

