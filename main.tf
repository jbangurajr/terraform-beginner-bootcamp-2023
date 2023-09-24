terraform {
  /*
  cloud {
    organization = "terraform-cloud-bootcamp"

    workspaces {
      name = "terrahouse-move-in"
    }
  }
  */
}

module "terrahouse_aws" {

  source      = "./modules/terrahouse_aws"
  user_uuid   = var.user_uuid
  bucket_name = var.bucket_name

}