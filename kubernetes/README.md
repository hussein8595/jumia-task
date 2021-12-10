# Terraform 

Terraform is used to provision EKS cluster in availability zones 

### prerequisites

- put your access/secret keys in terraform/provider.tf

## start Terraform 

```
terraform init

terraform apply
```

## configure kubectl with aws

```
aws eks --region region update-kubeconfig --name cluster_name

```

## start Terraform 

```
terraform output config-map-aws-auth

kubectl apply -f config-map-aws-auth

```

## verfiy worker nodes 

```
kubectl get nodes -o wide

```
