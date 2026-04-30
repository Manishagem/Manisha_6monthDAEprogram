# ================================================================
# main.tf
# EISP AWS IAM — Roles, Policies, Permission Boundaries
# Aligned with Zero Trust: least privilege, explicit deny,
# permission boundaries, SAML federation, STS time-limited tokens
# Author: Manisha Gupta | EISP-IAM-004 | FR-AWS-02
# ================================================================

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  # Default tags applied to every resource created by this config
  # Zero Trust: every resource is labelled — no anonymous infrastructure
  default_tags {
    tags = {
      Project        = "EISP"
      Owner          = var.project_owner
      ManagedBy      = "Terraform"
      Classification = "Confidential"
      ZeroTrust      = "true"
    }
  }
}

# ── LOCALS ──────────────────────────────────────────────────────
# Build ARN prefixes once, reference everywhere
# Prevents typos from manual ARN typing
locals {
  iam_prefix  = "arn:aws:iam::${var.aws_account_id}"
  saml_arn    = "${local.iam_prefix}:saml-provider/authentik-saml"
}

# ================================================================
# PERMISSION BOUNDARY
# Why: Hard ceiling on ALL EISP roles. Even if an attacker
# attaches AdministratorAccess to a compromised role, the
# boundary blocks any action outside this definition.
# Zero Trust principle: Assume Breach — limit blast radius.
# ================================================================

resource "aws_iam_policy" "eisp_permission_boundary" {
  name        = "EISP-PermissionBoundary"
  description = "Zero Trust hard ceiling for all EISP roles. us-east-1 only. No billing/org access."
  path        = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # Allow EISP service actions — but ONLY in us-east-1
        # This is a condition key restriction: no matter what
        # the attached policy says, cross-region is blocked
        Sid    = "AllowEISPServicesInRegionOnly"
        Effect = "Allow"
        Action = [
          "ec2:*", "s3:*", "iam:*",
          "cloudtrail:*", "logs:*",
          "guardduty:*", "securityhub:*"
        ]
        Resource = "*"
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = var.aws_region
          }
        }
      },
      {
        # Unconditional deny — cannot be overridden by any policy
        # Even AdministratorAccess cannot grant billing access
        # if this boundary is attached
        Sid    = "DenyBillingAndOrgAlways"
        Effect = "Deny"
        Action = [
          "aws-portal:*",
          "organizations:*",
          "account:*",
          "billing:*"
        ]
        Resource = "*"
      }
    ]
  })
}

# ================================================================
# SAML TRUST POLICY (DATA SOURCE)
# Why: All three roles share the same trust policy.
# Using a data source avoids copy-pasting JSON.
# The condition ensures the SAML assertion is destined for AWS
# (SAML:aud check) — prevents assertion replay attacks where
# a valid assertion from one service is replayed to another.
# ================================================================

data "aws_iam_policy_document" "saml_federation_trust" {
  statement {
    sid     = "AllowSAMLFederationFromAuthentik"
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithSAML"]

    principals {
      type        = "Federated"
      identifiers = [local.saml_arn]
    }

    # This condition is MANDATORY for SAML federation security.
    # It verifies the assertion was created for AWS specifically.
    # Without it, a SAML assertion from authentik could
    # theoretically be replayed to any service that trusts it.
    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }
}

# ================================================================
# ROLE 1: EISP-Developer-Role
# Purpose: Application development — EC2 and scoped S3 only
# Least privilege: Cannot touch IAM, VPC architecture,
# or any service outside the developer workflow
# ================================================================

resource "aws_iam_role" "developer" {
  name                 = "EISP-Developer-Role"
  description          = "EISP Developer — EC2 + eisp-dev-* S3 only. No IAM write. No VPC modification."
  path                 = "/"
  assume_role_policy   = data.aws_iam_policy_document.saml_federation_trust.json
  permissions_boundary = aws_iam_policy.eisp_permission_boundary.arn

  # 4-hour session — Zero Trust time-limited access
  # Credentials auto-expire; no indefinite sessions
  max_session_duration = 14400
}

