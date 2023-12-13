#!/bin/bash

echo "Enter username"

read -s username

echo "Enter password"

read -s password

VAR=Hello
VAR1=WORLD

DATE=$(date)

echo "script started on: ${DATE}"

echo "$VAR $VAR1"

num1=$1
num2=$2

add=$((num1+num2))

echo "addition of two num: $add"