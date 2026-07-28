# ==============================================================================
# Output Variable Definitions
# Exposes provisioned resource attributes post-apply.
# ==============================================================================

# Live HTTP endpoint for the static website
output "website_url" {
  description = "Public HTTP endpoint for the S3 static website."
  value       = "http://${aws_s3_bucket_website_configuration.website_config.website_endpoint}"
}

# Amazon Resource Name (ARN) of the bucket
output "bucket_arn" {
  description = "Amazon Resource Name (ARN) of the provisioned S3 bucket."
  value       = aws_s3_bucket.website.arn
}
