variable "ec2_key" {
    description = "keypair name to use for the instance"
}

variable "default_sandbox_security_group" {
    description = "security group id attached to all sandbox applications"
}

variable "subnets" {
}

locals {
  application_port = 8080
}

variable "vpc" {
}