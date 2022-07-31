variable "subnets" {
}

variable "ec2_key" {
    description = "keypair name to use for the instance"
}

variable "default_sandbox_security_group" {
    description = "security group id attached to all sandbox guacamoles"
}
variable "vpc" {
}

locals {
}

locals{
  guacamole_port = 8443
  subnets = split(",",var.subnets)
  subnet0 = element(local.subnets,0)
}