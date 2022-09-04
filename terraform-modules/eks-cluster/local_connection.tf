resource "null_resource" "local_connection" {
  count = var.local_connection =="yes" ? 1 : 0
  provisioner "local-exec" {
    command = "aws --region ${var.aws_region} eks update-kubeconfig --name ${data.aws_eks_cluster.eks.name}"
  }
} 