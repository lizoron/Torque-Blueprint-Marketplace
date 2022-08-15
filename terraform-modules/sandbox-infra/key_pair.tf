resource "aws_key_pair" "key" {
  key_name   = "torque_ec2_key"
  public_key = file("${path.module}/creds/torque_ec2_key.pub")
}