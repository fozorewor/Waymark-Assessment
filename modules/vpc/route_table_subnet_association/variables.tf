variable "route_table_id" {
  description = "The ID of the routing table to associate with."
  default     = null
}

variable "subnet_id" {
  description = "The subnet ID to create an association."
  default     = null
}
