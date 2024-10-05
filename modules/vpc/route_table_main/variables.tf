variable "rt_vpc_id" {
  description = "The VPC ID."
  default     = null
}

variable "rt_tags" {
  description = "Tags to set on the VPC's main Route Table. Default value is nothing. Type is a mapping of strings."
  type        = map(string)
  default     = {}
}
