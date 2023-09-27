resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  

  tags = {
    Name = "route-01"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.example.id
}
# resource "aws_route_table" "example-02" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.example.id
#   }

  

#   tags = {
#     Name = "route-02"
#   }
# }
# resource "aws_route_table_association" "b" {
#   subnet_id      = aws_subnet.private.id
#   route_table_id = aws_nat_gateway.example.id
# }