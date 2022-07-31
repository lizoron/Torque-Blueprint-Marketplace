module "infra" {
    source = "../sandbox-infra"
}

module "application" {
    source = "../sandbox-application"
    subnets = module.infra.subnets
    ec2_key = module.infra.ec2_key
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc
}

module "guacamole" {
    source = "../sandbox-guacamole"
    subnets = module.infra.subnets
    ec2_key = module.infra.ec2_key
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc
}