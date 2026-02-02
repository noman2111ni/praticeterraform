output "aws_instace_public_ip" {
  value = aws_instance.my_first_instance.public_ip
}
output "aws_instace_public_DNS" {
  value = aws_instance.my_first_instance.public_dns
}
