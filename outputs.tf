output "aws_bucket_name" {
  description = "Bucket name for our static website hosting"
  value = module.terrahome_aws.bucket_name

}

output "aws_s3_website_endpoint" {
  description = "S3 Static website hosting endpoint"
  value = module.terrahome_aws.website_endpoint
}

output "aws_cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  value = module.terrahome_aws.domain_name
}




output "azure_bucket_name" {
  description = "Bucket name for our static website hosting"
  value = module.terrahome_azure.bucket_name

}

output "azure_s3_website_endpoint" {
  description = "S3 Static website hosting endpoint"
  value = module.terrahome_azure.website_endpoint
}

output "azure_cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  value = module.terrahome_azure.domain_name
}





output "gcp_bucket_name" {
  description = "Bucket name for our static website hosting"
  value = module.terrahome_gcp.bucket_name

}

output "gcp_s3_website_endpoint" {
  description = "S3 Static website hosting endpoint"
  value = module.terrahome_gcp.website_endpoint
}

output "gcp_cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  value = module.terrahome_gcp.domain_name
}





output "oci_bucket_name" {
  description = "Bucket name for our static website hosting"
  value = module.terrahome_oci.bucket_name

}

output "oci_s3_website_endpoint" {
  description = "S3 Static website hosting endpoint"
  value = module.terrahome_oci.website_endpoint
}

output "oci_cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  value = module.terrahome_oci.domain_name
}