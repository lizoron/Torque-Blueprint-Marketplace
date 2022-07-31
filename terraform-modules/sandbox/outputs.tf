output "application" {
    value = module.application.load_balancer_url
}

output "guacamole" {
    value = module.guacamole.load_balancer_url
}