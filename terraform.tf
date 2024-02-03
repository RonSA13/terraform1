terraform {
  # required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  profile    = "default"
  access_key = var.aws_accesskey
  secret_key = var.aws_secretkey
}

