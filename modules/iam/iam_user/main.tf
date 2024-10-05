resource "aws_iam_user" "user" {

  name          = var.iam_user
  path          = var.iam_user_path
  force_destroy = var.iam_user_false_destroy

  tags = var.iam_user_tags

}
