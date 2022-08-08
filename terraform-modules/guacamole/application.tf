module "application" {
    source = "github.com/QualiTorque/TFSamples//terraform-modules/sandbox-application"
    application_name = "guacamole"
    ami = "ami-0141514361b6a3c1b" // Ubuntu 20.0
    instance_type = "t3.medium"
    user_data = templatefile("${path.module}/startup_script.sh",{
        connection = var.connection
    })
    application_port = 8080
    application_path = "guacamole/"
    expose = true
    subnets = var.subnets
    ec2_key = var.ec2_key
    default_sandbox_security_group = var.default_sandbox_security_group
    vpc = var.vpc
    insecure = var.insecure
}