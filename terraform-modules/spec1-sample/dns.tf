resource "aws_route53_zone" "DNS" {
  name = "2fg86qzvop02c2.sandbox.com"

  vpc {
    vpc_id = aws_vpc.VPC.id
    vpc_region = var.aws_region
  }
}