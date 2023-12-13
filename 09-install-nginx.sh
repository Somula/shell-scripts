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

systemctl enable nginx

systemctl start nginx

rm -rf /usr/share/nginx/html/*

cd /usr/share/nginx/html

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip

unzip /tmp/web.zip
