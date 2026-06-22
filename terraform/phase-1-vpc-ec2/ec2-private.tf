resource "aws_instance" "private" {
  ami                    = "ami-076a4551df416ceba" # Amazon Linux (adjust for eu-west-3 if needed)
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private.id]
  associate_public_ip_address = false
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "private-ec2"
  }

}