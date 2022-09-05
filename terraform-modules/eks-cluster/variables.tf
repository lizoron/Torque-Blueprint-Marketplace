variable "aws_region" {
  description = "Which AWS region do you want the EKS cluster be in? (e.g: eu-west-1)"
}

variable "cluster_name" {
  description = "Select a name for your new cluster"
}

variable "install_eksctl" {
  description = "Install eksctl? (linux)"
  default = "no"
}

variable "local_connection" {
  description = "Do you want to connect to the newly created cluster? yes | no"
}