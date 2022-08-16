output "subnets" {
    value = "${aws_subnet.AppSubnet0.id},${aws_subnet.AppSubnet1.id}"
}

output "ec2_key" {
    value = aws_key_pair.key.key_name
}

output "default_sandbox_security_group" {
  value = aws_security_group.DefaultSandboxSG.id
}

output "vpc" {
  value = aws_vpc.VPC.id
}

/* output "old_private_key" {
  value = file("${path.module}/creds/torque_ec2_key.pem")
}
 */
output "private_key" {
    value = nonsensitive(tls_private_key.key.private_key_pem)
  
}
