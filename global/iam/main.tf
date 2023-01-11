resource "aws_iam_user" "ptg-iam-users" {
  for_each = toset(var.user_names)
  name = each.value
}

#create iam policy for cloudwatch
resource "aws_iam_policy" "cloudwatch_readonly_perms" {
  name = "cloudwatch-readonly"
  policy = data.aws_iam_policy_document.cloudwatch_readonly_perms.json
}

resource "aws_iam_policy" "cloudwatch_fullaccess_perms" {
  name = "cloudwatch-fullaccess"
  policy = data.aws_iam_policy_document.cloudwatch_fullaccess_perms.json
}

#give fullaccess to neo?
resource "aws_iam_user_policy_attachment" "neo_cloudwatch_fullaccess" {
  count = var.give_neo_fullaccess ? 1 : 0
  
  user = aws_iam_user.ptg-iam-users["neo"].name
  policy_arn = aws_iam_policy.cloudwatch_fullaccess_perms.arn
}

resource "aws_iam_user_policy_attachment" "neo_cloudwatch_readonly" {
  count = var.give_neo_fullaccess ? 0 : 1

  user = aws_iam_user.ptg-iam-users["neo"].name
  policy_arn = aws_iam_policy.cloudwatch_readonly_perms.arn
}