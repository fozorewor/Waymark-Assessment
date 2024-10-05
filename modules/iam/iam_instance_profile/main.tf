resource "aws_iam_instance_profile" "instance_profile" {
  name = var.iam_instance_profile_name
  path = var.iam_instance_profile_path
  role = var.iam_instance_profile_role
  tags                     = var.tags
}
