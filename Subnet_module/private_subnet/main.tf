resource "aws_subnet" "PvtTreeGreenSubnet" {
  count             = length(var.pvtsubnet_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = var.pvtsubnet_cidr_blocks[count.index]
  availability_zone = var.pvtavailability_zone[count.index]  # Use the same index as CIDR blocks

  tags = {
    Name = var.subnet_name_tags[count.index]
  }
}

resource "aws_route_table_association" "PrivateRt-Association" {
  count = length(aws_subnet.PvtTreeGreenSubnet.*.id)  # Count based on the number of created subnets

  subnet_id      = aws_subnet.PvtTreeGreenSubnet[count.index].id
  route_table_id = var.Pvt_RT_Id
}