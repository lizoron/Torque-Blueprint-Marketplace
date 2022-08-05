output "public_ip" {
    value = module.application.public_ip
}

output "load_balancer_url" {

    value = module.application.load_balancer_url
  
}