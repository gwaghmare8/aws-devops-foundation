data "aws_ami" "amazon_linux_2023" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "al2023-ami-2023.*-x86_64"
    ]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "phase1-vpc"
}

module "security_group" {
  source       = "../../modules/security_group"
  vpc_id       = module.vpc.vpc_id
  sg_name      = "phase1-sg"
  allowed_cidr = ["0.0.0.0/0"]
}

module "subnet" {
    source       = "../../modules/subnet"
    vpc_id       = module.vpc.vpc_id
    public_cidr  = "10.0.1.0/24"
}

module "route_table" {
  source           = "../../modules/route_table"
  vpc_id           = module.vpc.vpc_id
  igw_id           = module.vpc.igw_id
  public_subnet_id = module.subnet.public_subnet_id
}

module "ec2" {
  source            = "../../modules/ec2"
  ami_id            = data.aws_ami.amazon_linux_2023.id
  instance_type     = "t3.micro"
  subnet_id         = module.subnet.public_subnet_id
  security_group_id = module.security_group.sg_id
  key_name          = var.key_name
  instance_name     = "phase1-ec2"
  user_data_file    = "../../scripts/userdata.sh"
}