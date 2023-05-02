locals{
    index_path = "./index.html"
  }

resource "aws_s3_object" "index" {
  depends_on = [
        aws_s3_bucket_ownership_controls.owner_cont,
        aws_s3_bucket_public_access_block.acc_bl,
  ]
  bucket = aws_s3_bucket.files.id
  key    = "index.html"
  source = local.index_path
  etag = filemd5(local.index_path)
  content_type = "text/html"
  acl = "public-read"
}

resource "aws_s3_bucket_public_access_block" "acc_bl" {
  bucket = aws_s3_bucket.files.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "owner_cont" {
  bucket = aws_s3_bucket.files.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}