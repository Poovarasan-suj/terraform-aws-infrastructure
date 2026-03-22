# 🚀 EC2 Instance Creation using Terraform

## 📌 Project Overview

This project demonstrates how to create an AWS EC2 instance using **Terraform** with a proper structure including:

* Provider configuration
* Input variables
* Variable values using `terraform.tfvars`
* Output variables

---

##  Concepts Covered

### 🔹 1. Provider

The provider block is used to define **which cloud platform** Terraform should interact with.

```hcl
provider "aws" {
  region = "us-east-1"
}
```

 Here, Terraform connects to AWS and creates resources in the **us-east-1 region**.

---

###  2. Input Variables

Input variables are used to make the configuration **dynamic and reusable**.

```hcl
variable "ami" {
  description = "Value for ami"
}

variable "instance_type" {
  description = "value for ec2_instance type"
}
```

 Instead of hardcoding values, we define variables and pass values later.

---

### 🔹 3. terraform.tfvars

This file is used to **assign values to variables**.

```hcl
ami = "ami-02dfbd4ff395f2a1b"
instance_type = "t2.micro"
```

 This allows easy modification without changing the main code.

---

### 🔹 4. Resource (EC2 Instance)

This block defines the actual infrastructure to be created.

```hcl
resource "aws_instance" "myinstance-1" {
  ami           = var.ami
  instance_type = var.instance_type
}
```

 Terraform creates an EC2 instance using the provided AMI and instance type.

---

### 🔹 5. Output Variables

Output variables are used to display useful information after resource creation.

```hcl
output "public_ip" {
  value = aws_instance.myinstance-1.public_ip
}
```

After `terraform apply`, Terraform will show the **public IP address** of the EC2 instance.

---

## Commands Used

```bash
terraform init
terraform plan
terraform apply
```

---

##  Key Learnings

* How to configure AWS provider in Terraform
* How to use input variables to make code reusable
* How to pass values using `terraform.tfvars`
* How to create an EC2 instance using Terraform
* How to retrieve outputs like public IP

---

##  Output

After running `terraform apply`, Terraform displays:

```
public_ip = <EC2 Public IP>
```

---

##  Conclusion

This project demonstrates the **basic building blocks of Terraform**.
It shows how to create infrastructure using code, making deployments:

* Repeatable
* Automated
* Easy to manage

---


