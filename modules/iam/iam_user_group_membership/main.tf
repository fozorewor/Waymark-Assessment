resource "aws_iam_user_group_membership" "membership" {

  user   = var.membership_user
  groups = var.membership_groups

}
