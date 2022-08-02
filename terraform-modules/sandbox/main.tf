module "infra" {
    source = "../sandbox-infra"
}

module "vm" {
    source = "../sandbox-application"
    application_name = "VM"
    ami = "ami-f90a4880"
    instance_type = "t2.nano"

    subnets = module.infra.subnets
    ec2_key = module.infra.ec2_key
    default_sandbox_security_group = module.infra.default_sandbox_security_group
    vpc = module.infra.vpc

}

module "guacamole" {
    source = "../guacamole"
    application_name = "guacamole"

    ami = "ami-f90a4880"
    instance_type = "t3.medium"
}