data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
resource "aws_instance" "myec2" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = var.aws_instance_type
  key_name        = var.aws_key_pair
  subnet_id       = var.subnet_id
  security_groups = [var.security_group]
  user_data = file("${path.module}/script.sh")
  associate_public_ip_address = true

  tags = {
    Name = var.aws_instance_name
  }
  
}
