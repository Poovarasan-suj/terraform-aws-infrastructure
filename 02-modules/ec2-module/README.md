#  Terraform EC2 Module

##  Project Overview

This project demonstrates how to create and use a **Terraform module** to provision an AWS EC2 instance.

It is divided into two parts:

* **ec2-module/** → reusable infrastructure code
* **module-usage/** → how to call and use the module

---

##  What is a Module?

A module in Terraform is a **reusable block of code** that can be used multiple times to create infrastructure.

 Instead of writing the same EC2 code again and again, we define it once inside a module and reuse it.

---

##  Project Structure

```
03-modules/
├── ec2-module/
│   ├── main.tf
│   ├── variables.tf
│   └── output.tf
│
└── module-usage/
    ├── main.tf
    ├── provider.tf
    └── output.tf
```

---

## 🔹 ec2-module (Reusable Code)

This folder contains the actual infrastructure definition.

###  main.tf

Defines the EC2 resource:

```hcl
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}
```

---

###  variables.tf

Defines input variables:

```hcl
variable "ami" {}
variable "instance_type" {}
```

---

###  output.tf

Returns useful values:

```hcl
output "public_ip" {
  value = aws_instance.example.public_ip
}
```

---

##  module-usage (Calling the Module)

This folder shows how to use the module.

###  main.tf

```hcl
module "ec2_instance" {
  source = "../ec2-module"

  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"
}
```

---

###  provider.tf

```hcl
provider "aws" {
  region = "us-east-1"
}
```

---

###  output.tf

```hcl
output "public_ip" {
  value = module.ec2_instance.public_ip
}
```

---

##  How It Works

1. Root module calls the child module:

   ```
   module "ec2_instance"
   ```

2. Module creates EC2 instance internally:

   ```
   aws_instance.example
   ```

3. Module exposes output:

   ```
   public_ip
   ```

4. Root module prints output:

   ```
   module.ec2_instance.public_ip
   ```

---

##  Commands Used

```bash
terraform init
terraform plan
terraform apply
```

---

##  Key Learnings

* How to create reusable Terraform modules
* Difference between root module and child module
* Passing input variables to modules
* Fetching output values from modules
* Writing clean and modular infrastructure code

---

##  Why Modules?

* Avoid code duplication
* Improve code organization
* Enable reusability
* Follow real DevOps practices

---

##  Output

After running `terraform apply`, Terraform displays:

```
public_ip = <EC2 Public IP>
```

---
