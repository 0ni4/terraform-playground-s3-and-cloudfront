#################
# CloudFront Origin Access Identity
#################
resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "OAI for accessing S3 private bucket"
}

#################
# CloudFront Distribution
#################
resource "aws_cloudfront_distribution" "this" {
  enabled         = true
  is_ipv6_enabled = true

  default_root_object = "index.html"

  origin {
    domain_name = var.s3_domain_name
    origin_id   = var.origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    target_origin_id       = var.origin_id
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # (独自ドメイン不要の場合) デフォルト証明書を利用
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # 独自ドメインを使わないので aliases = []
  aliases = []
}
