resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.MainALBSG.id]
subnets = local.subnets
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.test.arn
  port              = local.application_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.instances.arn
  }
}

resource "aws_lb_target_group" "instances" {
  target_type = "instance"
  port        = local.application_port
  protocol    = "HTTP"
  vpc_id      = var.vpc

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 3
    interval            = 5
    protocol = "HTTP"
    port = local.application_port
    path = "/"
  }

}

output "alb" {
    value = aws_lb.test.dns_name
  
}