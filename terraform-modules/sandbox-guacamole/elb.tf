
resource "aws_elb" "GuacamoleALB" {
  internal = false
  security_groups = [aws_security_group.GuacamoleALBSG.id]
  subnets   = local.subnets
  instances = [aws_instance.guacamole.id]

listener {
  instance_port = local.guacamole_port
  instance_protocol = "HTTP"
  lb_protocol = "HTTP"
  lb_port = local.guacamole_port
}

health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 3
    target              = "HTTP:${local.guacamole_port}/"
    interval            = 5
  }

}