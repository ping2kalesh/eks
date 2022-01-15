resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = kalesha-eks-cluster
  node_group_name = "kalesha-eks-cluster-default-node-group"
  node_role_arn   = "arn:aws:iam::473745473587:role/myAmazonEKSNodeRole"
  subnet_ids      = [ aws_subnet.eks-pubsubnet01.id, aws_subnet.eks-pubsubnet02.id, aws_subnet.eks-pubsubnet03.id ] 
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.

  tags = {
    Name = "kalesha-eks-cluster-default-node-group"
  }
}

