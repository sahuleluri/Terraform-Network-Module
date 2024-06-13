output "vpc_id" {
  value = aws_vpc.TreeGreenVpc.id
}

output "default_route_table_id" {
  value = aws_vpc.TreeGreenVpc.default_route_table_id
}
