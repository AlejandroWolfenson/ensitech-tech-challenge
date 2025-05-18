variable "client_name" {
  description = "name of the client"
  type        = string
}

variable "project_name" {
  description = "name of the project"
  type        = string
}

variable "environment" {
  description = "staging or prod"
  type        = string
}

variable "provider_region" {
  description = "region of provider, like us-east-2"
  type        = string
}

variable "provider_accesskey" {
  description = "access key from account to authenticate"
  type        = string
}

variable "provider_secretkey" {
  description = "secret key from account to authenticate"
  type        = string
}

variable "vpc_block" {
  description = "The CIDR block for the VPC"
  type        = string
}


variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
}


variable "subnet_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "ec2_imageid" {
  description = "Image ID"
  type        = string
}

variable "ec2_instancetype" {
  description = "Type of instance, t2.large"
  type        = string
}

variable "ec2_decryptkeyname" {
  description = "key name to get the password to access the instance"
  type        = string
}



variable "ec2_disksize" {
  description = "size of ec2 disk, in GB"
  type        = string
}

variable "ec2_disktype" {
  description = "type of ec2 disk"
  type        = string
}









