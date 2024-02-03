resource "aws_internet_gateway" "trabalho_tf_gw" {
  vpc_id = aws_vpc.trabalho_tf_vpc.id

  tags = {
    Name = "Trabalho-TF-gateway"
  }
}