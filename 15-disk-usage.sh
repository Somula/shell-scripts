#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=""

while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partion=$(echo $line | awk '{print $1F}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        message+="Higher disk usage on $partion: $USAGE.<br>"
    fi

done <<< $DISK_USAGE

echo -e "Message: $message"


#echo "$message" | mail -s "High Disk Usage" somulalingareddy2@gmail.com

sh 16-mail.sh "DevOps Team" "HIGH DISK USAGE" "$message" "somulalingareddy2@gmail.com" "Alert High Disk Usage"



