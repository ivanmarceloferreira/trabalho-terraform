resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.trabalho_tf_subnet.id
  route_table_id = aws_route_table.trabalho_tf_route_table.id
}
