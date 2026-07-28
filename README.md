# terraform-aws-s3-website

Declarative Infrastructure as Code (IaC) project implementing an Amazon Web Services (AWS) S3 bucket configured for public static website hosting.

## Architecture Highlights

* **Resource Provisioning:** Creates an isolated S3 storage container with automated lifecycle teardown safeguards (`force_destroy`).
* **Endpoint Hosting:** Configures S3 website routing rules mapped to `index.html`.
* **Access Management:** Explicitly overrides default S3 account-level block settings and attaches a scoped IAM policy granting read permissions (`s3:GetObject`) to anonymous HTTP requests.
* **Asset Lifecycle:** Manages local web asset synchronization using MD5 hashing to prevent unnecessary re-uploads (`etag`).

---

## Prerequisites

* **Terraform CLI:** Engine version `>= 1.0.0`
* **AWS CLI:** Version `2.x` configured with active IAM access credentials (`aws configure`)

---

## Execution Workflow

1. **Initialize Directory:**
   ```bash
   terraform init
   ```

2. **Generate Speculative Execution Plan:**
   ```bash
   terraform plan
   ```

3. **Apply Targeted Infrastructure Changes:**
   ```bash
   terraform apply
   ```

4. **Verify Output Endpoint:**
   Retrieve the generated `website_url` from the execution summary or execute:
   ```bash
   terraform output website_url
   ```

---

## Infrastructure De-provisioning

To tear down all active cloud resources managed by this configuration:

```bash
terraform destroy
```
