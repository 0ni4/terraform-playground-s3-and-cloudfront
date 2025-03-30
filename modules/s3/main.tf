#################
# バケット本体
#################
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  # aclを指定しなければデフォルトがprivateです
}

#################
# ウェブサイトホスティング設定 (必要な場合)
#################
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.this.bucket

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

#################
# バケットポリシー (CloudFront OAIのCanonicalUserIDのみ許可)
#################
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.bucket
  policy = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "this" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.this.arn}/*"]

    # ★ OAIのCanonicalUserIDをPrincipalに指定
    principals {
      type        = "CanonicalUser"
      identifiers = [var.cloudfront_oai_canonical_user_id]
    }
  }
}
