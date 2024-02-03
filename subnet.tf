resource "aws_subnet" "trabalho_tf_subnet" {
  vpc_id                  = aws_vpc.trabalho_tf_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "aula-02-sb"
  }
}