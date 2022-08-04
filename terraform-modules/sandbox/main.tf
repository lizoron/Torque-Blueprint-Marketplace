module "infra" {
    source = "../sandbox-infra"
}

module "java_spring" {
    source = "../java-spring"

    subnets = module.infra.subnets
    ec2_key = module.infra.ec2_key
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc
    insecure = true
    expose = true
    application_port=8080
}

/*module "guacamole" {
    source = "../guacamole"

    subnets = module.infra.subnets
    ec2_key = module.infra.ec2_key
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc

}*/