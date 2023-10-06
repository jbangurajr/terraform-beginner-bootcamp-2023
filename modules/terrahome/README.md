# Terrahome

```tf
module "terrahome_aws" {
  source      = "./modules/terrahome"
  user_uuid   = var.user_uuid
  public_path = var.aws_public_path
  content_version = var.content_version

}
```

The public directory expects the following:

- index.html
- error.html
- assets

All top level files in assets will be copied, but not any subdirectories.
