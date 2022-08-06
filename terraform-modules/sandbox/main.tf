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