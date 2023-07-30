# Router53record
If you're a developer or a system administrator working with Amazon Web Services (AWS), you've probably encountered the need to manage DNS records efficiently. AWS Route 53 is a powerful DNS service that allows you to create, manage, and route traffic to your domain names. Automating this process can save time and effort, and that's where Terraform comes in.
In this article, we'll walk you through the process of creating an AWS Route 53 record using Terraform. We'll cover the basics of Terraform, the essential components of an AWS Route 53 record, and a step-by-step guide to creating the record using the provided Terraform script from GitHub.
What is Terraform?
Terraform is an Infrastructure as Code (IaC) tool that allows you to define and manage your infrastructure as code. With Terraform, you can create, modify, and delete cloud resources across various cloud providers, including AWS, in a consistent and repeatable manner. The Terraform configuration files are written in HashiCorp Configuration Language (HCL) and provide a declarative approach to defining your desired infrastructure state.
Before we proceed, ensure you have Terraform installed on your local machine. You can download it from the official website: https://www.terraform.io/downloads.html.
Understanding AWS Route 53 Records
AWS Route 53 records are used to map human-readable domain names to the corresponding IP addresses or other resource locations. The basic components of an AWS Route 53 record include:
1. Name:This is the domain name or subdomain for which you want to create the record, e.g., example.com or api.example.com.
2. Type:The type of record you want to create, such as A, AAAA, CNAME, MX, etc. Each type serves a different purpose, like mapping to an IPv4 address (A record) or an alias to another domain (CNAME).
3. Value:The value associated with the record, such as the IP address for A records or the destination domain for CNAME records.
4. TTL (Time to Live): The time duration for which the DNS servers should cache the record's information. TTL is specified in seconds.
Creating an AWS Route 53 Record with Terraform
Now, let's dive into the process of creating an AWS Route 53 record using Terraform. We assume you have a basic understanding of AWS and have set up your AWS credentials for Terraform.
Step 1: Terraform Initialization
Create a new directory for your Terraform configuration and create a new file named `main.tf`. In this file, you'll define your AWS provider and the necessary configuration for your Route 53 record.
provider "aws" {
 region = "us-east-1" # Replace with your desired AWS region
}
Step 2: Define the Route 53 Record
In the same `main.tf` file, add the following code to create an A record for your domain:
resource "aws_route53_record" "RECORDNAME" {
  zone_id = "Hosted zone id"
  name    = "RECORDNAME.abc.com"
  type    = "A"
  alias {
    name                   = "ELB_NAME"
    zone_id                = "ELB_HOSTED_ZONE"
    evaluate_target_health = true
  }
}
Step 3: Initialize and Apply
Open your terminal or command prompt, navigate to your project directory, and run the following commands:
terraform plan
terraform init
terraform apply
Step 4: Verify the Record
Once the Terraform script is applied successfully, navigate to your AWS Route 53 console, find your hosted zone, and verify the newly created A record.
