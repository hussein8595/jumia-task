# Terraform 

Terraform is used to provision EC2 , ELB , RDS & to configure our firewall rules & ssh port 

prerequisites

- put your access/secret keys in terraform/provider.tf
- put your public key path in terraform/vars.tf

## start Terraform 

```
terraform init

terraform apply
```

## Terraform output 

- ELB endpoint
- EC2 endpoint
- RDS endpoint

# Ansible 

Terraform is used to configure our DataBase , setup docker , build & deploy our applications

prerequisites

- put your EC2 endpoint in play-books/inventroy.txt
- put your database endpoint & configuration in play-books/vars.yml
- refer to an ssh ( if your git repo is private ) in play-books/vars.yml
