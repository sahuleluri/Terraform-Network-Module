resource "aws_route_table" "PrivateRT" {
  vpc_id = var.vpc-id

  dynamic "route" {
    for_each = var.pvtroutes
    content {
      cidr_block = route.value.cidr_block
      gateway_id = route.value.gateway_id
    }
  }

  tags = {
    Name = var.privateRT-name
  }
}
