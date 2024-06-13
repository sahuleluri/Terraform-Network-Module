resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.nat_subnet_ids[0] # Use the first subnet ID as the primary subnet
}

resource "aws_eip" "nat_eip" {
  # Remove the 'vpc' attribute, as it is deprecated
}

