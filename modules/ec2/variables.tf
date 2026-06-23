variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "key_name" {}
variable "instance_name" {}
variable "user_data_file" {
  type = string
}
variable "instance_name_profile" {
  type    = string
  default = null
}