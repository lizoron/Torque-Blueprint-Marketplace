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
    private_key = module.infra.private_key
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc
    connection = module.java_spring.private_ip
}