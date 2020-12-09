resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  vpc_id = aws_vpc.test-env.id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  // Terraform removes the default rule
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_port" {
  name = "allow_port"
  description = "Allow TLS inbound traffic"
  vpc_id = aws_vpc.test-env.id

  ingress {
    description = "TLS from VPC"
    from_port = 7983
    to_port = 7983
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.test-env.cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow_port"
  }
}