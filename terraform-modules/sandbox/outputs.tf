output "endpoint" {
    value = module.java_spring.endpoint
}

output private_ip{
    value = module.java_spring.private_ip
}

output guacamole_ip {
    value = module.guacamole.endpoint
  
}