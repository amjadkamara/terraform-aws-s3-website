# ==============================================================================
# Input Variable Definitions
# Defines parameter defaults to avoid hardcoding environment specifics.
# ==============================================================================

# AWS target region for resource placement
variable "aws_region" {
  description = "Target AWS region for infrastructure deployment."
  type        = string
  default     = "us-east-1"
}

# Unique S3 bucket identifier
variable "bucket_name" {
  description = "Globally unique identifier for the Amazon S3 bucket."
  type        = string
  default     = "my-terraform-static-site-12345"
}
