data "aws_availability_zones" "available" {
  state = "available"
}



resource "aws_subnet" "AppSubnet0" {
    availability_zone = data.aws_availability_zones.available.names[0]
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true
    vpc_id = aws_vpc.VPC.id
    tags = {"Key": "Name","Value": "app-subnet-0"}
}

resource "aws_subnet" "AppSubnet1" {
    availability_zone = data.aws_availability_zones.available.names[1]
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {"Key": "Name","Value": "app-subnet-1"}
    vpc_id = aws_vpc.VPC.id
}



