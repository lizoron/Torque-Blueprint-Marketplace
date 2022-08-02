resource "aws_instance" "application" {
ami = var.ami
instance_type = var.instance_type
key_name = var.ec2_key
network_interface {
  network_interface_id = aws_network_interface.applicationNic.id
  device_index = 0
}

  tags = {Name = var.application_name}
	user_data = var.user_data
}