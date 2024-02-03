provider "aws" {
  region = "us-east-1"
}

terraform {
    backend "s3"{
        bucket = "trabalho-tf-ivan-03022004"
        key    = "terraform-state/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        dynamodb_table = "remotestate"
    }
    
}