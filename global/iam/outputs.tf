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
  value = "%{for index, user_name in var.user_names} ${index} ${user_name}, %{endfor}"
}

output "neo_cloudwatch_policy_arn" {
  value = (
    var.give_neo_fullaccess
    ? aws_iam_user_policy_attachment.neo_cloudwatch_fullaccess[0].policy_arn
    : aws_iam_user_policy_attachment.neo_cloudwatch_readonly[0].policy_arn
  )
}

#only add commas if it's not the end of the map :)
output "for_directive_with_if" {
  value = <<EOF
  %{ for index, name in var.user_names } 
    ${name}
    %{ if index < length(var.user_names) - 1 }
      ,
    %{ else } . 
    %{ endif }
  %{ endfor }
  EOF
}