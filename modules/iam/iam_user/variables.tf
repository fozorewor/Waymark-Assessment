variable "iam_user" {
  description = "Username for the IAM Username"
  default     = null
}

variable "iam_user_path" {
  description = "Path for the IAM Username"
  default     = "/"
}

variable "iam_user_false_destroy" {
  description = "Boolean condition for whether IAM User can be false destroyed or not."
  default     = false
}

variable "iam_user_tags" {
  description = "Tags to set on the IAM user. Default value is nothing. Type is a mapping of strings."
  type        = map(string)
  default     = {}
}
