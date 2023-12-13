#!/bin/bash

DATE=$(date)
echo "$DATE"

package1=$1
package2=$2

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "ERROR:Inastalling was failed. Please try again"
    else
        echo "Successfully installed"
    fi
}
yum install $package1 -y
VALIDATE
yum install $package2 -y
VALIDATE
