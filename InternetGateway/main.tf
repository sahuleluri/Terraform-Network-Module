
resource "aws_internet_gateway" "IGW" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.internet_gateway_Name
  }
}