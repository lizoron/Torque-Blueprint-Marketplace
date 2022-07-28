resource "aws_security_group" "MainALBSG" {
    name = "main-lb"
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
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
    }
    tags = {"Key": "Name","Value": "MainALBSG"}
vpc_id = aws_vpc.VPC.id
}

resource aws_security_group "DefaultSandboxSG" {
    name = "DefaultSandboxSG"
    description = "Simply attaching the empty security group(DefaultSandboxSG) to an instance gives that instance permission to connect other instances"
    tags = {"Key": "Name","Value": "sandbox default security group"}
    vpc_id = aws_vpc.VPC.id  
}