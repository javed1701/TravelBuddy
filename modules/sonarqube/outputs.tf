output "instance_id" {
  value = aws_instance.sonarqube.id
}

output "private_ip" {
  value = aws_instance.sonarqube.private_ip
}