module "infra" {
    source = "../sandbox-infra"
}

module "vm" {
    source = "../sandbox-application"
    application_name = "VM"
    application_port = 22
    ami = "ami-f90a4880"
    instance_type = "t2.nano"
    expose = true

    subnets = module.infra.subnets
    ec2_key = module.infra.ec2_key
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc

}