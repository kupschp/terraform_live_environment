resource "aws_iam_user" "ptg-iam-users" {
  count = length(var.user_names)
  name = var.user_names[count.index]
}