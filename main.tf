terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  
  cloud {
    organization = "terraform-cloud-bootcamp"

    workspaces {
      name = "the-multi-cloud-terrahome"
    }
  }
  
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.user_uuid
  token = var.token
}



module "terrahome_aws" {
  source      = "./modules/terrahome"
  user_uuid   = var.user_uuid
  public_path = var.aws.public_path
  content_version = var.aws.content_version

}

resource "terratowns_home" "aws" {
  name = "What makes AWS great"
  description = <<DESCRIPTION
  While all cloud providers offer a variety of services, 
  Amazon Web Services (AWS) excels in certain areas: 
  AWS is the market leader in cloud computing, 
  it has a mature ecosystem with a significant share of the market. 
  This gives AWS a number of advantages, such as economies of scale, 
  a large customer base, and a strong ecosystem of partners and third-party tools.
DESCRIPTION
  domain_name = module.terrahome_aws.domain_name
  town = "up-in-the-clouds"
  content_version = var.aws.content_version
}




module "terrahome_azure" {
  source      = "./modules/terrahome"
  user_uuid   = var.user_uuid
  public_path = var.azure.public_path
  content_version = var.azure.content_version

}

resource "terratowns_home" "azure" {
  name = "What makes Azure great"
  description = <<DESCRIPTION
  While all cloud providers offer a variety of services, 
  Microsoft Azure (Azure) excels in certain areas: 
  Azure integrates well with other Microsoft services like Office 365 and Active Directory, 
  making it great for businesses deeply invested in Microsoft technologies.
  It's strong for hybrid cloud scenarios and Azure's services and support are designed with enterprises in mind.
  Many Fortune 500 companies have adopted Azure for various cloud computing needs.
DESCRIPTION
  domain_name = module.terrahome_azure.domain_name
  town = "up-in-the-clouds"
  content_version = var.azure.content_version
}



module "terrahome_gcp" {
  source      = "./modules/terrahome"
  user_uuid   = var.user_uuid
  public_path = var.gcp.public_path
  content_version = var.gcp.content_version

}

resource "terratowns_home" "gcp" {
  name = "What makes GCP great"
  description = <<DESCRIPTION
  While all cloud providers offer a variety of services, 
  Google Cloud Platform (GCP) excels in certain areas:
  GCP is strong in big data, analytics, and machine learning services (like BigQuery and TensorFlow). 
  Google was an early pioneer of containerization and offers Google Kubernetes Engine (GKE) for managed Kubernetes clusters.
  Making it well-suited for organizations requiring containerization services.
DESCRIPTION
  domain_name = module.terrahome_gcp.domain_name
  town = "up-in-the-clouds"
  content_version = var.gcp.content_version
}




module "terrahome_oci" {
  source      = "./modules/terrahome"
  user_uuid   = var.user_uuid
  public_path = var.oci.public_path
  content_version = var.oci.content_version

}

resource "terratowns_home" "oci" {
  name = "What makes OCI great"
  description = <<DESCRIPTION
  While all cloud providers offer a variety of services, 
  Oracle Cloud Infrastructure (OCI) excels in certain areas: 
  OCI offers strong support for enterprise workloads and has a focus on high-performance computing and databases.
  Oracle Corporation is the owner and maintainer of MySQL, 
  one of the world's most popular open-source relational database management systems (RDBMS). 
  Oracle also offers Autonomous Database services which offer self-driving, self-securing, and self-repairing capabilities. 
DESCRIPTION
  domain_name = module.terrahome_oci.domain_name
  town = "up-in-the-clouds"
  content_version = var.oci.content_version
}
