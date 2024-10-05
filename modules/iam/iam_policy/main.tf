resource "aws_iam_policy" "policy" {

  description = var.policy_description
  name        = var.policy_name
  path        = var.policy_path
  policy      = var.policy_template
  tags                     = var.tags

}
