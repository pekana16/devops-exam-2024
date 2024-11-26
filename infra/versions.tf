terraform {
  // ensuring the version is higher than 1.9, as stated in the question
  required_version = ">= 1.9.0"

  // as stated in the question - specifying the AWS provider source and version
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.74.0"
    }
  }

  // s3 bucket
  backend "s3" {
    bucket = "pgr301-2024-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }

}