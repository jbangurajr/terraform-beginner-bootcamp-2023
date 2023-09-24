
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