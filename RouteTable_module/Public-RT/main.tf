resource "aws_default_route_table" "Default-RT" {
  default_route_table_id = var.default_route_table_id


    dynamic "route" {
    for_each = var.pubroutes
    content {
      cidr_block = route.value.cidr_block
      gateway_id = route.value.gateway_id
    }
  }

  tags = {
    Name = var.publicRT_Name
  }
}