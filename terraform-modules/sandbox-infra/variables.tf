resource "random_id" "id" {
  byte_length = 2
}

locals {
 private_key_name = "torque_ec2_key-${random_id.id.dec}"
 private_key_file = "${path.module}/creds/${local.private_key_name}.pem"
}