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
  application_port = 8080
}