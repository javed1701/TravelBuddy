resource "aws_eks_cluster" "eks" {

  name     = "${var.project_name}-cluster"
  role_arn = var.cluster_role_arn
  version  = "1.32"

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_public_access  = true
    endpoint_private_access = true
  }
}

resource "aws_eks_node_group" "workers" {

  cluster_name = aws_eks_cluster.eks.name

  node_group_name = "${var.project_name}-workers"

  node_role_arn = var.worker_role_arn

  subnet_ids = var.subnet_ids
  ami_type = "AL2023_x86_64_STANDARD"

  instance_types = [

    "m7i-flex.large"

  ]

  capacity_type = "ON_DEMAND"

  scaling_config {

    desired_size = 2

    min_size = 2

    max_size = 4

  }

  depends_on = [

    aws_eks_cluster.eks

  ]

}


