resource "aws_eks_cluster" "kalesha-eks-cluster" {
  name     = "kalesha-eks-cluster"
  role_arn = "arn:aws:iam::473745473587:role/myAmazonEKSClusterRole"
  version  = "1.18"
  vpc_config {
    subnet_ids = [aws_subnet.eks-pubsubnet01.id, aws_subnet.eks-pubsubnet02.id, aws_subnet.eks-pubsubnet03.id]
  }


}

output "endpoint" {
  value = aws_eks_cluster.kalesha-eks-cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.kalesha-eks-cluster.certificate_authority[0].data
}

