#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/tmp/shellscripts-logs"

FILE_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name '*.log')


if [ ! -d "$SOURCE_DIR" ]
then
    echo -e "$R Source directory does not exist.$N"
fi

while IFS=read -r line
do
    echo "Deleting file: $line"

done <<< $FILE_TO_DELETE
