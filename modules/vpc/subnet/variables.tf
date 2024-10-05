variable "subnet_vpc_id" {
  description = "The VPC Id"
  default     = null
}

variable "subnet_assign_ipv6_address_on_creation" {
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false."
  default     = false
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  default     = "10.40.0.0/22"
}

variable "subnet_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false"
  default     = false
}

variable "subnet_tags" {
  description = "Tags to set on the Subnet. Default value is nothing. Type is a mapping of strings."
  type        = map(string)
  default     = {}
}

variable "availability_zone" {
  description = "The availability zone of the subnet."
  default     = null
}
