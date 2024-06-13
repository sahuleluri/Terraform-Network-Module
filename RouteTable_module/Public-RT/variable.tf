variable "default_route_table_id" {
  description = "The ID of the default route table"
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
}

variable "publicRT_Name" {
  description = "A string representing the Name tag value for the publicRT_tags"
  type        = string
}

variable "pubroutes" {
  description = "List of route configurations"
  type        = list(object({
    cidr_block = string
    gateway_id = string
  }))
  default     = []
}
