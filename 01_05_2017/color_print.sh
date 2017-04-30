#!/bin/bash

color="${1}"
string="${2}"

if [ "${color}" != "-r" ] || [ "${color}" != "-g" ] || [ "${color}" != "-b" ] ; then
	color=""
	string=("$@")
fi

case "${color}" in
	"-r")	
		echo -e "\033[0;31m${string}"
		;;
	"-g")
		echo -e "\033[0;32m${string}"
		;;
	"-b")
		echo -e "\033[0;34m${string}"
		;;
	  "")
		echo "${string}"
		;;
	   *)
		echo "Unknown color."
esac

