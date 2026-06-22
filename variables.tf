variable "aws_region" {
    default = "eu-west-3"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    default = "10.0.1.0/24"
}

variable "instance_type" {
   default = "t3.micro"
}

variable "key_name" {
  description = "Your AWS key pair name"
} 