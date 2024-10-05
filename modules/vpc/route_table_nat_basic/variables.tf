variable "rt_vpc_id" {
  description = "The VPC ID."
  default     = null
}

variable "rt_route_cidr_block" {
  description = "The CIDR block of the route."
  default     = null
}

variable "rt_route_nat_gateway_id" {
  description = "Identifier of a VPC NAT gateway."
  default     = null
}


variable "rt_tags" {
  description = "Tags to set on the VPC NAT Gateway Route Table. Default value is nothing. Type is a mapping of strings."
  type        = map(string)
  default     = {}
}
