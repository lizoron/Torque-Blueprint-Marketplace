output "subnets" {
    type = list(string)
    value = [aws_subnet.AppSubnet0.id,aws_subnet.AppSubnet1.id]
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

