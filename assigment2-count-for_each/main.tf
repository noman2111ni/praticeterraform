resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("noman.pub")
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
# Create an EC2 instance
resource "aws_instance" "my_second_instance" {
  # count                  = 2 # count is a meta-argument to create multiple instances
  for_each               = var.instances # using for_each to create instances based on the map variable
  ami                    = data.aws_ami.amazon_linux.id
  key_name               = aws_key_pair.my_key_pair.key_name
  instance_type          = each.value # using instance type from the map variable
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  user_data              = file("userdata.sh")
  tags = {
    Name = "${var.aws_instace_name}-${each.key}"
  }
}
