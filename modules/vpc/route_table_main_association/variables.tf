variable "route_table_id" {
  description = "The ID of the routing table to associate with."
  default     = null
}

variable "vpc_id" {
  description = "The ID of the VPC whose main route table should be set."
  default     = null
}
