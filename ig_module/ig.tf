resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "wordpress_igw"
  }
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}