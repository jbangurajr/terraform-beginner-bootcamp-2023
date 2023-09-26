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


data "aws_caller_identity" "current" {}