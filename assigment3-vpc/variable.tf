# Variables for VPC
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}
variable "my_vpc_name" {
  default = "my-vpc"
}
# Variables for Subnets
variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}
variable "public_name" {
  default = "publicSubnet"
}
variable "public_availability_zone" {
  default = "us-east-1a"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}
variable "private_name" {
  default = "privateSubnet"
}
variable "private_availability_zone" {
  default = "us-east-1b"
}
# Variables for Internet Gateway
variable "igw_name" {
  default = "my-internet-gateway"
}
# Variables for Route Table
variable "route_table_name" {
  default = "my-route-table"
}


# Variables for Security Group
variable "my_sg_name" {
  default = "my-security-group"
}
variable "my_sg_description" {
  default = "Allow HTTP and SSH inbound"
}