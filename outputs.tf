output "project_name" {
  value = var.project_name
}

output "aws_region" {
  value = var.aws_region
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "jenkins_instance_id" {
  value = module.jenkins.instance_id
}

output "jenkins_elastic_ip" {
  description = "Elastic IP address of Jenkins"
  value       = module.jenkins.jenkins_elastic_ip
}

output "sonarqube_private_ip" {
  value = module.sonarqube.private_ip
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}

output "jenkins_instance_profile" {
  value = module.iam.jenkins_instance_profile
}

output "eks_cluster_role_arn" {
  value = module.iam.eks_cluster_role_arn
}

output "worker_role_arn" {
  value = module.iam.worker_role_arn
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}