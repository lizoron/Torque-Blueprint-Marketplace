resource "aws_internet_gateway" "InternetGateway" {
  vpc_id = aws_vpc.VPC.id
  tags = {"Key": "Name","Value": "internet-gateway"}
  
}