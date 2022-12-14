# Learn Terraform - Provision an EKS Cluster

This repo is a companion repo to the [Provision an EKS Cluster learn guide](https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster), containing
Terraform configuration files to provision an EKS cluster on AWS.

# Update kubectl local config
```
aws eks update-kubeconfig --region ap-southeast-1 --name trutran-eks-cluster

```
# Refer

```
https://hands-on.cloud/how-to-set-up-amazon-eks-cluster-using-terraform/

```

# Refer

```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```