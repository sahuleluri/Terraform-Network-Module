variable "pvtsubnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for subnets"
}

variable "subnet_name_tags" {
  type        = list(string)
  description = "Names for subnets"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "pvtavailability_zone" {
  type        = list(string)
  description = "Availability zone for the subnets"
}

variable "Pvt_RT_Id" {
  type        = string
  description = "ID of the Pvt-RT"
}