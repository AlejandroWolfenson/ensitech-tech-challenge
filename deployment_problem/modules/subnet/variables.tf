# modules/subnet/variables.tf

variable "subnet_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "vpc_id" {
  type        = string
}

variable "routetable_id" {
  type        = string
}

variable "default_tags" {
  type        = map(string)
  default = {}
}
