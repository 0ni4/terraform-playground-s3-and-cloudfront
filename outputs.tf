output "cloudfront_distribution_id" {
  description = "CloudFrontのDistribution ID"
  value       = module.cloudfront.distribution_id
}

output "cloudfront_domain_name" {
  description = "CloudFrontのドメイン (例: dXXXXXXXX.cloudfront.net)"
  value       = module.cloudfront.domain_name
}

output "s3_bucket_name" {
  description = "作成したS3バケット名"
  value       = module.s3_website.bucket
}