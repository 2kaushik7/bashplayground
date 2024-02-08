#!/bin/bash
#checking if the arguments are provided
if [ "$#" -ne 1 ]; 
then
	echo "Usage: $0  <file name pattern>"
	exit 1
fi
pattern=$1
#Delete files based on pattern
if ls $pattern* 1>/dev/null 2>&1
then
	rm -f $pattern*
	echo "Clean-up completed based on $pattern"
else
	echo "$pattern files don't exist"
fi


