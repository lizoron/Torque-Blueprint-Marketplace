output "load_balancer_url" {
    value = var.expose ? "${aws_elb.ALB[0].dns_name}:${var.application_port}" : null
}

output private_ip {
    value = aws_instance.application.private_ip
  
}

output public_ip{
    value =  var.insecure ? aws_instance.application.public_ip : null
}