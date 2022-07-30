resource "aws_elb" "MainALB" {
  internal = false
  security_groups = [aws_security_group.MainALBSG.id]
  subnets   = var.subnets
  instances = [aws_instance.application.id]

listener {
  instance_port = local.application_port
  instance_protocol = "HTTP"
  lb_protocol = "HTTP"
  lb_port = local.application_port
}

health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 3
    target              = "HTTP:${local.application_port}/"
    interval            = 5
  }

}