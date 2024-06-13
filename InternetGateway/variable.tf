variable "vpc_id" {
  description = "The ID of the VPC to create the Internet Gateway in"
}

variable "internet_gateway_Name" {
  description = "A string representing the Name tag value for the Internet Gateway"
  type        = string
}