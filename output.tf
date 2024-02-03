output "ec2_public_ip" {
  value = aws_instance.aws_ec2_instance.public_ip
}