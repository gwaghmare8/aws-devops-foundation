data "aws_ssm_parameter" "amazon_linux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "phase2-vpc"
}

module "subnet" {
  source = "../../modules/subnet"

  vpc_id                = module.vpc.vpc_id
  public_cidr           = "10.0.1.0/24"
  private_cidr_a        = "10.0.2.0/24"
  private_cidr_b        = "10.0.3.0/24"
  public_subnet_name    = "public_subnet"
  private_subnet_a_name = "private_subnet_a"
  private_subnet_b_name = "private_subnet_b"
}

module "nat" {
  source           = "../../modules/nat"
  public_subnet_id = module.subnet.public_subnet_id
}

module "route_table" {
  source              = "../../modules/route_table"
  vpc_id              = module.vpc.vpc_id
  igw_id              = module.vpc.igw_id
  nat_id              = module.nat.nat_id
  public_subnet_id    = module.subnet.public_subnet_id
  private_subnet_a_id = module.subnet.private_subnet_a_id
  private_subnet_b_id = module.subnet.private_subnet_b_id

}

module "security_group" {
  source       = "../../modules/security_group"
  vpc_id       = module.vpc.vpc_id
  sg_name      = "phase2-sg"
  allowed_cidr = ["0.0.0.0/0"]
}

module "iam" {
  source = "../../modules/iam"
}

module "ec2" {
  source                = "../../modules/ec2"
  ami_id                = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type         = "t3.micro"
  subnet_id             = module.subnet.public_subnet_id
  security_group_id     = module.security_group.sg_id
  instance_name         = "phase-2-ec2_instance"
  instance_name_profile = module.iam.instance_name_profile
  user_data_file        = "../../scripts/userdata.sh"
  key_name              = var.key_name
}

module "rds" {
  source = "../../modules/rds"

  db_name           = "test_phase"
  username          = var.db_username
  password          = var.db_password
  security_group_id = module.security_group.rds_sg_id
  private_subnet_ids = [
    module.subnet.private_subnet_a_id,
    module.subnet.private_subnet_b_id
  ]
}