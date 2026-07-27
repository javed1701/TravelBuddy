resource "helm_release" "aws_load_balancer_controller" {

  name       = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"

  chart      = "aws-load-balancer-controller"

  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "region"
    value = var.aws_region
  }

  set {
    name  = "vpcId"
    value = var.vpc_id
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

}

resource "aws_iam_policy" "alb_controller" {
  name   = "${var.cluster_name}-alb-controller-policy"
  policy = file("${path.module}/iam-policy.json")
}

