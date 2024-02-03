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
  type = string
}
variable "aws_instance_type" {
  type = string
}
variable "aws_key" {
  type = string
}