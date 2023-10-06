variable "terratowns_endpoint" {
  description = "value"
  type = string
}

variable "user_uuid" {
  description = "value"
  type        = string
  sensitive = true
}

variable "token" {
  description = "value"
  type = string
  sensitive = true
  
}

/*
variable "bucket_name" {
  description = "AWS S3 Bucket Name"
  type        = string
}
*/

variable "aws" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "azure" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "gcp" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "oci" {
  type = object({
    public_path = string
    content_version = number
  })
}