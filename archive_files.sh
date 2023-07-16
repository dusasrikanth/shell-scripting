#!/bin/bash

##########################
#Author:        Srikanth
#Date:          15-07-2023
#Last Modified: 16-07-2023
#Version:       02
##########################

set -e

#Set variables

BASE_DIR=/home/srikanth/desktop/scripts/shell-scripting

#Check if the directory present or not.

if [[ ! -d ${BASE_DIR} ]]
then
        echo "${BASE_DIR} not exist."
        exit 1
fi

#Check if BASE_DIR is empty
if [ $(ls -1 $BASE_DIR | wc -l) -eq 0 ]
then
        echo "No files found in the directory"
        exit 1
fi

#Find files larger than 1MB and archive them into backups folder
for files in `find ${BASE_DIR} -maxdepth 1 -type f -size +1M`
do
        gzip -k $files || exit 1
        mv $files.gz ${BASE_DIR}"/backups" || exit 1
        echo "Archived $(ls -1 $files | awk -F/ '{print $NF}') into ==> ${BASE_DIR}/backups on $(date "+%Y-%M-%d %H:%M:%s")"
done
