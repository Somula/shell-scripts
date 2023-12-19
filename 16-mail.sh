#!/bin/bash

TO_TEAM=$1
ALERT=$2
BODY=$3
TO_ADDRESS=$4
SUBJECT=$5
ESCAPE_BODY=$(printf '%s\n' "$BODY" | sed -e 's/[]\/$*.^[]/\\&/g');


FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT/$ALERT/g" -e "s/BODY/$ESCAPE_BODY/g" template.html)

echo "$Final_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"


