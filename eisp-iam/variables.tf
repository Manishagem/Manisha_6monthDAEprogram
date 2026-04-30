# variables.tf
# Never hardcode account IDs — always use variables

variable "aws_account_id" {
  description = "540405194786"
  type        = string
  validation {
    condition     = length(var.aws_account_id) == 12
    error_message = "AWS Account ID must be exactly 12 digits."
  }
}

variable "aws_region" {
  description = "AWS region for all EISP resources"
  type        = string
  default     = "us-east-1"
}

variable "project_owner" {
  description = "Owner tag for all EISP resources"
  type        = string
  default     = "Manisha Gupta"
}
