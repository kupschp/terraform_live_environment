output "iam_all_users" {
  value = aws_iam_user.ptg-iam-users
  description = "second iam user created"
}

output "upper_user_name" {
  value = [for user_name in var.user_names : upper(user_name)]
}