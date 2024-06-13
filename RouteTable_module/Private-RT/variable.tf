variable "vpc-id" {
  description = "The ID of the vpc create from above module"
}

variable "privateRT-name" {
  description = "A string representing the Name tag value for the publicRT_tags"
  type        = string
}

variable "pvtroutes" {
  description = "List of route configurations"
  type        = list(object({
    cidr_block = string
    gateway_id = string
  }))
  default     = []
}
