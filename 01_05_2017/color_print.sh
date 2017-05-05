#!/bin/bash

COLOR="${1}"
STRING="${2}"

if [ "${COLOR}" != "-r" ] || [ "${COLOR}" != "-g" ] || [ "${COLOR}" != "-b" ] ; then
	COLOR=""
	STRING=("$@")
fi

case "${COLOR}" in
	"-r")	
		echo -e "\033[0;31m${STRING}"
		;;
	"-g")
		echo -e "\033[0;32m${STRING}"
		;;
	"-b")
		echo -e "\033[0;34m${STRING}"
		;;
	  "")
		echo "${STRING}"
		;;
	   *)
		echo "Unknown color."
esac

