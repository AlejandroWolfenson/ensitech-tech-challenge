#!/bin/bash

# set fail on error
set -eu

# back to previous directory
cd ..

# get into directory where tf files are
cd envs/prod

# initialize terraform
terraform init

# apply terraform
terraform apply -auto-approve

#destroy terraform
#terraform destroy -auto-approve