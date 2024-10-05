# providers.tf

# Specify the required Terraform version
terraform {
  required_version = ">= 1.0.0"
  
  # Define required providers
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"      
    }
  }
}

# Configure the AWS provider
provider "aws" {

    shared_credentials_files = ["~/.aws/credentials"]
    profile  = "default" 
    region = "us-east-1"
}

