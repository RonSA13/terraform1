variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "aws region"
}

variable "aws_profile" {
  default     = "default"
  type        = string
  description = "aws profile name"
}

variable "aws_ami" {
  type    = string
  default = "ami-0277155c3f0ab2930"
}
variable "aws_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "aws_key" {
  type    = string
  default = "sample_key"
}

variable "aws_list_instances" {
  type = list(string)
  default = [ "" ]
}