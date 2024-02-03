data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Ubuntu / Canonical owner ID
}

resource "aws_instance" "web" {
  count                         = 3
  ami                           = data.aws_ami.ubuntu.id
  instance_type                 = "t2.micro"
  key_name                      = aws_key_pair.deployer_key.key_name
  subnet_id                     = aws_subnet.trabalho_tf_subnet.id
  vpc_security_group_ids        = [aws_security_group.trabalho_tf_sg.id]
  associate_public_ip_address   = true
  user_data = <<-EOF
      #!/bin/bash
      sudo apt-get update
      sudo apt-get install -y openjdk-17-jdk apache2
      
      # Habilitar e iniciar o Apache Web Server
      systemctl enable apache2
      systemctl start apache2
      
      # Verificar se o Java foi instalado corretamente
      java -version

      EOF

  tags = {
    Name = "WebServer-TF-${count.index}"
  }
}