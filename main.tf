resource "aws_instance" "aws_ec2_instance" {
  count = 2
  ami             = var.aws_ami
  # instance_type   = var.aws_instance_type
  instance_type = var.aws_instance_type
  key_name        = var.aws_key
  user_data       = file("user_data.sh")
  vpc_security_group_ids = [aws_security_group.allow_http_port.id]

  tags = {
    name = "ec2_instance-${count.index}"
  }
}


# security group

resource "aws_security_group" "allow_http_port" {
  name        = "allow_http_sample"

  description = "Allow TLS inbound traffic HTTP"

  tags = {
    Name = "allow_http"
  }
}


resource "aws_security_group" "ec2_sg" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  # vpc_id      = data.aws_vpc.GetVPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-ec2-security-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_http" {
  security_group_id = aws_security_group.allow_http_port.id
  # cidr_ipv4         = aws_vpc.main.cidr_block
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ssh" {
  security_group_id = aws_security_group.allow_http_port.id
  # cidr_ipv6         = aws_vpc.main.ipv6_cidr_block
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http_port.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
