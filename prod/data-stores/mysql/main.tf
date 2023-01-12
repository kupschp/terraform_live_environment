module "database_instance" {
  source = "github.com/kupschp/terraform_modules//data-stores/mysql?ref=v0.0.1"

  #use stored creds in aws secret manager
  db_username = local.db_creds.username
  db_password = local.db_creds.password

  db_instance_type = "db.t2.micro"
  db_storage_size = 10
  identifier_prefix = "prod-ptg"
  db_name = "prod_ptg"
}