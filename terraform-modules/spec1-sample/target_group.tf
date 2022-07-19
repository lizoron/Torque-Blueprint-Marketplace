resource "aws_lb_target_group" "TG2fg86qzvop02c2H0aa79ec014" {
  name     = "TG2fg86qzvop02c2H0aa79ec014"
  port     = 8080
  protocol = "HTTP"
  tags = {"Key": "torque-sandbox-id","Value": "2fg86qzvop02c2"}
  deregistration_delay = 60
  target_type = "instance"
  #targets = []
  vpc_id = aws_vpc.VPC.id

}