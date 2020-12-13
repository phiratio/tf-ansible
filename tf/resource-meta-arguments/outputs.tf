//output "instance_public_ip" {
//  value = aws_instance.example[*].public_ip
//}
output "instance_public_ip" {
  value = {
    for op in aws_instance.example:
        op.id => op.private_ip
  }
}
