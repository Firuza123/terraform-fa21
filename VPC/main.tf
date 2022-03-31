# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "main"
  }
}
#Create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub_subnet_cidr
  availability_zone = var.av_zones.1
tags = {
    Name = "Public Subnet"
  }
}

#Create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.prv_subnet_cidr
  availability_zone = var.av_zones.2
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
  subnet_id      = aws_subnet.public_subnet.id
route_table_id   = aws_route_table.public-rt.id
}

# Rout table association with private subnet
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private-rt.id
}
