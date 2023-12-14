#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
N="\e[0m"

if [ $ID -ne 0 ]
then
    echo "$R ERROR:: Switch to root user $N"
else
    echo " $G Success $N your root user"
fi

