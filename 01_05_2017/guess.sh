#!/bin/bash

a=${1}
b=${2}
cnt=1

if [ ${a} -lt ${b} ] ; then 
	echo "Ok!"
else
	echo "Not ok!"
fi

number=$(( (RANDOM % ${b}) + ${a} ))

echo -n "Guess? "
read guess

while [ ${guess} -ne ${number} ] 
do
	let cnt=${cnt}+1
	if [ ${guess} -lt ${number} ] ; then
		echo ...bigger!
	else
		echo ...smaller!
	fi
	echo -n "Guess again? "
	read guess
done

echo "RIGHT! Guessed ${number} in ${cnt} tries!"

