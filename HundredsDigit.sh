#!/bin/bash

echo "Enter a number which is longer than 5 symbols: "
read number
n=${#number}

while [ $n -le 5 ]
do
	echo "Error! Number is less than 5 symbols long. Try again: "
	read number
	n=${#number}
done

copy=$number
rev=""
for (( i=$n-1; i>=0;i--))
do
	rev="$rev${copy:$i:1}"
done

echo "The hundreds digit is ${rev:2:1}"

