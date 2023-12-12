#!/bin/bash

DATE=$(date) 

PERSON1=$1
PERSON2=$2

echo "script started executing: ${DATE}"

echo "$PERSON1: Hello $PERSON2, Good Morning"
echo "$PERSON2: Hello $PERSON1, Good Morning"
echo "$PERSON1: How are you $PERSON2?"
echo "$PERSON2: I am fine, what about you $PERSON1?"