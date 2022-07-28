output "load_balancer_url" {
    value = "${aws_elb.MainALB.dns_name}:${var.application_port}"
  
}

output "subnets" {
    value = [aws_subnet.AppSubnet0.id,aws_subnet.AppSubnet1.id]
}

output "ec2_key" {
    value = aws_key_pair.key.key_name
}

output "load_balancer_security_group" {
  value = aws_security_group.MainALBSG.id
}

output "default_sandbox_security_group" {
  value = aws_security_group.DefaultSandboxSG.id
}

output "vpc" {
  value = aws_vpc.VPC.id
}

