#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_Threshold=1
message=""

while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F)' | cut -d % -f1)
    partion=$(echo $line | awk '{print $1F}')
    if [ $USAGE -gt $DISK_Threshold ]
    then
        message+="Higher disk usage on $partion $USAGE.\n"
    fi

done <<< $DISK_USAGE

echo -e "Message: $message"