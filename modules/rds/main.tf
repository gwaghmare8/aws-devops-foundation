resource "aws_db_subnet_group" "db_subnet" {
  name = "phase2-db-subnet-group"

  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "postgres" {
  identifier = "phase2-postgres"

  engine         = "postgres"
  engine_version = "17"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  db_name  = var.db_name
  username = var.username
  password = var.password

  publicly_accessible = false

  skip_final_snapshot = true

  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [var.security_group_id]
}