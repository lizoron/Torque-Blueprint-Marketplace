resource aws_security_group "DefaultSandboxSG" {
    name = "DefaultSandboxSG"
    description = "Simply attaching the empty security group(DefaultSandboxSG) to an instance gives that instance permission to connect other instances"
    tags = {"Key": "Name","Value": "sandbox default security group"}
    vpc_id = aws_vpc.VPC.id  
}

