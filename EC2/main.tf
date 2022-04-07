

resource "aws_vpc" "ec2_vpc" {
  cidr_block = "30.10.0.0/16"
  tags = {
      "Name" = "ec2-vpc"
  }
}
