resource "aws_instance" "aws_ec2_instance" {
  ami = var.aws_ami
  instance_type = var.aws_instance_type
  key_name = var.aws_key
  user_data = file("user_data.sh")


  tags = {
    name = "ec2_instanc_1"
  }
}