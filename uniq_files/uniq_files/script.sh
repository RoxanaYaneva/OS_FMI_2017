#!/bin/bash

declare -a files_arr
i=0

find "${1}" -type f | while read line
do
	files_arr[i]="${line}"
	echo "${files_arr[$i]}"
	let i=$i+1
done

i=$(find "${1}" -type f | wc -l)

for (( p=0;p<${i}-1;p++))
do
        file1="${files_arr[${p}]}"
        num_dup=0
        for (( k=${p}+1;k<${i};k++))
        do
                file2="${files_arr[${k}]}"
		if [ $(wc -c "${file1}" | cut -d " " -f 1) -ne $(wc -c "${file2}" | cut -d " " -f 1) ] ; then
			continue
		else
         	        cmp -s "${file1}" "${file2}"		
                	result=$?
                	if [ ${result} -eq 0 ] ; then
                        	#rm -f "${file2}"
                        	let num_dup=${num_dup}+1
               		fi
		fi
        done
        if [ ${num_dup} -ne 0 ] ; then
                #rm -f "${file1}"
		echo duplicate
        fi
done

uniq_files=$(find "${curr_dir}" -type f | wc -l)
echo "Number of unique files in ${curr_dir} is: ${uniq_files}"

