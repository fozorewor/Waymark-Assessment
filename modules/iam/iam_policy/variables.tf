variable "policy_description" {
  description = "Description of IAM policy"
  default     = null
}

variable "policy_name" {
  description = "Name of IAM policy"
  default     = null
}

variable "policy_path" {
  description = "Path of IAM policy"
  default     = null
}

variable "policy_template" {
  description = "Template of policy"
  default     = null
}

variable "tags" {
  description = "Tags to set on the IAM policy. Default value is nothing. Type is a mapping of strings."
  type        = map(string)
  default     = {}
}