# Terraform Stack

## Validate Stack

```sh
aws cloudformation validate-template --template-body file://stack.yaml
```

## Create Stack

```sh
aws cloudformation create-stack --stack-name terraform-infra --template-body file://stack.yaml --parameters file://parameters/development.json
```

## Update Stack

```sh
aws cloudformation update-stack --stack-name terraform-infra --template-body file://stack.yaml --parameters file://parameters/development.json
```

## Delete Stack

```sh
aws cloudformation delete-stack --stack-name terraform-infra
```
