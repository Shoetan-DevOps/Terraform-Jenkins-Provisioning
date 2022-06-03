terraform {
    required_version = "~> 2.0"
    required_providers {
        aws = {
            versionversion = "~> 3.0"
            source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    region = var.my-aws-region
    # profile = default
}