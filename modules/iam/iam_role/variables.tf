variable "iam_role_name" {
  description = "Name of IAM Role"
  default     = null
}

variable "iam_role_path" {
  description = "Path for the IAM Role"
  default     = "/"
}

variable "iam_role_assume_role_policy_template" {
  description = "Assume role template for the IAM Role"
  default     = null
}

variable "iam_role_managed_policy_arns" {
  description = "Managed roles arns to add to the role."
  type        = list(string)
  default     = null
}

variable "iam_role_max_session_duration" {
  description = "Max session duration for IAM Role"
  default     = "3600"
}

variable "tags" {
  description = "Tags to set on the IAM role. Default value is nothing. Type is a mapping of strings."
  type        = map(string)
  default     = {}
}