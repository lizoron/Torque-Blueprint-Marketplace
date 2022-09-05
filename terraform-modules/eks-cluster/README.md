# Provision an EKS Cluster
This repository contains a terraform module that creates an EKS cluster on your AWS account with everything you need to connect it to Torque.
## Prequisites:
### terraform
terraform is a command line tools that lets you provision resources in the cloud. If you don't have it installed [get it now](https://www.terraform.io/downloads)
### kubectl 
kubectl is a command line tool that lets you connect to a Kubernetes cluster, execute commands, and get informed about its state.
If you don't have it installed [get it now](https://kubernetes.io/docs/tasks/tools/#kubectl)
### AWS configured
in order to use the terraform module we provide you will need to configure your AWS account. Although you can do it by several ways we reccommend using the [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
### eksctl
eksctl is an AWS command line tool that lets you execute commands regarding EKS cluster. We will need it to add some utility capability to our cluster. If you don't have it installed [get it now](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)