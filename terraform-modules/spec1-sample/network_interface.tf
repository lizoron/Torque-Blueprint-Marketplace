resource "aws_network_interface" "javaspringwebsiteNic" {
  security_groups = [aws_security_group.javaspringwebsiteSG.id]
  subnet_id = aws_subnet.AppSubnet0.id

}