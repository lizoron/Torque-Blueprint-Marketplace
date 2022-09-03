variable "aws_region" {
    default = "eu-west-1"
}

variable "cluster_name" {
}

variable "create_oidc" {
  description = "Create OIDC Provider? yes|no (eksctl required)"


}