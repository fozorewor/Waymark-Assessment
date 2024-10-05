variable "env" {
  default = "dev"
}

variable "project" {
  default = "nrd"
}

//variable "ec2_instace_profile" {
//  default = ""
//}

data "aws_caller_identity" "current" {}