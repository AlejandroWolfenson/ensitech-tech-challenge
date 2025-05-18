# modules/ec2instance/variables.tf

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

variable "ec2_name" {
  description = "name of ec2"
  type        = string
}

#variable "ec2_userdata_script" {
#  description = "commands to configure ec2"
#  type        = string
#}

variable "ec2_disksize" {
  description = "size of ec2 disk, in GB"
  type        = string
}

variable "ec2_disktype" {
  description = "type of ec2 disk"
  type        = string
}

variable "subnet_id" {
 
  type        = string
}

variable "securitygroup_id" {
  
  type        = string          #syntax to associate more than one SG: "sg-abcdefgh12345678", "sg-ijklmnop12345678"
}

variable "default_tags" {
  type        = map(string)
  default = {}
}