resource "aws_route_table" "trabalho_tf_route_table" {
  vpc_id = aws_vpc.trabalho_tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.trabalho_tf_gw.id
  }

  tags = {
    Name = "Trabalho-TF-route-table"
  }
}