resource "aws_iam_group_policy_attachment" "policy_attachment" {
  group      = var.group_to_attach_policy
  policy_arn = var.policy_to_attach
}
