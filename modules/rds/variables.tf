variable "db_name" {}
variable "username" {}
variable "password" {}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {}