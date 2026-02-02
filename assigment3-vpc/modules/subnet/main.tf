# subnet

resource "aws_subnet" "public_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidr
  tags = {
    Name = var.public_name
  }
  availability_zone = var.public_availability_zone
}
# resource "aws_subnet" "private_subnet" {
#   vpc_id     = var.vpc_id
#   cidr_block = var.private_subnet_cidr
#   tags = {
#     Name = var.private_name
#   }
#   availability_zone = var.private_availability_zone
# }
