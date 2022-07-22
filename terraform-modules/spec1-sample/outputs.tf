output "elb_name" {
    value = aws_elb.MainALB.name
  
}

output "elb_dns" {
    value = aws_elb.MainALB.dns_name
  
}