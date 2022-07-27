resource "aws_elb" "MainALB" {
  internal = false
  security_groups = [aws_security_group.MainALBSG.id]
  subnets   = [aws_subnet.AppSubnet0.id,aws_subnet.AppSubnet1.id]
  instances = [aws_instance.javaspringwebsite.id]

listener {
  instance_port = 8080
  instance_protocol = "HTTP"
  lb_protocol = "HTTP"
  lb_port = 8080
}

health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 5
  }

}