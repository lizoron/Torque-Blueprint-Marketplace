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

