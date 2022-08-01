output "load_balancer_url" {
    value = var.expose ? "${aws_elb.MainALB[0].dns_name}:${var.application_port}" : null
}