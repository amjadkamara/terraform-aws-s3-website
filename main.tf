# ==============================================================================
# Core Infrastructure Configuration
# Provisions S3 bucket hosting, access controls, policy, and initial assets.
# ==============================================================================

# Core Terraform and provider version constraints
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# AWS provider initialization
provider "aws" {
  region = var.aws_region
}

# Primary S3 bucket definition
resource "aws_s3_bucket" "website" {
  bucket        = var.bucket_name
  force_destroy = true # Allows deletion of non-empty bucket during destroy
}

# S3 static website hosting configuration
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website.id

  # Entry point document configuration
  index_document {
    suffix = "index.html"
  }
}

# Disable default public access blocks to allow public reading
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# IAM policy for anonymous public read access
resource "aws_s3_bucket_policy" "public_read_policy" {
  depends_on = [aws_s3_bucket_public_access_block.public_access] # Ensure access unblocked first
  bucket     = aws_s3_bucket.website.id

  # Bucket policy definition in JSON
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })
}

# Upload index.html asset to S3
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.website.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  etag         = filemd5("index.html") # Triggers update on file content change
}
