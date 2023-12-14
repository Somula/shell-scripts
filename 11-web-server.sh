#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
echo "Scripting was started at $TIMESTAMP."
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if( $1 -ne 0 )
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

yum install nginx -y

VALIDATE $? "Installing nginx"

systemctl enable nginx

VALIDATE $? "enable nginx"

systemctl start nginx

VALIDATE $? "Started nginx"

rm -rf /usr/share/nginx/html/*

VALIDATE $? "removed the default configuration"

cd /usr/share/nginx/html

VALIDATE $? "redirected to /usr/share/nginx/html"

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip

VALIDATE $? "Downloaded the web.zip file"

unzip /tmp/web.zip

VALIDATE $? "unzip the file"

cp /devops/repo/shell-scripts/roboshop.conf /etc/nginx/default.d/roboshop.conf

VALIDATE $? "created a roboshop.conf file"

systemctl restart nginx

VALIDATE $? "Restarted nginx"

