module "vpc" {
  source = "./modules/vpc"

  aws_region      = var.aws_region
  project_name    = var.project_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "security-groups" {
  source = "./modules/security-groups"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "jenkins" {
  source = "./modules/jenkins"

  project_name      = var.project_name
  subnet_ids        = module.vpc.public_subnet_ids[0]
  instance_profile  = module.iam.jenkins_instance_profile
  security_group_id = module.security-groups.jenkins_sg_id
  key_name          = var.key_name
  ami_id            = var.ami_id
  instance_type     = "m7i-flex.large"
}

module "sonarqube" {
  source            = "./modules/sonarqube"
  project_name      = var.project_name
  subnet_id         = module.vpc.private_subnet_ids[0]
  security_group_id = module.security-groups.sonarqube_sg_id
  key_name          = var.key_name
  ami_id            = var.ami_id
  instance_type     = "m7i-flex.large"
}

module "eks" {

  source = "./modules/eks"

  project_name = var.project_name

  subnet_ids = module.vpc.private_subnet_ids

  cluster_role_arn = module.iam.eks_cluster_role_arn

  worker_role_arn = module.iam.worker_role_arn

  depends_on = [module.iam]
}

module "alb" {

  source = "./modules/alb"

  project_name = var.project_name

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = module.vpc.public_subnet_ids

}

module "aws-load-balancer-controller" {

  source = "./modules/alb-controller"

  cluster_name = module.eks.cluster_name

  aws_region = var.aws_region

  vpc_id = module.vpc.vpc_id

}

resource "aws_security_group_rule" "alb_to_eks_nodes" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = module.eks.cluster_security_group_id
  source_security_group_id = module.alb.alb_security_group_id
  description              = "Allow ALB to reach EKS pods/nodes"
}