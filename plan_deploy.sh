#!/bin/bash

FILE=tfplan
STATE=terraform.tfstate
if [ -f ${FILE}  ];
then
        echo "Checking the availability of deployed instances"
        grep x86_64 ${STATE}
        if [  $? -ne 0 ];
        then
                terraform plan -out=tfplan -input=false
        else
                echo "It seems we have an earlier deployment available"
                echo "Please revist the terraform state and rebuild"
        fi
else
        terraform plan -out=tfplan -input=false
fi