
resource "aws_elb" "MainALB" {
  count = var.expose ? 1 : 0

  internal = false
  security_groups = [aws_security_group.MainALBSG.id]
  subnets   = local.subnets
  instances = [aws_instance.application.id]

listener {
  instance_port = var.application_port
  instance_protocol = "HTTP"
  lb_protocol = "HTTP"
  lb_port = var.application_port
}

health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 3
    target              = "HTTP:${var.application_port}/"
    interval            = 5
  }

}