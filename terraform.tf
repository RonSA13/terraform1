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
  access_key = "AKIA5HZNCCHZXYGYVSC4"
  secret_key = "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"
}

