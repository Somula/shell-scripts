#!/bin/bash

NAME=""
WISHES="Good Morning"
USAGE(){
    echo "USAGE: $(basename $0) -n <name> -w<whishes>"
    echo "options::"
    echo " -n, Specify the name (mandatory)"
    echo " -w, Specify the wishes (optional)"
    echo " -h, Displays this help and exit"
}

while getopts ":n:w:h" opt; do
      case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        \?) echo "Invalid option: -"$OPTARG"" >&2; USAGE; exit 1;;
        :) echo "Option -"$OPTARG" requires an argument." >&2; exit 1;;
        h) USAGE; exit 1;;
      esac
    done


echo "Hello $NAME $WISHES. Thanking You for Invitation."

