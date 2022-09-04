locals {
  install_eksctl_cmd = "curl --silent --location 'https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz' | tar xz -C /tmp; sudo mv /tmp/eksctl /usr/local/bin"
  create_oidc_cmd = "eksctl utils associate-iam-oidc-provider --region=${var.aws_region} --cluster=${data.aws_eks_cluster.eks.name} --approve;"
  cmd = var.install_eksctl == "yes" ? join(";",[local.install_eksctl_cmd,local.create_oidc_cmd]): local.create_oidc_cmd
} 
 
 resource "null_resource" "iam_oidc_provider" {
  provisioner "local-exec" {
    command = local.cmd
  }
} 

data "external" "get_oidc_script" {
  program = ["python", "${path.module}/scripts/get_oidc.py",data.aws_eks_cluster.eks.name]

  
}