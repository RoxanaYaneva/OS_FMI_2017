#!/bin/bash

STRING=${1}

STRING="$(echo "${STRING}" | tr -d '0-9a-zA-Z')"
if [ "${STRING}" == "" ] ; then
	echo "Yes."
else
	echo "No."
fi

