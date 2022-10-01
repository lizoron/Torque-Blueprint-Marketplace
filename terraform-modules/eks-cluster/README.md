# Provision an EKS Cluster
This repository contains a terraform module that creates an EKS cluster on your AWS account with everything you need to connect it to Torque.
## Prequisites
1. __Terraform__: Command-line tool that lets you provision resources in the cloud ([get it now](https://www.terraform.io/downloads))
2. __kubectl__: Command-line tool that lets you connect to a Kubernetes cluster, execute commands, and get information about its state ([get it now](https://kubernetes.io/docs/tasks/tools/#kubectl))
3. __AWS CLI__: To use the terraform module, you will need to install and configure AWS CLI ([get it now](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))
4. __AWS Permissions__: Make sure your AWS user has sufficient permissions to create an EKS cluster. You can use [this policy json file](https://github.com/QualiTorque/Torque-Blueprint-Marketplace/blob/main/config/eks-cluster-creator/policy.json)


## Instructions to create the cluster
1. Download the EKS cluster terraform module. There are 2 ways to do it:
   1. Clone this repository to your local machine and navigate to the *__terraform-modules/eks-cluster__* folder.
   2. Use _download-directory.github.io_ __[link](https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2FQualiTorque%2FTorque-Blueprint-Marketplace%2Ftree%2Fmain%2Fterraform-modules%2Feks-cluster)__ to download a zip file for the folder, create a local *__eks-cluster__* folder, and extract all files from the zip file to it.
2. Navigate to the *__eks-cluster__* downloaded folder on your terminal.
3. Edit the *__terraform.tfvars file__* and fill in all the inputs in the blank form `<>`.
4. Execute `terraform init` to download all modules.
5. Execute `terraform apply` to start the cloud resource creation process.
6. Terraform will ask you `Do you want to perform these actions?` type `yes`.
7. Installation should take around ~15 minutes. Continue to [connect your cluster to Torque](https://docs.qtorque.io/getting-started/Connect%20a%20Kubernetes%20Cluster).


