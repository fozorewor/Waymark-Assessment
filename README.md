# Terraform Project with Multiple Environments

This project manages infrastructure using Terraform, it setups a VPC with 3 subnets in 3 availability zones, an autoscaling group for deploying an Amazon Linux server, a launch template, IAM profiles and roles and security groups. It supports one environment and can support multiple others by segmenting the files into environment folders. The terraform state is stored locally.

It also deploys a Hashicorp Vault instance into the autoscaled servers via a userdata script which opens port 8200 on the server. A ingress rule on the security group also allows access to the service on port 8200.

## Table of Contents

- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

## Project Structure

The repository is structured as follows:

\```
├── providers.tf/
├── asg.tf
├── vpc.tf
├── modules/
│   └── ...
├── terraform/
│   ├── backend.tf
│   ├── provider.tf
│   └── variables.tf
├── .aws/
│   └── credentials
└── README.md
\```


- **`modules/`**: Reusable Terraform modules.
- **`terraform/`**: Common Terraform files (e.g., provider configurations, variables).
- **`.aws/credentials`**: AWS credentials file for authentication.

## Prerequisites

1. **Terraform**: Install Terraform version `>= 1.0.0`.
2. **AWS CLI**: Install the AWS CLI to configure credentials.
3. **AWS Credentials**: Ensure that your AWS credentials are correctly configured in the `.aws/credentials` file.


### AWS Credentials

Ensure your AWS credentials are configured in the `.aws/credentials` file:

\```ini
[default]
aws_access_key_id = <your-access-key-id>
aws_secret_access_key = <your-secret-access-key>

[<aws-profile>]
aws_access_key_id = <your-access-key-id>
aws_secret_access_key = <your-secret-access-key>
\```

### Initialize the Environment

Navigate to the environment directory (e.g., `environments/development`) and initialize Terraform:

\```bash
cd environments/development
terraform init
\```

This command configures the backend and installs the required providers.

## Usage

### Plan

To see the changes that Terraform will apply, run:

\```bash
terraform plan
\```

### Apply

To apply the changes and provision the resources, run:

\```bash
terraform apply
\```

### Destroy

To destroy the resources for an environment, run:

\```bash
terraform destroy
\```

## Best Practices

- **Version Control**: Ensure Terraform files are version-controlled. Avoid committing sensitive information.
- **State Management**: Use S3 and DynamoDB to manage Terraform state and locking.
- **Modularization**: Use Terraform modules to create reusable components.
- **Environment Isolation**: Keep environment configurations isolated to prevent unintended changes.

## Troubleshooting

- **Authentication Issues**: Ensure your AWS credentials are correct and that you have the necessary permissions.
- **State Locking Issues**: If you encounter state locking issues, check the DynamoDB table for any existing locks.

For further assistance, consult the [Terraform documentation](https://www.terraform.io/docs).
