terraform {
  /*
  cloud {
    organization = "terraform-cloud-bootcamp"

    workspaces {
      name = "terrahouse-move-in"
    }
  }
  */

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}


resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }

}