variable "ec2_key" {
    description = "keypair name to use for the instance"
  
}

variable "default_sandbox_security_group" {
    description = "security group id attached to all sandbox applications"
}

variable "load_balancer_security_group" {
  description = "security group id attached to the sandbox load balancer"
}

variable "subnet" {
  
}

variable "application_port" {
  
}

variable "vpc" {
  
}