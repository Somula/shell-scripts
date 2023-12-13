#!/bin/bash


DATE=$(date)

echo "script started on: $DATE"

num=$1

if [ num -gt 10 ]
then 
    echo "Given number is greater than 10."
else
    echo "Given number is less than 10."