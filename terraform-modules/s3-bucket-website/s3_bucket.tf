resource "aws_s3_bucket" "files" {
    depends_on = [
        aws_s3_bucket_ownership_controls.owner_cont
        #aws_s3_bucket_public_access_block.acc_bl,
    ]
}