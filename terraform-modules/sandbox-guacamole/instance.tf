resource "aws_instance" "guacamole" {
ami = "ami-f90a4880"
instance_type = "t2.medium"
key_name = var.ec2_key
network_interface {
  network_interface_id = aws_network_interface.guacamoleNic.id
  device_index = 0
}

  tags = {"Key": "Name","Value": "torque-guacamole"}
	user_data = tostring(file("${path.module}/startup_script.sh"))
}