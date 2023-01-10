output "iam_all_users" {
  value = aws_iam_user.ptg-iam-users
  description = "second iam user created"
}