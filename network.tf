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
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "eks-pubsubnet01"
    "kubernetes.io/cluster/kalesha-eks-cluster" = "shared"
  }
}

resource "aws_subnet" "eks-pubsubnet02" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "eks-pubsubnet02"
    "kubernetes.io/cluster/kalesha-eks-cluster" = "shared"
  }
}


resource "aws_subnet" "eks-pubsubnet03" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "eks-pubsubnet03"
    "kubernetes.io/cluster/kalesha-eks-cluster" = "shared"
  }
}

resource "aws_internet_gateway" "eks-vpc-igw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = {
    Name = "eks-vpc-igw"
  }
}


resource "aws_route_table" "eks-vpc-pub-routetable" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-vpc-igw.id
  }


  tags = {
    Name = "eks-vpc-pub-routetable"
  }
}

resource "aws_route_table_association" "pubsubnet01-rtassociation" {
  subnet_id      = aws_subnet.eks-pubsubnet01.id
  route_table_id = aws_route_table.eks-vpc-pub-routetable.id
}

resource "aws_route_table_association" "pubsubnet02-rtassociation" {
  subnet_id      = aws_subnet.eks-pubsubnet02.id
  route_table_id = aws_route_table.eks-vpc-pub-routetable.id
}

resource "aws_route_table_association" "pubsubnet03-rtassociation" {
  subnet_id      = aws_subnet.eks-pubsubnet03.id
  route_table_id = aws_route_table.eks-vpc-pub-routetable.id
}

