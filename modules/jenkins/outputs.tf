
output "instance_id" {
  value = aws_instance.jenkins.id
}

output "private_ip" {
  value = aws_instance.jenkins.private_ip
}

output "jenkins_elastic_ip" {
  description = "Elastic IP address of Jenkins"
  value       = aws_eip.jenkins.public_ip
}
