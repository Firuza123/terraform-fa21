# this is a AWS provider 
provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "main" {
  cidr_block = "10.20.30.0/16"
  tags = {
    "Name" = "VPC"
  }
}
