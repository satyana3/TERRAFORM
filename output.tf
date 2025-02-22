output "vpc_id" {
    value = aws_vpc.main.id
  
}

output "public_subnet_ids" {
    value = aws_subnet.public[*].id
  
}


output "subnet_ids" {
    value = aws_subnet.private[*].id  # Assuming you have a resource named aws_subnet.private
}