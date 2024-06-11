resource "aws_route_table" "private-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block    = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "priv_sub1" {
  subnet_id      = var.private_subnet_ids[0]
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "priv_sub2" {
  subnet_id      = var.private_subnet_ids[1]
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "priv_sub3" {
  subnet_id      = var.private_subnet_ids[2]
  route_table_id = aws_route_table.private-rt.id
}


output "private_route_table_id" {
  value = aws_route_table.private-rt.id
}