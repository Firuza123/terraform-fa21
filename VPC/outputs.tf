output "vpc_cidr" {
 value = aws_vpc.main.cidr_block 
}


output "public_subnet_scidr" {
    value = aws_subnet.public_subnet.cidr_block
}

output "private_subnet_cidr" {
    value = aws_subnet.private_subnet.id
}
output "greeting" {
    value = "Hello, cloud engeneers!!!"
}