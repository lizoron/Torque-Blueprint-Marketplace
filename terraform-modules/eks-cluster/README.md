# Provision an EKS Cluster
This repository contains a terraform module that creates an EKS cluster on your AWS account with everything you need to connect it to Torque.
## Prequisites:
### Terraform
Terraform is a command line tools that lets you provision resources in the cloud. If you don't have it installed [get it now](https://www.terraform.io/downloads)
### Kubectl 
Kubectl is a command line tool that lets you connect to a Kubernetes cluster, execute commands, and get informed about its state.
If you don't have it installed [get it now](https://kubernetes.io/docs/tasks/tools/#kubectl)
### Eksctl
Eksctl is an AWS command line tool that lets you execute commands regarding EKS cluster. We will need it to add some utility capability to our cluster. If you don't have it installed [get it now](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)