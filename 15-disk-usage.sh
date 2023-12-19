#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

DISK_USAGE=$(df -hT | ! grep -vE "tmp|File")
DISK_Threshold=1

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6F)' | cut -d % -f1)
    partion=$(echo $line | awk '{print $1F}')
    if [ $USAGE -gt DISK_Threshold ]
    then
        message+="Higher disk usage on $partion $R$USAGE$N.\n"
    fi

    echo -e "Message: $message"

done <<< $DISK_USAGE