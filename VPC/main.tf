# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}
#Create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
tags = {
    Name = "Public Subnet"
  }
}

#Create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private Subnet"
  }
}
# Creating Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my gitw"
  }
}
# Create Public Route Table 
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "Public Route Table"
  }
}


# Create Private Route Table 
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
 tags = {
    Name = "private Route Table"
  }
}



# Rout table association with public subnet
resource "aws_route_table_association" "a" {
  subnet_id      = "subnet-0f30d8dc170627dd5"
  route_table_id = "rtb-082658383ee44c0a0"
}

# Rout table association with private subnet
resource "aws_route_table_association" "b" {
  subnet_id      = "subnet-0dc4b56353dae4a9a"
  route_table_id = "rtb-0fd9438adbe1a9f76"
}
