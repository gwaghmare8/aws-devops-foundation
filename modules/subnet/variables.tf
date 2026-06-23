variable "vpc_id" {}

variable "public_cidr" {}

variable "private_cidr_a" {
  type    = string
  default = null
}

variable "private_cidr_b" {
  type    = string
  default = null
}

variable "public_subnet_name" {
  type    = string
  default = "public_subnet"
}

variable "private_subnet_a_name" {
  type    = string
  default = "private_subnet_a"
}

variable "private_subnet_b_name" {
  type    = string
  default = "private_subnet_b"
}