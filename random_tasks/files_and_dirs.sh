#!/bin/bash

string=${1}
number=${2}
currentDir=$(ls)

for item in "${currentDir}"
do
	if [ -d "${item}" ] && [ "${item}" == "${string}" ]
	then
		subdir="${item}"
		cd "${subdir}"
		for var in $(ls)
		do
			numberOfSymbols=$(wc -c "${var}" | cut -d ' ' -f 1)
			if [ ${numberOfSymbols} -gt ${number} ]
			then
				echo "${var}"
			fi
		done
	else
		echo "This is not a directory or is not named like ${string}: ${item}."
	fi
done

