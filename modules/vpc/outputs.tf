###### vpc/outputs.tf 
output "aws_public_subnet" {
  value = aws_subnet.public_techchallenge_subnet.*.id
}

output "vpc_id" {
  value = aws_vpc.techchallenge.id
}