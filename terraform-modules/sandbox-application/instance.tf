resource "aws_instance" "application" {
ami = var.ami
instance_type = var.instance_type
key_name = var.ec2_key
network_interface {
  network_interface_id = aws_network_interface.applicationNic.id
  device_index = 0
}
root_block_device{
  volume_size = 10
}
  tags = {Name = var.application_name}
	user_data = var.user_data
}