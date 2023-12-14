#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
echo "Scripting was started at $TIMESTAMP."
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed. $N"
        exit 1
    else
        echo -e "$2 is $G Success. $N"
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R please login as root user. $N"
    exit 1
else 
    echo -e "$G Successfully logged in as root user $N"
fi

yum list installed nginx
    if [ $? -eq 0 ]
    then
        echo -e "$G Successfully installed nginx $N"
        exit 1
    else
        yum install nginx -y &>> $LOGFILE
        VALIDATE $? "Installed nginx"
    fi


systemctl enable nginx &>> $LOGFILE

VALIDATE $? "enable nginx"

systemctl start nginx &>> $LOGFILE

VALIDATE $? "Started nginx"

rm -rf /usr/share/nginx/html/* &>> $LOGFILE

VALIDATE $? "removed the default configuration"

cd /usr/share/nginx/html &>> $LOGFILE

VALIDATE $? "redirected to /usr/share/nginx/html"

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip &>> $LOGFILE

VALIDATE $? "Downloaded the web.zip file"

unzip /tmp/web.zip &>> $LOGFILE

VALIDATE $? "unzip the file"

cp /home/centos/shell-scripts/roboshop.conf /etc/nginx/default.d/roboshop.conf &>> $LOGFILE

VALIDATE $? "created a roboshop.conf file"

systemctl restart nginx &>> $LOGFILE

VALIDATE $? "Restarted nginx"

