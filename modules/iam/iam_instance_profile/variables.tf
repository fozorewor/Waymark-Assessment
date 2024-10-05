variable "iam_instance_profile_name" {
  description = "Name of IAM instance profile"
  default     = null
}

variable "iam_instance_profile_path" {
  description = "Path for the IAM instance profile"
  default     = "/"
}

variable "iam_instance_profile_role" {
  description = "Role to use for IAM Instance profile"
  default     = null
}

variable "tags" {
  description = "Tags to set on the IAM Instance profile. Default value is nothing. Type is a mapping of strings."
  type        = map(string)
  default     = {}
}