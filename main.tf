terraform {
  cloud {
    organization = "terraform-cloud-bootcamp"

    workspaces {
      name = "terrahouse-move-in"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {

}

provider "aws" {

}

resource "random_string" "bucket_name" {
  lower   = true
  upper   = false
  length  = 32
  special = false
}


resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}


output "random_bucket_name_result" {

  value = random_string.bucket_name.result

}
