resource "aws_subnet" "PubTreeGreenSubnet" {
  count             = length(var.subnet_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_blocks[count.index]
  availability_zone = var.pubavailability_zone[count.index]  # Use the same index as CIDR blocks

  tags = {
    Name = var.Pubsubnet_name_tags[count.index]
  }
}