# vpc
module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  my_vpc_name    = var.my_vpc_name
}

#subnets
module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id

  public_subnet_cidr        = var.public_subnet_cidr
  public_name               = var.public_name
  public_availability_zone  = var.public_availability_zone
  private_subnet_cidr       = var.private_subnet_cidr
  private_name              = var.private_name
  private_availability_zone = var.private_availability_zone
}
# internet gateway
module "igw" {
  source   = "./modules/igw"
  vpc_id   = module.vpc.vpc_id
  igw_name = var.igw_name
}
module "route_table" {
  source           = "./modules/route-table"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.subnet.public_subnet_id
  igw_id           = module.igw.igw_id # <- output se
  public_rt_name   = "public-rt"
}
module "myEc2" {
  source            = "./modules/Ec2"
  aws_instance_type = "t3.micro"
  aws_key_pair      = "git"
  aws_instance_name = "terraform-ec2"
  subnet_id         = module.subnet.public_subnet_id
  security_group    = module.security_groups.my_sg_id
}

module "security_groups" {
  source = "./modules/sg"
  my_vpc = module.vpc.vpc_id        # aapke VPC module ka output
  sg_name = var.my_sg_name
  sg_discription = var.my_sg_description
}
