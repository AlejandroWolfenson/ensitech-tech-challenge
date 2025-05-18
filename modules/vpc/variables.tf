# modules/vpc/variables.tf

variable "vpc_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "internet_gateway_name" {
  description = "name of IG"
  type        = string
}

variable "default_tags" {
  type        = map(string)
  default = {}
}