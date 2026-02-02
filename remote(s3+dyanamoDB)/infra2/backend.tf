terraform {
  backend "s3" {
    bucket         = "noman-terraform-state-12345"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
