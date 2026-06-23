resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private_a" {
  count      = var.private_cidr_a != null ? 1 : 0
  vpc_id     = var.vpc_id
  cidr_block = var.private_cidr_a

  availability_zone = "eu-west-3a"

  tags = {
    Name = var.private_subnet_a_name
  }
}

resource "aws_subnet" "private_b" {
  count      = var.private_cidr_b != null ? 1 : 0
  vpc_id     = var.vpc_id
  cidr_block = var.private_cidr_b

  availability_zone = "eu-west-3b"

  tags = {
    Name = var.private_subnet_b_name
  }
}