#!/bin/bash

regularFiles=0
blockFiles=0
characterFiles=0
dirs=0

for item in $(ls)
do
	if [ -f $item ]
	then 
		regularFiles=$(($regularFiles+1))
	elif [ -b $item ]
	then
		blockFiles=$(($blockFiles+1))
	elif [ -c $item ]
	then
		characterFiles=$((characterFiles+1))
	elif [ -d $item ]
	then
		dirs=$(($dirs+1))
	fi
done

echo "Regular files: $regularFiles"
echo "Block files: $blockFiles"
echo "Character files: $characterFiles"
echo "Dirs: $dirs"


