output "java_spring" {
    value = module.java_spring.endpoint
}

output java_spring_private_ip{
    value = module.java_spring.private_ip
}

output "guacamole"{
        value = "http://${module.guacamole.endpoint}"
}

output "private_key" {
    value = module.infra.private_key
    sensitive = true
  
}
