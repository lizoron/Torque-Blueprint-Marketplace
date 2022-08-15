resource "aws_key_pair" "key" {
  key_name   = local.private_key_name
  public_key = tls_private_key.key.public_key_openssh
}