# # route_table
# resource "aws_route_table" "public_rt" {
#   vpc_id = var.vpc_id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
#   tags = {
#     Name = var.public_rt_name
#   }
# }
# resource "aws_route_table_association" "public_rt_association" {
#   subnet_id      = var.public_subnet_id
#   route_table_id = aws_route_table.public_rt.id
# }


resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.public_rt_name
  }
}
resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public_rt.id
}
