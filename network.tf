resource "aws_vpc" "eks-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name                                        = "eks-vpc"
    "kubernetes.io/cluster/kalesha-eks-cluster" = "shared"
  }
}

resource "aws_subnet" "eks-pubsubnet01" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name                                        = "eks-pubsubnet01"
    "kubernetes.io/cluster/kalesha-eks-cluster" = "shared"
  }
}

resource "aws_subnet" "eks-pubsubnet02" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name                                        = "eks-pubsubnet02"
    "kubernetes.io/cluster/kalesha-eks-cluster" = "shared"
  }
}


resource "aws_subnet" "eks-pubsubnet03" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name                                        = "eks-pubsubnet03"
    "kubernetes.io/cluster/kalesha-eks-cluster" = "shared"
  }
}

