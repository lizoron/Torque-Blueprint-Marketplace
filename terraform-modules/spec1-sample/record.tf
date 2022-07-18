resource "aws_route53_record" "DNSRecordjavaspringwebsite" {
  zone_id = aws_route53_zone.DNS.id
  name    = "java-spring-website.2fg86qzvop02c2.sandbox.com"
  type    = "A"
  ttl     = 20
}