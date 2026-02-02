output "my_ec2_public_id" {
  value = {
    for k, instance in aws_instance.my_second_instance : k => instance.id 
  }
}
output "my_ec2_public_DNS" {
  value = {
    for k, instances in aws_instance.my_second_instance : k => instances.public_dns
  }
}
