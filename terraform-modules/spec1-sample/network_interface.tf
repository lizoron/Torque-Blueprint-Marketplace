resource "aws_network_interface" "javaspringwebsiteNic" {
  subnet_id = aws_subnet.AppSubnet0.id

  attachment {
    instance     = aws_instance.javaspringwebsite.id
    device_index = 0
  }
}