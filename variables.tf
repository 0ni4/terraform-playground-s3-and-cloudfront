##########
# トップレベル変数
##########

variable "s3_bucket_name" {
  type        = string
  description = "S3バケット名 (グローバルにユニークな名前が必要)"
}

variable "s3_index_document" {
  type        = string
  default     = "index.html"
  description = "S3バケットのウェブサイトホスティング用インデックスファイル"
}

variable "s3_error_document" {
  type        = string
  default     = "error.html"
  description = "S3バケットのウェブサイトホスティング用エラーページ"
}