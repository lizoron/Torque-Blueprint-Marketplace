variable "subnets" {
}

variable "ec2_key" {
    description = "keypair name to use for the instance"
}

variable "default_sandbox_security_group" {
    description = "security group id attached to all sandbox applications"
}
variable "vpc" {
}

locals {
}

locals{
  application_port = 8080
  subnets = split(var.subnets,",")
  subnet0 = element(local.subnets,0)
}