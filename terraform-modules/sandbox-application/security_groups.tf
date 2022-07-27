resource "aws_security_group" "javaspringwebsiteSG" {
    name = "javaspringwebsite"
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
        from_port = 8080
        protocol = "tcp"
        security_groups = [aws_security_group.MainALBSG.id,aws_security_group.DefaultSandboxSG.id]
        to_port = 8080
        description = "from LB"
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        self = false
    }
    vpc_id = aws_vpc.VPC.id
}
