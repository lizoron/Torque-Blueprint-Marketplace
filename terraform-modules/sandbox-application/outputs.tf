output "load_balancer_url" {
    value = var.expose ? "${aws_elb.ALB[0].dns_name}:${var.application_port}" : null
}