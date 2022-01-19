resource "aws_eks_cluster" "kalesha-eks-cluster" {
  name     = "kalesha-eks-cluster"
  role_arn = aws_iam_role.cluster.arn
  version  = "1.20"
  vpc_config {
    subnet_ids = [aws_subnet.eks-pubsubnet01.id, aws_subnet.eks-pubsubnet02.id, aws_subnet.eks-pubsubnet03.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,
    aws_ima_role_policy_attachment.cluster-AmazonEKSServicePolicy,
  ]

}

output "endpoint" {
  value = aws_eks_cluster.kalesha-eks-cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.kalesha-eks-cluster.certificate_authority[0].data
}

