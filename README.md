# Data friends day 2021

## Prerequisites

- [azure account](https://azure.microsoft.com/en-gb/free/)
- [azure-cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## How to deploy infrastructure

```bash
az login

cd terraform
terraform init
terraform plan
terraform apply
```

NB: do not forget to destroy it when it is no longer needed:

```bash
terraform destroy
```