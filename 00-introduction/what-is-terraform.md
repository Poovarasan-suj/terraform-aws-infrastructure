# What is Terraform?

##  Definition
Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. It is used to create, manage, and automate infrastructure across multiple cloud providers like AWS, Azure, and GCP.

---

##  Simple Explanation
Terraform allows you to define your infrastructure (servers, networks, databases) using code instead of manually creating them in the cloud console.

---

##  How It Works
1. Write infrastructure code in `.tf` files
2. Run `terraform init` to initialize
3. Run `terraform plan` to preview changes
4. Run `terraform apply` to create infrastructure

---
##  Supported Platforms
- AWS
- Azure
- Google Cloud (GCP)
- Kubernetes
- Many more providers

---

## Key Features
- Infrastructure as Code (IaC)
- Multi-cloud support
- Execution plan (preview before apply)
- State management
- Reusable modules

---

##  Why Terraform is Important
Terraform helps automate infrastructure, reduce manual errors, and make deployments consistent and repeatable.

---

##  Example
```hcl
resource "aws_instance" "example" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}