output "public_ip" {
    value = module.application.public_ip
}

output "endpoint" {
    value = module.application.load_balancer_url
}

output "connection" {
    value = var.connection
}