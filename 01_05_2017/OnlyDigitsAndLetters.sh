#!/bin/bash

string=${1}

string="$(echo "${string}" | tr -d '[0-9a-zA-Z]')"
if [ "${string}" == "" ] ; then
	echo "Yes."
else
	echo "No."
fi

