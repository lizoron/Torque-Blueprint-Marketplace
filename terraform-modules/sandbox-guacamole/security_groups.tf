resource "aws_security_group" "GuacamoleALBSG" {
    name = "guacamole-lb"
    description = "Attaching an empty security group to the ALB to give instances an access"
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        description = "public port access"
        from_port = 22
        protocol = "tcp"
        to_port = 22
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
    }

tags = {"Key": "Name","Value": "GuacamoleALBSG"}
vpc_id = var.vpc
}




resource "aws_security_group" "guacamoleSG" {
    name = "torque-guacamole"
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
        from_port = local.guacamole_port
        protocol = "tcp"
        security_groups =[aws_security_group.GuacamoleALBSG.id,var.default_sandbox_security_group]
        to_port = local.guacamole_port
        description = "open guacamole port"
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        self = false
    }
    vpc_id = var.vpc
}