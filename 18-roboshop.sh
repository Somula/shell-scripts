#!/bin/bash

AMI_ID="ami-03265a0778a880afb"
SG="sg-0a4b59538c2adbf03"
INSTANCE=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
zoneid=Z0790319IEVF09XXXVM1
DOMAIN_NAME="lingaaws.tech"




for i in "${INSTANCE[@]}"
do
    echo "Instance: $i"
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi
    PrivateIpAddress=$(aws ec2 run-instances --image-id $AMI_ID --instance-type $INSTANCE_TYPE --security-group-ids $SG --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query Instances[0].PrivateIpAddress --output text)

    echo "$i: $PrivateIpAddress"

    aws route53 change-resource-record-sets \
    --hosted-zone-id $zoneid \
    --change-batch '
    {
        "Comment": "Creating a record set for cognito endpoint"
        ,"Changes": [{
        "Action"              : "CREATE"
        ,"ResourceRecordSet"  : {
            "Name"              : "'$i'.'$DOMAIN_NAME'"
            ,"Type"             : "A"
            ,"TTL"              : 1
            ,"ResourceRecords"  : [{
                "Value"         : "'$PrivateIpAddress'"
            }]
        }
        }]
    }
        '
done
