terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket_public_access_block" "acc_bl" {
  bucket = aws_s3_bucket.files.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "owner_cont" {
  bucket = aws_s3_bucket.files.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
