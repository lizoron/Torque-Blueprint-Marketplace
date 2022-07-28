module "infra" {
    source = "../sandbox-infra"
    application_port = var.application_port
    instance_id = module.application.instance_id
}

module "application" {
    source = "../sandbox-application"
    subnet = module.infra.subnets[0]
    ec2_key = module.infra.ec2_key
    application_port = var.application_port
    load_balancer_security_group = module.infra.load_balancer_security_group
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc
}