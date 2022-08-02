output "endpoint" {
    value = module.application.load_balancer_url
}

output "private_ip" {
    value = module.application.private_ip
}