
#Assing values to variables depending on client

## This was triggered from AWS CodeBuild. AWS credentials defined as env variables in code build project

client_name             = "Ensitech"
environment             = "testing"
project_name            = "Tech_Challenge"

provider_region         = "us-east-1"

vpc_block               = "10.0.0.0/16"

subnet_block            = "10.0.0.0/24"

availability_zone       = "us-east-1a"

ec2_imageid             = "ami-084568db4383264d4"    ##ubuntu 24
ec2_instancetype        = "t2.micro"
ec2_decryptkeyname      = "ensitech-challenge"
ec2_disksize            = "80"
ec2_disktype            = "gp2"




