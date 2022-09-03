 resource "null_resource" "iam_oidc_provider" {
  count = var.create_oidc =="yes" ? 1 : 0
  provisioner "local-exec" {
    command = "eksctl utils associate-iam-oidc-provider --region=${var.aws_region} --cluster=${data.aws_eks_cluster.eks.name} --approve"
  }
} 

data "external" "get_oidc_script" {
  program = ["python", "${path.module}/scripts/get_oidc.py",data.aws_eks_cluster.eks.name]

  
}