#!/bin/bash

while getopts ":a:b" opt; do
      case $opt in
        a ) APPLE="$OPTARG";;
        b ) BANANA="$OPTARG";;
        \?) echo "Invalid option: -"$OPTARG"" >&2
            exit 1;;
        : ) echo "Option -"$OPTARG" requires an argument." >&2
            exit 1;;
      esac
    done
echo "Apple is "$APPLE""
echo "Banana is "$BANANA""
