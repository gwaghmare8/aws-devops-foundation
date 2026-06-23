output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_a_id" {
  value = length(aws_subnet.private_a) > 0 ? aws_subnet.private_a[0].id : null
}

output "private_subnet_b_id" {
  value = length(aws_subnet.private_b) > 0 ? aws_subnet.private_b[0].id : null
}

output "private_subnet_ids" {
  value = compact([
    try(aws_subnet.private_a[0].id, null),
    try(aws_subnet.private_b[0].id, null)
  ])
}