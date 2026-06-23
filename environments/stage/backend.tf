terraform {
  backend "s3" {
    bucket         = "gaurav-terraform-state-prod"
    key            = "stage/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}