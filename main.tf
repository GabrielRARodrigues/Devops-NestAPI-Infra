terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.1"
    }
  }

  backend "s3" {
    bucket = "devops-nestapi-terraform-state-bucket"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "tf-state-bucket" {
  bucket        = "devops-nestapi-terraform-state-bucket"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Iac = true
  }

}


resource "aws_s3_bucket_versioning" "tf-state-bucket" {
  bucket = aws_s3_bucket.tf-state-bucket.bucket

  versioning_configuration {
    status = "Enabled"
  }
}
