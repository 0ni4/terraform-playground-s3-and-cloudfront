output "bucket" {
  description = "作成されたS3バケット名"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_regional_domain_name" {
  description = "S3バケットのリージョナルドメイン名"
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}
