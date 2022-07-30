output "load_balancer_url" {
    value = "${aws_elb.MainALB.dns_name}:${local.application_port}"
}

output "test" {
    value = var.subnets
  
}