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
  cidr_block = var.pub_subnet_cidr
availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}

#Create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.prv_subnet_cidr
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

# Route Table Association with Public Subnet
resource "aws_route_table_association" "a" {
  subnet_id      = "subnet-0ef2820e6a329f45d"
  route_table_id = "rtb-07d63de29755b34b9"
}

# Creating Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Private Route Table"
  }
}


# Route Table association with Private Subnet
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}


