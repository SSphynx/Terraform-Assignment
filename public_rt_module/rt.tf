resource "aws_route_table" "wordpress-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "wordpess-rt"
  }
}

resource "aws_route_table_association" "pub_sub1" {
  subnet_id      = var.public_subnet_ids[0]
  route_table_id = aws_route_table.wordpress-rt.id
}

resource "aws_route_table_association" "pub_sub2" {
  subnet_id      = var.public_subnet_ids[1]
  route_table_id = aws_route_table.wordpress-rt.id
}

resource "aws_route_table_association" "pub_sub3" {
  subnet_id      = var.public_subnet_ids[2]
  route_table_id = aws_route_table.wordpress-rt.id
}

output "public_route_table_id" {
  value = aws_route_table.wordpress-rt.id
}