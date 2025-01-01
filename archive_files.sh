#!/bin/bash

##########################
#Author:        Srikanth
#Date:          15-07-2023
#Last Modified: 20-07-2023
#Version:       03
##########################

set -e

#Set variables

BASE_DIR=/home/srikanth/desktop/scripts/shell-scripting
DEST_DIR=/home/srikanth/desktop/scripts/shell-scripting/backups

#Check if the base directory exist or not.
if [[ ! -d ${BASE_DIR} ]]
then
		echo "${BASE_DIR} does not exist."
        exit 1
fi

#Check if BASE_DIR is empty
if [ $(ls -1 $BASE_DIR | wc -l) -eq 0 ]
then
        echo "No files found in the directory"
        exit 1
fi

#Check if destination directory exit. If not create
if [ ! -d ${DEST_DIR} ]
then
	echo "Destination dir does not exit."
	echo
	echo "Creating destination directory ${BASE_DIR}/backups"
	cd ${BASE_DIR}
	mkdir backups
	
	if [ $? -eq 0 ]
	then
		echo "Destination dir created ==> ${DEST_DIR}"
	fi
fi

#Find files larger than 1MB and archive them into backups folder
for files in `find ${BASE_DIR} -maxdepth 1 -type f -size +1M`
do
        gzip -k $files || exit 1
        mv $files.gz ${DEST_DIR} || exit 1
        echo "Archived $(ls -1 $files | awk -F/ '{print $NF}') into ==> ${DEST_DIR} on $(date "+%Y-%M-%d %H:%M:%s")"
done
