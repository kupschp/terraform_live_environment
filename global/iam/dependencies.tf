data "aws_iam_policy_document" "cloudwatch_readonly_perms" {
  statement {
    effect = "Allow"
    actions = [
        "cloudwatch:Describe*",
        "cloudwatch:Get*",
        "cloudwatch:"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "cloudwatch_fullaccess_perms" {
  statement {
    effect = "Allow"
    actions = ["cloudwatch:*"]
    resources = [ "*" ]
  }
}