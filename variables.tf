variable "user_uuid" {
  description = "value"
  type        = string
  sensitive = true
}

/*
variable "bucket_name" {
  description = "AWS S3 Bucket Name"
  type        = string
}
*/

variable "index_html_filepath" {
  type        = string
}

variable "error_html_filepath" {
  type        = string
}

variable "content_version" {
  type        = number
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}

variable "terratowns_endpoint" {
  description = "value"
  type = string
}

variable "token" {
  description = "value"
  type = string
  sensitive = true
  
}