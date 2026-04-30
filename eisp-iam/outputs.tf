# outputs.tf
# These ARNs are printed after terraform apply.
# Copy the role ARNs — you need them for Task 3 (authentik property mapping).

output "permission_boundary_arn" {
  description = "Attach this to every new EISP IAM role as permissions_boundary"
  value       = aws_iam_policy.eisp_permission_boundary.arn
}

output "developer_role_arn" {
  description = "Used in authentik SAML attribute mapping — Developer group"
  value       = aws_iam_role.developer.arn
}

output "security_analyst_role_arn" {
  description = "Used in authentik SAML attribute mapping — SecurityAnalyst group"
  value       = aws_iam_role.security_analyst.arn
}

output "iam_engineer_role_arn" {
  description = "Used in authentik SAML attribute mapping — IAMEngineer group"
  value       = aws_iam_role.iam_engineer.arn
}

output "saml_provider_arn" {
  description = "Reference this in trust policies. Must match the local.saml_arn value."
  value       = aws_iam_saml_provider.authentik.arn
}
