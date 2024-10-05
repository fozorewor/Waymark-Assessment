resource "aws_iam_role" "role" {

  name                 = var.iam_role_name
  path                 = var.iam_role_path
  assume_role_policy   = var.iam_role_assume_role_policy_template
  managed_policy_arns  = var.iam_role_managed_policy_arns
  max_session_duration = var.iam_role_max_session_duration
  tags                     = var.tags

}
