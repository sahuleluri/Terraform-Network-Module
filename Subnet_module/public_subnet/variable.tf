variable "subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for subnets"
}

variable "Pubsubnet_name_tags" {
  type        = list(string)
  description = "Names for subnets"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "pubavailability_zone" {
  type        = list(string)
  description = "Availability zone for the subnets"
}