resource "aws_vpc" "VPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {"Key": "Name","Value": "vpc"}
}