variable "iam_role_policy_arn" {
  description = "ARN of IAM role policy to attach"
  default     = null
}

variable "iam_role_name_to_attach" {
  description = "IAM role name to attach policy to"
  default     = null
}
