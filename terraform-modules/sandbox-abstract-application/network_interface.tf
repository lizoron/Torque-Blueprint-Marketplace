resource "aws_network_interface" "applicationNic" {
  security_groups = [aws_security_group.applicationSG.id,var.default_sandbox_security_group]
  subnet_id = local.subnet0
  private_ips = [local.private_ipv4_address]
}