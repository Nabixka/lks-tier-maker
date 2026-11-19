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

<h2>Services</h2>

<p>You must create 7 stack. Once again you can either create modules or just create stack for services that don't have modules before. Your decision may impact the score</p>

<h2>Attention Error</h2>

- Setting Environtment at ec2-apps/user-data.sh if the application not work (so you deploy it after ALB Oregon complete)

<h2>Service Order</h2>
<p>It's depends on you but the most important order are number 9 - 12 if you want application run properly from the first deployment of Compute. I wan't use Docker but y'all not learn it yet so yeah i must use EC2 and why not API GATEWAY For user API & Amplify for FE? well...</p>

1. VPC Virginia & Oregon
2. Peering
3. Security Group
4. S3
5. SNS
6. RDS
7. Lambda
8. Eventbridge
9. EC2 Oregon 
10. ALB Oregon
11. EC2 Virginia
12. ALB Virginia