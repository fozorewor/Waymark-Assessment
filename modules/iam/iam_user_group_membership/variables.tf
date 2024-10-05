variable "membership_user" {
  description = "Username for the IAM Username"
  default     = null
}

variable "membership_groups" {
  description = "List of IAM group to add the IAM User in. Default value is nothing. Type is list."
  type        = list(string)
  default     = []
}
