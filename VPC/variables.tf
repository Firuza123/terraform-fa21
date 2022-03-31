variable "vpc_cidr" {
    default = "10.0.0.0/16"
} 

variable "pub_subnet_cidr" {
    default = "10.0.1.0/24"
  }

  variable "prv_subnet_cidr" {
    default = "10.0.2.0/24" 
}