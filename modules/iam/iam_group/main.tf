resource "aws_iam_group" "group" {
  name = var.iam_group
  path = var.iam_group_path
}
