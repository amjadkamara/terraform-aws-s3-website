# terraform-aws-s3-website

Terraform Infrastructure as Code (IaC) project that provisions an
**Amazon S3 static website** with public read access. The configuration
creates the required AWS resources, uploads a website entry page, and
outputs the website endpoint after deployment.

------------------------------------------------------------------------

# Features

-   Creates an Amazon S3 bucket for static website hosting
-   Configures the bucket as an S3 Website Endpoint
-   Uploads a local `index.html` file automatically
-   Configures a bucket policy allowing public read access
-   Disables S3 Public Access Block settings required for website
    hosting
-   Uses Terraform state management for repeatable deployments
-   Supports complete cleanup using `terraform destroy`

------------------------------------------------------------------------

# AWS Resources Created

  -------------------------------------------------------------------------
  Resource                                Purpose
  --------------------------------------- ---------------------------------
  `aws_s3_bucket`                         Creates the S3 bucket that hosts
                                          the website

  `aws_s3_bucket_website_configuration`   Enables static website hosting
                                          with `index.html` as the default
                                          page

  `aws_s3_bucket_public_access_block`     Allows public website access by
                                          disabling restrictive public
                                          access settings

  `aws_s3_bucket_policy`                  Grants anonymous users permission
                                          to read website files
                                          (`s3:GetObject`)

  `aws_s3_object`                         Uploads the local `index.html`
                                          file into the bucket
  -------------------------------------------------------------------------

------------------------------------------------------------------------

# Project Structure

``` text
terraform-aws-s3-website/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── index.html
├── .terraform.lock.hcl
└── README.md
```

------------------------------------------------------------------------

# Prerequisites

-   Terraform **1.0+**
-   AWS CLI **v2**
-   AWS account with sufficient IAM permissions

Configure AWS credentials:

``` bash
aws configure
```

------------------------------------------------------------------------

# Deployment

## 1. Clone the Repository

``` bash
git clone https://github.com/amjadkamara/terraform-aws-s3-website.git
cd terraform-aws-s3-website
```

## 2. Initialise Terraform

``` bash
terraform init
```

## 3. Review the Plan

``` bash
terraform plan
```

Expected output:

``` text
Plan: 5 to add, 0 to change, 0 to destroy.
```

Resources created:

-   Amazon S3 Bucket
-   Website Configuration
-   Public Access Block Configuration
-   Bucket Policy
-   Website Object (`index.html`)

## 4. Apply

``` bash
terraform apply
```

Type:

``` text
yes
```

## 5. Get Outputs

``` bash
terraform output website_url
terraform output bucket_arn
```

------------------------------------------------------------------------

# Destroy Infrastructure

``` bash
terraform destroy
```

------------------------------------------------------------------------

# Technologies

-   Terraform
-   AWS
-   Amazon S3
-   IAM
-   AWS CLI

------------------------------------------------------------------------

# Learning Objectives

-   Infrastructure as Code (IaC)
-   Amazon S3 Static Website Hosting
-   Terraform State Management
-   Declarative Cloud Infrastructure
-   AWS Resource Provisioning

------------------------------------------------------------------------

# Repository

https://github.com/amjadkamara/terraform-aws-s3-website

------------------------------------------------------------------------

## Author

**Amjad M. Kamara**

Cloud Solutions Architect \| DevOps Engineer \| Infrastructure as Code
\| AWS \| Terraform

