resource "aws_subnet" "pub_sub1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidrs [0]
  availability_zone = var.public_subnet_azs [0]
  map_public_ip_on_launch = true


  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "pub_sub2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidrs [1]
  availability_zone = var.public_subnet_azs [1]


  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_subnet" "pub_sub3" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidrs [2]
  availability_zone = var.public_subnet_azs [2]


  tags = {
    Name = "Public Subnet 3"
  }
}

resource "aws_subnet" "priv_sub1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidrs [0]
  availability_zone = var.private_subnet_azs [0]


  tags = {
    Name = "Pribate Subnet 1"
  }
}

resource "aws_subnet" "priv_sub2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidrs [1]
  availability_zone = var.private_subnet_azs [1]


  tags = {
    Name = "Private Subnet 2"
  }
}

resource "aws_subnet" "priv_sub3" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidrs [2]
  availability_zone = var.private_subnet_azs [2]


  tags = {
    Name = "Private Subnet 3"
  }
}

output "pub_sub1_id" {
  value = aws_subnet.pub_sub1.id
}

output "pub_sub2_id" {
  value = aws_subnet.pub_sub2.id
}

output "pub_sub3_id" {
  value = aws_subnet.pub_sub3.id
}

output "priv_sub1_id" {
  value = aws_subnet.priv_sub1.id
}

output "priv_sub2_id" {
  value = aws_subnet.priv_sub2.id
}

output "priv_sub3_id" {
  value = aws_subnet.priv_sub3.id
}
