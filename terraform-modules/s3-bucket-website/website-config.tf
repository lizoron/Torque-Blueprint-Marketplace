resource "aws_s3_bucket_website_configuration" "default" {
    depends_on = [
        aws_s3_bucket_ownership_controls.owner_cont,
        aws_s3_bucket_public_access_block.acc_bl,
    ]
  bucket = aws_s3_bucket.files.id
  index_document {
    suffix = "index.html"
  }

  }