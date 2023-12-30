#!/bin/bash

#variables
LOC=</home/mohan/large_files>   #Path of files you want to filter
DAYS=10
DEPTH=1
RUN=0

#Check if the directory is present or not

if [ ! -d $LOC ]
then
echo "directory does not exist- $LOC"
exit 1
fi

#create an 'archive' folder if not present

if [ ! -d $LOC/archive]
then
mkdir $LOC/archive
fi

#Find the list of files larger than 20mb

for i in `find $LOC -maxdepth $DEPTH -type f -size +10M`
do
if [ $RUN -eq 0 ]
then
echo " $date archiving $i è $LOC/archive"
gzip $i || exit 1
mv $i.gz $LOC/archive || exit 1
fi
done


