# Terrahome

```tf
module "terrahome_aws" {
  source      = "./modules/terrahome"
  user_uuid   = var.user_uuid
  public_path = var.aws_public_path
  content_version = var.content_version

}
```
```
module "terrahome_azure" {
  source          = "./modules/terrahome"
  user_uuid       = var.user_uuid
  public_path     = var.azure.public_path
  content_version = var.azure.content_version

}
```

```
module "terrahome_gcp" {
  source          = "./modules/terrahome"
  user_uuid       = var.user_uuid
  public_path     = var.gcp.public_path
  content_version = var.gcp.content_version

}
```

```
module "terrahome_oci" {
  source          = "./modules/terrahome"
  user_uuid       = var.user_uuid
  public_path     = var.oci.public_path
  content_version = var.oci.content_version

}
```

The public directory expects the following:

- index.html
- error.html
- assets

All top level files in assets will be copied, but not any subdirectories.
