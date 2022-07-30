resource "aws_security_group" "applicationSG" {
    name = "torque-application"
    description = "java-spring-website Security Group"
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = var.application_port
        protocol = "tcp"
        security_groups =[var.load_balancer_security_group,var.default_sandbox_security_group]
        to_port = var.application_port
        description = "open application port"
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        self = false
    }
    vpc_id = var.vpc
}
