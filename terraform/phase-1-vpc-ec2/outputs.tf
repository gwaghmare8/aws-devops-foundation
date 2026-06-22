output "public_ip" {
  value = aws_instance.public.public_ip
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_ip" {
  value = aws_instance.private.private_ip
}