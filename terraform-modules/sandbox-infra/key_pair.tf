resource "aws_key_pair" "key" {
  key_name   = "torque_ec2_key"
  public_key = tls_private_key.key.public_key_openssh
}