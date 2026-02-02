resource "aws_s3_bucket" "MyBucket" {
  bucket = "noman-terraform-state-12345"
  tags = {
    Name = "terraform-aws-Bucket"
  }
}
resource "aws_dynamodb_table" "mydynamodb" {
  name         = "terraform-aws-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name   = "LockID"
    type = "S"
  }
}
