resource "aws_route_table_association" "AppSubnet0RouteAssociation" {
  route_table_id = aws_route_table.PublicRouteTable.id
  subnet_id = aws_subnet.AppSubnet0.id
}

resource "aws_route_table_association" "AppSubnet1RouteAssociation" {
  route_table_id = aws_route_table.PublicRouteTable.id
  subnet_id = aws_subnet.AppSubnet1.id
}

/*resource "aws_route_table_association" "MngSubnetRouteAssociation" {
  route_table_id = aws_route_table.PublicRouteTable.id
  subnet_id = aws_subnet.MngSubnet.id
}*/