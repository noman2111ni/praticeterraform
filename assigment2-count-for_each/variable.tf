variable "aws_instace_name" {
  default = "MyFirstInstance"
}
variable "instances" {
  type = map(string)
  default = {
    "dev"  = "t3.micro"
    "test" = "t3.micro"
    "prod" = "t3.small"
  }
}