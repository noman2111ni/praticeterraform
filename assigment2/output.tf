output "my_ec2_public_id" {
  value = aws_instance.my_second_instance[*].public_ip
}
output "my_ec2_public_DNS" {
  value = aws_instance.my_second_instance[*].public_dns
}
