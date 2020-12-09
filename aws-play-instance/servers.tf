resource "aws_instance" "test_server" {
  ami = "ami-0f38c153936247588"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-uno.id
  key_name = "aws_tf.pub"
  security_groups = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_port.id]
  tags = {
    Name = "test_server"
  }
}