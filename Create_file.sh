#!/bin/bash
#Checking if arguments are provided
if [ $# -ne 2 ]
then
	echo "Usage: Create_file.sh <filename> <no.of files needed>"
	exit 1
fi

#checking if file count is integer
if [ $2 -eq 0 ]
then 
	echo "Please an integer for file count"
	exit 1
fi

#File creation in loop
count=$2
filename=$1
counter=1
#for i in {1..$count}; do
#	touch $filename-$i
#done
while [ $counter -lt $(($count + 1)) ];do
	touch $filename-$counter
	((counter++))
done
echo "File creation successful" 



