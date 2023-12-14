#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is $R Failed $N."
    else
        echo "$2 is $G Success $N."
    fi
    
}
for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "$package is installed already so $Y SKIPPING the package.$N"
    else
        yum install $package -y &>> $LOGFILE
        VALIDATED $? "Installing $package"
    fi
done



