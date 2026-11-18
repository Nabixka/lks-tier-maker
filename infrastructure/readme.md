# Infrastructure as Code
<p>This directory are for IaC section, there's some base stack that already complete but there's some bug that you must fix. You can use modules either just stack but maybe it can impact the score.</p>

<h3>How to deploy</h3>
<p>There's 2 way you can deploy this terraform. Before this you must configure the AWS Credentials</p>

```bash
# Run or manual change the credentials file
aws configure
```

### Manual

<p>Basic terraform command that flexible depends on you. Here's some command that you can use</p>

```bash
# Run the command on the target stack 
# Initialize the terraform
terraform init

# Validate the terraform
terraform validate

# Show information/configuraton before create
terraform plan

# Create the infrastructure
terraform apply

# Auto yes when apply (so no confirmation)
terraform apply -auto-approve

# Destroy the infrastructure if you want 
terraform destroy

```

### Deploy
<p>This way you use deploy.sh, so you run on directory that have deploy.sh. If you want run new stack that you create you must manually add it at deploy.sh</p>

```bash

```