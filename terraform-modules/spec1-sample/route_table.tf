resource "aws_route_table" "PublicRouteTable" {

  tags = {"Key": "Name","Value": "public-route-table"}
  vpc_id = aws_vpc.VPC.id
  # RouteToInternet
  route {
    # DestinationCidrBlock
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.InternetGateway.id
  }

}