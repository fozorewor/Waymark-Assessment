variable "name" {
  description = "Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  default     = null
}

variable "subnets" {
  description = "list of subnets"
  default     = null
}

variable "launch_template" {
  description = " (Required) The short name of the capacity provider."
  default     = null
}

variable "target_group_arns" {
  default     = null
}

variable "tags" {
  default = null
}

variable "desired_capacity" {
  default = null
  type = number
}

variable "min_size" {
  default = null
  type = number
}

variable "max_size" {
  default = null
  type = number
}

variable "health_check_grace_period" {
  default = null
  type = number
}