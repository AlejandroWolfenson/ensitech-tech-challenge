#!/bin/bash

# fail on any error
set -eu

# install yum-condig-manager to manage your repositories
sudo yum install -y yum-utils

# use yum-config-manager to add the official HashiCorp Linux repository
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

# install terraform
sudo yum -y install terraform

# verify terraform installation
terraform --version