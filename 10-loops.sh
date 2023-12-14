#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m]
G="\O33[O;32m"
Y="\O33[O;33m"
N="\O33[O;0m"

if [ $ID -ne 0 ]
then
    echo "$R ERROR:: Switch to root user $N"
else
    echo " $G Success $N your root user"
fi

