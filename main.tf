#################
# AWS プロバイダ設定
#################
provider "aws" {
  region = "ap-northeast-1"  # 好みのリージョンに置き換えてください
}

#################
# S3モジュール呼び出し
#################
module "s3_website" {
  source = "./modules/s3"

  # バケット名 (ユニーク必要)
  bucket_name = var.s3_bucket_name

  # ウェブサイトの index / error ドキュメント名
  index_document = var.s3_index_document
  error_document = var.s3_error_document

  # CloudFrontのOAIのCanonicalUserIDをバケットポリシーで許可するために渡す
  cloudfront_oai_canonical_user_id = module.cloudfront.oai_canonical_user_id
}

#################
# CloudFrontモジュール呼び出し
#################
module "cloudfront" {
  source = "./modules/cloudfront"

  # S3 バケットのリージョナルドメイン名 (CloudFrontのオリジンに指定)
  s3_domain_name = module.s3_website.bucket_regional_domain_name

  # 任意のオリジンID (重複しない文字列に)
  origin_id = "my-s3-origin"
}
