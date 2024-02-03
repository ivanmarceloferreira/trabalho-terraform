provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket_trab_terraform" {
  bucket = "trabalho-tf-ivan-03022004"
  acl = "private"

  versioning {
    enabled = true
  }
}