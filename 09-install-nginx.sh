#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR: please run the script with root access"
else
    echo "Successfully your logged in as root user"
fi