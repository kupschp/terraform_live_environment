output "iam_second_user" {
  value = aws_iam_user.ptg-iam-users[1].arn
  description = "second iam user created"
}

output "iam_all_users" {
  value = aws_iam_user.ptg-iam-users[*].arn
  description = "second iam user created"
}