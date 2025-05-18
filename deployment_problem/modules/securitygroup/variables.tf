# modules/securitygroup/variables.tf

variable "securitygroup_name" {
  description = "The name of the SG"
  type        = string
}

variable "block_allow_ingress" {
  description = "IP blocks to which the SG will allow ingress"
  type        = list(string)
}

variable "vpc_id" {
  type        = string
}

variable "default_tags" {
  type        = map(string)
  default = {}
}