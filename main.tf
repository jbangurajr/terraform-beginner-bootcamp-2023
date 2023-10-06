terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  /*
  cloud {
    organization = "terraform-cloud-bootcamp"

    workspaces {
      name = "terrahouse-move-in"
    }
  }
  */
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.user_uuid
  token = var.token
}


module "terrahouse_aws" {
  source      = "./modules/terrahouse_aws"
  user_uuid   = var.user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  assets_path = var.assets_path
  content_version = var.content_version

}


/*
resource "terratowns_home" "home" {
  name = "AWS"
  description = <<DESCRIPTION
  "While all cloud providers offer a variety of services, 
  Amazon Web Services (AWS) excels in certain areas: AWS is the market leader in cloud computing, 
  it has a mature ecosystem with a significant share of the market. 
  This gives AWS a number of advantages, such as economies of scale, 
  a large customer base, and a strong ecosystem of partners and third-party tools."
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "1a2b3c.multicloud.net"
  town = "up-in-the-clouds"
  content_version = 1
}
*/

resource "terratowns_home" "home" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}
