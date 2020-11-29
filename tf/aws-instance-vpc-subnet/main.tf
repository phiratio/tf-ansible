terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = "opa"
    Uni = "da"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "10.5.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.5.1.0/16"

  tags = {
    Name = "Main"
  }
}