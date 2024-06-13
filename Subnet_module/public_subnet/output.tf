output "subnet_ids" {
  value = aws_subnet.PubTreeGreenSubnet[*].id
}
