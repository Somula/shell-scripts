#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR: please run the script with root access"
    exit 1
else
    echo "Successfully your logged in as root user"
fi

yum install nginx -y

if [ $? -ne 0 ]
then 
    echo "ERROR: Installing mysql is failed"
else
    echo "Successfully installed mysql"
fi



