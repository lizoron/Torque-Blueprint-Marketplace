output "load_balancer_url" {
    value = "${aws_elb.GuacamoleALB.dns_name}:${local.guacamole_port}"
}