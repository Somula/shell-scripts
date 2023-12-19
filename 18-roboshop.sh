#!/bin/bash

AMI_ID="ami-03265a0778a880afb"
SG="sg-0a4b59538c2adbf03"
INSTANCE=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCE[@]}"
then
    aws ec2 run-instances --image-id $AMI_ID --instance-type t2.micro --security-group-ids $SG
fi
