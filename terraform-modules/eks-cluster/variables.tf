variable "aws_region" {
  description = "Which AWS region do you want the EKS cluster be in? (e.g: eu-west-1)"
}

variable "cluster_name" {
}

variable "create_oidc" {
  description = "Create OIDC Provider? yes|no (eksctl required)"
  default = "yes"


}