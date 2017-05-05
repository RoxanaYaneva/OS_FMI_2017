#!/bin/bash

A=${1}
B=${2}
CNT=1

if [ ${A} -lt ${B} ] ; then 
	echo "Ok!"
else
	echo "Not ok!"
fi

NUMBER=$(( (RANDOM % ${B}) + ${A} ))

echo -n "Guess? "
read GUESS

while [ ${GUESS} -ne ${NUMBER} ] ; do
	let CNT=${CNT}+1
	if [ ${GUESS} -lt ${NUMBER} ] ; then
		echo ...Bigger!
	else
		echo ...smaller!
	fi
	echo -n "Guess Again? "
	read GUESS
done

echo "RIGHT! Guessed ${NUMBER} in ${CNT} tries!"

