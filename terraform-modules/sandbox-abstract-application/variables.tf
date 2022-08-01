variable "application_port"{
}

variable "ami" {
}
variable "instance_type" {
}

variable "user_data" {
  type = string
  default = ""
}

variable "application_name" {  
}

variable "expose" {
  default = false
}

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

locals{
  private_ipv4_address = "10.0.0.230"
  subnets = split(",",var.subnets)
  subnet0 = element(local.subnets,0)
  subnet1 = element(local.subnets,1)
}