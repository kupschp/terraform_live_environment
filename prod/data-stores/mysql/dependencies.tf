data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "prod-db-creds"
}