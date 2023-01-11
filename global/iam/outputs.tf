output "iam_all_users" {
  value = aws_iam_user.ptg-iam-users
  description = "second iam user created"
}

output "upper_user_name" {
  value = [for user_name in var.user_names : upper(user_name)]
}

output "short_upper_names" {
  value = [for user_name in var.user_names : upper(user_name) if length(user_name) < 5]
}

output "using_map_example_loop" {
  value = [for name, role in var.using_map_example : "${name} is ${role}"]
}

output "uppercase_roles" {
  value = {for name, role in var.using_map_example: upper(name) => upper(role)}
}

output "for_directive" {
  value = "%{for user_name in var.user_names} ${user_name} %{endfor}"
}