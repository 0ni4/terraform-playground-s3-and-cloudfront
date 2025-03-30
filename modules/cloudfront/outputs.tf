# Distribution ID
output "distribution_id" {
  description = "CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.this.id
}

# CloudFront ドメイン (例: dXXXX.cloudfront.net)
output "domain_name" {
  description = "CloudFrontドメイン名"
  value       = aws_cloudfront_distribution.this.domain_name
}

# OAIの CanonicalUserID (S3バケットポリシーに必要)
output "oai_canonical_user_id" {
  description = "CloudFront Origin Access Identity の CanonicalUserID"
  value       = aws_cloudfront_origin_access_identity.this.s3_canonical_user_id
}
