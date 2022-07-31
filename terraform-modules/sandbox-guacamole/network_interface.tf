resource "aws_network_interface" "guacamoleNic" {
  security_groups = [aws_security_group.guacamoleSG.id,var.default_sandbox_security_group]
  subnet_id = local.subnet0
}