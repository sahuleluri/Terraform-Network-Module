resource "aws_vpc" "TreeGreenVpc" {
  cidr_block       = var.vpc_cidr_blocks
  instance_tenancy = "default"

  tags = {
    Name = var.vpc-name
  }
}
