

variable "image_id" {
  description = "EC2 image for ecs optimized ec2"
  default     = "ami-0eba366342cb1dfda"
}

variable "iam_instance_profile" {
  default     = null
}

variable "security_groups" {
  description = "(Optional) A list of security group IDs to assign to the asg."
  type        = list(string)
  default     = []
}

 variable "user_data" {
   default     = null
 }

variable "instance_type" {
  default     = "t2.micro"
}

variable "key_name" {
  default     = null
}

variable "name" {
  default     = null
}

variable "tags" {
  description = "Launcg template tags"
  type        = map(string)
  default     = {}
}


