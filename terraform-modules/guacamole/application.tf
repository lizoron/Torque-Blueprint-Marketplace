module "application" {
    source = "../sandbox-application"
    application_name = "guacamole"
    ami = "ami-0141514361b6a3c1b"
    instance_type = "t3.medium"
    user_data = file("${path.module}/startup_script.sh")
    
    subnets = var.subnets
    ec2_key = var.ec2_key
    default_sandbox_security_group = var.default_sandbox_security_group
    vpc = var.vpc
    insecure = var.insecure
}