# Provision an EKS Cluster
This repository contains a terraform module that creates an EKS cluster on your AWS account with everything you need to connect it to Torque.
## Prequisites:
### terraform
terraform is a command line tools that lets you provision resources in the cloud. If you don't have it installed [get it now](https://www.terraform.io/downloads)
### kubectl 
kubectl is a command line tool that lets you connect to a Kubernetes cluster, execute commands, and get informed about its state.
If you don't have it installed [get it now](https://kubernetes.io/docs/tasks/tools/#kubectl)
### aws cli
in order to use the terraform module we provide you will need to configure your AWS account. Although you can do it by several ways we require using the aws cli in order to connect to the new cluster. If you don't have it [get it now](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
### Permissions
Make sure the AWS user you use has enough permissions to create an EKS cluster.
you can use [this policy json file](https://github.com/QualiTorque/Torque-Blueprint-Marketplace/blob/main/config/eks-cluster-creator/policy.json)
### eksctl
eksctl is an AWS command line tool that lets you execute commands regarding EKS cluster. We will need it to add some utility capability to our cluster. If you don't have it installed [get it now](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)

## Download the EKS cluster terraform module.You can do it by 2 means:
1. Clone this repository to your local machine and navigate to the terraform-modules/eks-cluster folder.
2. Use download-directory.github.io [link](https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2FQualiTorque%2FTorque-Blueprint-Marketplace%2Ftree%2Fmain%2Fterraform-modules%2Feks-cluster) to download a zip file for the folder. create a local `eks-cluster` folder and extract all files from the zip file there.
## Create the cluster:
1. Navigate to the eks-cluster downloaded folder on your terminal.
2. Edit terraform.tfvars file and fill in all inputs in the blank form `<>`.
2. Execute `terraform init` to download all modules.
3. Execute `terraform apply` to start the cloud resources creation process.
4. Terraform will ask you for some inputs:
- Which AWS region do you want the EKS cluster be in? (e.g: eu-west-1). You can type any of [AWS available regions list](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions).
- A name for your new cluster. 
5. Terraform will ask you `Do you want to perform these actions?` type `yes`.