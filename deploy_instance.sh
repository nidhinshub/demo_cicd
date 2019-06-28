#!/bin/bash

terraform apply -input=false -auto-approve ./tfplan

if [ #? -ne 0 ]
then
	echo "Terraform apply failed..!!"
	terraform destroy -input=false -auto-approve
	if [ #? -ne 0 ]
	then
		echo "Terraform has Errors.!!"
		echo "Please fix and rework on the deployment."
		exit 1

	else
		echo "Terraform destroy successfull..!!"
	fi
else
	echo "Terraform apply successfull..!!"
fi
