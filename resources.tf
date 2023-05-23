locals {
  max_free_tier_instances = 1
}

resource "aws_instance" "free_ec2" {
  count         = local.max_free_tier_instances
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  
  # インスタンス削除防止
  lifecycle {
    prevent_destroy = true
  }

  # インスタンス作成時に実行するコマンド
  provisioner "local-exec" {
    command = "echo 'Max free tier instances exceeded. Destroying...' && terraform destroy -auto-approve"
    when    = "create"
  }

  # インスタンス削除時に実行コマンド
  provisioner "local-exec" {
    command = "echo 'Max free tier instances exceeded. Destroying...' && terraform destroy -auto-approve"
    when    = "destroy"
  }
}

