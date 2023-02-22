# Terroform Block
terraform {
    required_version = "~> v1.1.8"   
    required_providers {
        aws = {  
            source = "hashicorp/aws"
            version = "~> 4.9.0"
        }
    }
    # Store tfstate file in S3 bucket, uncomment below. 
    # S3 bucket needs to be created and IAM user needs to have access to write to S3 bucket as prerequisite
    /*
    backend "s3" {
      bucket = "terraform-resource-bucket-xxxx"   # Need to be created as a prerequisite
      key = "terraform-aws-vpc/terraform.tfstate"
      region = "ap-southeast-2"
      encrypt = true
    }
    */
}

# Provider Block
provider "aws" {
    profile = var.aws_credential_profile      # configured in ~/.aws/credentials
    region = var.aws_region
}





