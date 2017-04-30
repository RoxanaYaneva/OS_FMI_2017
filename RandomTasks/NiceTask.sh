#!/bin/bash

argv=("$@")
argc=$#

if [ ${argc} -lt 2 ]
then
	exit 3
fi

min_num_of_files=${1}
max_size_of_file=${2}

for (( i=2;i<${argc};i++))
do
	current_item=${argv[${i}]}
	if [ -e "${current_item}" ]
	then
		item="${current_item}"
		if [ -d "${item}" ]
		then
			files_in_dir=$(ls -l "${item}" | tail -n +2 | wc -l)
		        if [ ${files_in_dir} -lt ${min_num_of_files} ]
			then
				rm -rf "${item}"
			fi
		elif [ -f "${item}" ]
		then 
			size_of_file=$(wc -c "${item}" | cut -d " " -f 1)
			if [ ${size_of_file} -lt ${max_size_of_file} ] 
			then
				mv "${item}" "${item}.toBeRemoved"
			fi
		fi
	else
		echo "${current_item}" >> "notExisting"
	fi
done

