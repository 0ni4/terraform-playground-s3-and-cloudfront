variable "s3_domain_name" {
  type        = string
  description = "S3バケットのリージョナルドメイン名"
}

variable "origin_id" {
  type        = string
  description = "CloudFrontのオリジンを識別するID"
  default     = "my-s3-origin"
}
