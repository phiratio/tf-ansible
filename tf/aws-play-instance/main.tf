// To use this snippet with Terraform 0.12, remove the terraform {} block.
// Also you need to setup aws account
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.33"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-west-2"
}












