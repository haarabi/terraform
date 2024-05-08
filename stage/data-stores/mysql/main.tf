terraform {
  backend "s3" {
    # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
    #     # manually, uncomment and fill in the config below.
  
    bucket         = "hossein-stage-data-stores-mysql-terraform-state"
    key            = "stage/data-stores/mysql/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "hossein-stage-data-stores-mysql-terraform-locks"
    encrypt        = true
  }
}

provider "aws" { # E: This configuration requires provider registry.terraform.io/hashicorp/aws, but that provider isn't …
 region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}
