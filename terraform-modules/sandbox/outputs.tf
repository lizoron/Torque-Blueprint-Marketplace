output "endpoint" {
    value = module.java_spring.endpoint
}

output vm_private_ip{
    value = module.java_spring.private_ip
}

output "vm_public_ip" {
    value = module.java_spring.public_ip
  
}