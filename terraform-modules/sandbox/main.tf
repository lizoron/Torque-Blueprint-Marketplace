module "infra" {
    source = "../sandbox-infra"
}

module "java_spring" {
    source = "../java-spring"

    subnets = module.infra.subnets
    ec2_key = module.infra.ec2_key
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc
}

module "guacamole" {
    source = "../guacamole"

    subnets = module.infra.subnets
    ec2_key = module.infra.ec2_key
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc
}

output "guacamole_public_ip" {
    value = module.guacamole.public_ip
}

output "guacamole_load_balancer_url" {
    value = "http://${module.guacamole.load_balancer_url}"
    
  
}