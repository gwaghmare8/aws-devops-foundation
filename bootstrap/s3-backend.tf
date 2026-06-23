provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "gaurav-terraform-state-prod"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id

  # lifecycle {
  #   prevent_destroy = true
  # }
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

