output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "cluster_ca" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}
output "cluster_security_group_id" {
  value = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}