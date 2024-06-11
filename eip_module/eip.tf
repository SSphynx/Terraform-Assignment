resource "aws_eip" "nat_gw_eip" {
  domain = "vpc"

  tags = {
    Name = "NAT Gateway eip"
  }
}

output "eip_id" {
  value = aws_eip.nat_gw_eip.id
}
