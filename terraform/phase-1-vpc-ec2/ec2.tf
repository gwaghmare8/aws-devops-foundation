resource "aws_instance" "public" {
  ami                    = "ami-076a4551df416ceba"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  key_name               = var.key_name
  associate_public_ip_address = true


  user_data = file("${path.module}/../../scripts/userdata.sh")

  tags = {
    Name = "devops-ec2"
  }
}
