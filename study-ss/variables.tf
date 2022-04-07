# Tag for VPC and subnet
variable "tag" {
  type        = string
  description = "This tag is applied for VPC and SUBNETS"
  default     = "TEST"
}

variable "vpc_cidr" {
  type = string
  description = "This cidr for VPC"
  default = "20.10.0.0/16"
}

variable "subnet_cidr" {
  type = list(any)
  description = "This cidr for Subnet"
  default = [
  "20.10.1.0/24", "20.10.2.0/24", "20.10.3.0/24", "20.10.4.0/24", # pub subnets
   "20.10.5.0/24", "20.10.6.0/24", "20.10.7.0/24", "20.10.8.0/24"  # pri subnet
  ]
   }
