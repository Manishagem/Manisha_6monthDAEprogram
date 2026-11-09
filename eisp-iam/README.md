# EISP IAM (Identity and Access Management)

This module contains Terraform configurations for managing Identity and Access Management (IAM) within the Enterprise Identity Security Platform (EISP).

## Configuration Files

| File | Purpose |
| :--- | :--- |
| `main.tf` | Core infrastructure resources and provider configuration. |
| `variables.tf` | Input variable definitions for customization. |
| `outputs.tf` | Exported resource attributes (e.g., resource IDs). |
| `authentik-metadata.xml` | XML metadata for Authentik integration. |
| `.terraform.lock.hcl` | Dependency lock file for provider versions. |

## Deployment Guide

Ensure you have [Terraform](https://www.terraform.io/downloads) installed and configured with appropriate credentials.

```bash
# Initialize the Terraform workspace
terraform init

# Review the execution plan
terraform plan

# Apply the configuration
terraform apply
```

> **Note**: Sensitive files are excluded via `.gitignore` to prevent credential leaks.
