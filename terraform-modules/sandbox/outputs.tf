output "application" {
    value = module.application.load_balancer_url
}

output "alb" {
    value = module.application.alb
  
}