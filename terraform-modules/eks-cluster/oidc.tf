resource "null_resource" "iam_oidc_provider" {
  provisioner "local-exec" {
    command = "eksctl utils associate-iam-oidc-provider --region=${var.aws_region} --cluster=${data.aws_eks_cluster.eks.name} --approve"
  }
}

data "external" "oidc" {
  program = ["aws eks describe-cluster --name ${data.aws_eks_cluster.eks.name} --query 'cluster.identity.oidc.issuer' --output text"]

}

output "oidc" {
    value = data.external.oidc.result
  
}