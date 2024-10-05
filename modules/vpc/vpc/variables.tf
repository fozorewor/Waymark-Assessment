variable "vpc_assign_generated_ipv6_cidr_block" {
  description = "To assign generated ipv6 cidr block or not"
  default     = false
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.40.0.0/16"
}

variable "vpc_enable_classiclink" {
  description = "A boolean flag to enable/disable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  default     = false
}

variable "vpc_enable_classiclink_dns_support" {
  description = "A boolean flag to enable/disable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic."
  default     = false
}

variable "vpc_enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  default     = true
}

variable "vpc_enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC."
  default     = true
}

variable "vpc_instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. Using either of the other options (dedicated or host) costs at least $2/hr."
  default     = "default"
}

variable "vpc_tags" {
  description = "Tags to set on the VPC. Default value is nothing. Type is a mapping of strings."
  type        = map(string)
  default     = {}
}
