terraform {
  backend "s3" {
    bucket  = "gaurav-terraform-state-prod"
    key     = "phase-2/terraform.tfstate"
    region  = "eu-west-3"
    encrypt = true
  }
}