resource "aws_iam_policy" "developer" {
  name        = "EISP-Developer-Policy"
  description = "Least privilege for EISP Developers. EC2 describe/start/stop, eisp-dev-* S3, all IAM write denied."
  path        = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "EC2DeveloperAccess"
        Effect = "Allow"
        Action = [
          "ec2:Describe*",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:RebootInstances"
        ]
        Resource = "*"
        # Region condition: developer can ONLY operate in us-east-1
        # Any API call to another region is denied at the policy level
        # AND at the boundary level (defence in depth)
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = var.aws_region
          }
        }
      },
      {
        Sid    = "S3DeveloperScopedAccess"
        Effect = "Allow"
        Action = [
          "s3:GetObject", "s3:PutObject",
          "s3:DeleteObject", "s3:ListBucket"
        ]
        # Resource ARN scope: ONLY buckets prefixed with eisp-dev-
        # Developers cannot access eisp-logs-*, eisp-prod-*, or any
        # other bucket. This is resource-level scoping, not just action-level.
        Resource = [
          "arn:aws:s3:::eisp-dev-*",
          "arn:aws:s3:::eisp-dev-*/*"
        ]
      },
      {
        # Explicit deny — takes precedence over any Allow in ANY policy
        # Even if someone attaches AmazonEC2FullAccess, this deny wins
        Sid    = "DenyIAMWrite"
        Effect = "Deny"
        Action = [
          "iam:CreateUser", "iam:DeleteUser",
          "iam:AttachUserPolicy", "iam:DetachUserPolicy",
          "iam:CreateRole", "iam:DeleteRole",
          "iam:AttachRolePolicy", "iam:PutRolePolicy",
          "iam:CreatePolicy"
        ]
        Resource = "*"
      },
      {
        Sid    = "DenyVPCArchitectureChanges"
        Effect = "Deny"
        Action = [
          "ec2:CreateVpc", "ec2:DeleteVpc",
          "ec2:ModifyVpcAttribute",
          "ec2:AttachInternetGateway",
          "ec2:DeleteSubnet",
          "ec2:DeleteRouteTable"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "developer" {
  role       = aws_iam_role.developer.name
  policy_arn = aws_iam_policy.developer.arn
}

# ================================================================
# ROLE 2: EISP-SecurityAnalyst-Role
# Purpose: Read-only security monitoring and audit
# Least privilege: Can see everything needed for analysis,
# cannot modify or delete anything
# ================================================================

resource "aws_iam_role" "security_analyst" {
  name                 = "EISP-SecurityAnalyst-Role"
  description          = "EISP Security Analyst — read-only audit access. No create/modify/delete."
  path                 = "/"
  assume_role_policy   = data.aws_iam_policy_document.saml_federation_trust.json
  permissions_boundary = aws_iam_policy.eisp_permission_boundary.arn
  max_session_duration = 14400
}

resource "aws_iam_policy" "security_analyst" {
  name        = "EISP-SecurityAnalyst-Policy"
  description = "Read-only: CloudTrail, CloudWatch Logs, IAM, GuardDuty, SecurityHub. All write operations denied."
  path        = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "CloudTrailReadOnly"
        Effect = "Allow"
        Action = [
          "cloudtrail:LookupEvents",
          "cloudtrail:GetTrail",
          "cloudtrail:DescribeTrails",
          "cloudtrail:GetTrailStatus",
          "cloudtrail:ListTags"
        ]
        Resource = "*"
      },
      {
        Sid    = "CloudWatchLogsReadOnly"
        Effect = "Allow"
        Action = [
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:GetLogEvents",
          "logs:FilterLogEvents",
          "logs:StartQuery",
          "logs:GetQueryResults"
        ]
        Resource = "*"
      },
      {
        Sid    = "IAMReadOnly"
        Effect = "Allow"
        Action = [
          "iam:GenerateCredentialReport",
          "iam:GetCredentialReport",
          "iam:Get*",
          "iam:List*"
        ]
        Resource = "*"
      },
      {
        Sid    = "S3LogBucketsReadOnly"
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:ListBucket"]
        Resource = [
          "arn:aws:s3:::eisp-logs-*",
          "arn:aws:s3:::eisp-logs-*/*"
        ]
      },
      {
        Sid    = "SecurityToolsReadOnly"
        Effect = "Allow"
        Action = [
          "guardduty:GetFindings", "guardduty:ListFindings",
          "guardduty:GetDetector",
          "securityhub:GetFindings", "securityhub:ListFindings",
          "securityhub:DescribeHub"
        ]
        Resource = "*"
      },
      {
        # Belt-and-suspenders: explicit deny on any write operation
        # Ensures a future policy attachment cannot accidentally
        # grant write access to an analyst
        Sid    = "DenyAllWriteOperations"
        Effect = "Deny"
        Action = [
          "iam:Create*", "iam:Delete*", "iam:Attach*",
          "iam:Detach*", "iam:Put*", "iam:Update*",
          "ec2:RunInstances", "ec2:TerminateInstances",
          "s3:DeleteObject", "s3:PutObject",
          "cloudtrail:StopLogging", "cloudtrail:DeleteTrail",
          "cloudtrail:UpdateTrail"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "security_analyst" {
  role       = aws_iam_role.security_analyst.name
  policy_arn = aws_iam_policy.security_analyst.arn
}

# ================================================================
# ROLE 3: EISP-IAMEngineer-Role
# Purpose: Identity provisioning — users, groups, roles, SAML
# Least privilege: Cannot access data (S3/EC2), cannot grant
# admin access to anyone including themselves
# ================================================================

resource "aws_iam_role" "iam_engineer" {
  name                 = "EISP-IAMEngineer-Role"
  description          = "EISP IAM Engineer — identity provisioning. No S3 data, no EC2 compute, no admin escalation."
  path                 = "/"
  assume_role_policy   = data.aws_iam_policy_document.saml_federation_trust.json
  permissions_boundary = aws_iam_policy.eisp_permission_boundary.arn
  max_session_duration = 14400
}

resource "aws_iam_policy" "iam_engineer" {
  name        = "EISP-IAMEngineer-Policy"
  description = "Identity provisioning for EISP. Scoped to EISP-* resources. Cannot escalate to admin."
  path        = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "IAMUserManagement"
        Effect = "Allow"
        Action = [
          "iam:CreateUser", "iam:DeleteUser", "iam:UpdateUser",
          "iam:GetUser", "iam:ListUsers",
          "iam:TagUser", "iam:UntagUser"
        ]
        # Resource scope: only non-admin users
        # The condition prevents creating users tagged as Admin
        Resource = "${local.iam_prefix}:user/*"
        Condition = {
          StringNotLike = {
            "iam:ResourceTag/Role" = "Admin"
          }
        }
      },
      {
        Sid    = "IAMGroupManagement"
        Effect = "Allow"
        Action = [
          "iam:CreateGroup", "iam:DeleteGroup", "iam:UpdateGroup",
          "iam:GetGroup", "iam:ListGroups",
          "iam:AddUserToGroup", "iam:RemoveUserFromGroup"
        ]
        Resource = "${local.iam_prefix}:group/*"
      },
      {
        Sid    = "IAMRoleManagementScopedToEISP"
        Effect = "Allow"
        Action = [
          "iam:CreateRole", "iam:DeleteRole",
          "iam:AttachRolePolicy", "iam:DetachRolePolicy",
          "iam:GetRole", "iam:ListRoles",
          "iam:PassRole", "iam:UpdateRole",
          "iam:TagRole", "iam:ListRolePolicies"
        ]
        # Scoped to EISP-* roles only — cannot modify non-EISP roles
        Resource = "${local.iam_prefix}:role/EISP-*"
      },
      {
        Sid    = "SAMLFederationManagement"
        Effect = "Allow"
        Action = [
          "iam:CreateSAMLProvider",
          "iam:UpdateSAMLProvider",
          "iam:ListSAMLProviders",
          "iam:GetSAMLProvider"
        ]
        Resource = "*"
      },
      {
        # Critical: prevents privilege escalation
        # IAM Engineer cannot attach AdministratorAccess to anyone
        # This closes the "I'll just give myself admin" attack path
        Sid    = "DenyAdminEscalation"
        Effect = "Deny"
        Action = [
          "iam:AttachUserPolicy",
          "iam:AttachGroupPolicy",
          "iam:AttachRolePolicy"
        ]
        Resource = "*"
        Condition = {
          ArnLike = {
            "iam:PolicyARN" = "arn:aws:iam::aws:policy/AdministratorAccess"
          }
        }
      },
      {
        # IAM Engineer has no business accessing data or compute
        # Zero Trust: even admins operate with least privilege
        Sid    = "DenyDataAndComputeAccess"
        Effect = "Deny"
        Action = [
          "s3:GetObject", "s3:PutObject", "s3:DeleteObject",
          "ec2:RunInstances", "ec2:TerminateInstances",
          "ec2:StartInstances", "ec2:StopInstances"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "iam_engineer" {
  role       = aws_iam_role.iam_engineer.name
  policy_arn = aws_iam_policy.iam_engineer.arn
}

# ================================================================
# IAM GROUPS
# Why: Permissions are attached to groups, not users.
# Adding a user to a group instantly grants the correct access.
# Removing them revokes it. No stale individual policy attachments.
# ================================================================

resource "aws_iam_group" "developers" {
  name = "EISP-Developers"
  path = "/"
}

resource "aws_iam_group" "security_analysts" {
  name = "EISP-SecurityAnalysts"
  path = "/"
}

resource "aws_iam_group" "iam_engineers" {
  name = "EISP-IAMEngineers"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "developers" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.developer.arn
}

resource "aws_iam_group_policy_attachment" "security_analysts" {
  group      = aws_iam_group.security_analysts.name
  policy_arn = aws_iam_policy.security_analyst.arn
}

resource "aws_iam_group_policy_attachment" "iam_engineers" {
  group      = aws_iam_group.iam_engineers.name
  policy_arn = aws_iam_policy.iam_engineer.arn
}

# ================================================================
# SAML IDENTITY PROVIDER — authentik
# This registers authentik as a trusted SAML IdP in AWS IAM.
# After this, AWS will accept SAML assertions signed by authentik.
# The metadata XML file is downloaded from authentik (Task 3).
# ================================================================

resource "aws_iam_saml_provider" "authentik" {
  name                   = "authentik-saml"
  # This file is downloaded from authentik in Task 3 Step 2
  saml_metadata_document = file("${path.module}/authentik-metadata.xml")
}
