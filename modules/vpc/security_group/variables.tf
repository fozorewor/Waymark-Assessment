variable "name" {
  description = "Name of the security group. If omitted, Terraform will assign a random, unique name."
  default     = null
}

variable "vpc_id" {
  description = "The ID of the associated VPC."
  default     = null
}

variable "tags" {
  description = "Tags to set on the Security Group. Default value is nothing. Type is a mapping of strings."
  type        = map(string)
  default     = {}
}
