output "web_instance_ids" {
  value = aws_instance.web[*].id
}

output "db_instance_ids" {
  value = aws_db_instance.db[*].id
}
