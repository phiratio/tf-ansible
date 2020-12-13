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
//  count = 2
  for_each = {
    prod = "t2.micro"
    dev = "t2.micro"
  }

  ami = "ami-08d70e59c07c61a3a"
//  instance_type = var.instance_type
  instance_type = each.value

//  tags = {
//    Name = "qwe ${count.index}"
//  }

  tags = {
    Name = "qwe ${each.key}"
  }
}
