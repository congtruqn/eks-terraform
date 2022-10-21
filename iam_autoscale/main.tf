module "cluster_autoscaler" {
  source               = "git::https://github.com/rhythmictech/terraform-aws-eks-iam-cluster-autoscaler"
  cluster_name         = "trutran-eks-cluster"
  issuer_url           = "https://oidc.eks.ap-southeast-1.amazonaws.com/id/FFE4B4FCA6A15A6EE33E3DA8EF5F624F"
  kubernetes_namespace = "kube-system"
}
locals {
  eks_cluster_name  = "trutran-eks-cluster"
}

data "aws_eks_cluster" "eks_cluster" {
  name = local.eks_cluster_name
}

# Obtain TLS certificate for the OIDC provider
data "tls_certificate" "tls" {
  url = data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

# Create OIDC Provider using TLS certificate
resource "aws_iam_openid_connect_provider" "eks_ca_oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.tls.certificates[0].sha1_fingerprint]
  url             = data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}