resource "aws_security_group" "ALBSG" {
    name = "${var.application_name}-lb"
    description = "Attaching a security group to the ALB to give instances a public access"
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
        from_port = var.application_port
        protocol = "tcp"
        to_port = var.application_port
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
    }

tags = {"Key": "Name","Value": "ALBSG"}
vpc_id = var.vpc
}




resource "aws_security_group" "applicationSG" {
    name = "${var.application_name}-sg"
    description = "${var.application_name} Security Group"
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    ingress {
        cidr_blocks = var.insecure ? ["0.0.0.0/0"] : []
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        security_groups =[var.default_sandbox_security_group]
        description = "open all within the sandbox"
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        self = false
    }
    vpc_id = var.vpc
}