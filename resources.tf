locals {
  max_free_tier_ec2_instances = 1
  max_free_tier_rds_instances = 1
}

data "aws_canonical_user_id" "current" {}

resource "aws_instance" "web" {
  count         = local.max_free_tier_ec2_instances
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_db_instance" "db" {
  count             = local.max_free_tier_rds_instances
  engine            = "mysql"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  username          = "admin"
  password          = "password"

  lifecycle {
    prevent_destroy = true
  }
}


