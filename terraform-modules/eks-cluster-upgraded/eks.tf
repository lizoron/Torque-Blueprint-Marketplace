# https://github.com/terraform-aws-modules/terraform-aws-eks/tree/v17.24.0

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.29.0"

  cluster_version = "1.23"
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  subnet_ids        = module.vpc.private_subnets

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_enabled_log_types = ["api", "audit"]
  
  manage_aws_auth_configmap = true

   eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.medium"]
  }

  eks_managed_node_groups = {
    ng-01 = {
      min_size     =2
      max_size     = 5
      desired_size = 3
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }

  aws_auth_users  = [{
      userarn  = local.current_user_arn
      username = local.current_user_name
      groups   = ["system:masters"]
  }]
  # Change the roleArn and username (which is actually the role name in IAM) to match required AWS account.
  # Should be the group IT assigns to the developers in order to keep it strictly IT prerogative.
  aws_auth_roles = [
    # {
    #   rolearn  = "arn:aws:iam::123456789:role/role"
    #   username = "PowerUsers"
    #   groups   = ["system:masters"]
    # },
  ]
}

resource "aws_eks_addon" "aws-ebs-csi-driver" {
  cluster_name = var.cluster_name
  addon_name   = "aws-ebs-csi-driver"
  depends_on = [
    module.eks
  ]
}

resource "aws_iam_policy_attachment" "ebs-csi-policyattachment" {
  name       = "ebs-csi-policyattachment"
  roles = [module.eks.eks_managed_node_groups.ng-01.iam_role_name] 
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}