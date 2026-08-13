output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "jenkins_sg_id" {
  value = aws_security_group.jenkins_sg.id
}

output "sonarqube_sg_id" {
  value = aws_security_group.sonarqube_sg.id
}

output "eks_sg_id" {
  value = aws_security_group.eks.id
}