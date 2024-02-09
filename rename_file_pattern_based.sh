#!/bin/bash

#check if arguments are enough
if [ $# -ne 2  ]
then
	echo "usage: $0 <target pattern><current pattern>"
	exit 1
fi

patt1=$1
patt2=$2

#check if patterns exist in the current folder and rename if exists
if ls $patt2* 1>/dev/null 2>&1 
then
	for file in $patt2*; do
		filename=$(basename "$file")
		mv "$filename" "${filename/$patt2/$patt1}"
	done
	echo "Files matching with $2 are replaced with $1"
else
	echo "No files with matching $2"
fi

