

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
resource "aws_instance" "my_first_instance" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.aws_instace_type
  key_name      = aws_key_pair.my_key_pair.key_name
  tags = {
    Name = var.aws_instace_name
  }
}
