variable "bucket_name" {
  type        = string
  description = "S3バケット名 (一意である必要あり)"
}

variable "index_document" {
  type        = string
  description = "インデックスドキュメント"
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "エラードキュメント"
  default     = "error.html"
}

variable "cloudfront_oai_canonical_user_id" {
  type        = string
  description = "CloudFront OAI (Origin Access Identity) の CanonicalUserID"
}
