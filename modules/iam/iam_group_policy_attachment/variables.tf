variable "group_to_attach_policy" {
  description = "Group name to attach the policy to"
  default     = null
}

variable "policy_to_attach" {
  description = "Path for the IAM Group"
  default     = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}
