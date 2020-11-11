# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public"
  }
}
# Pass IGW
resource "aws_route" "igw" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
  depends_on = [aws_route_table.public] # aws_route_tableに依存
}
# Assciation Subnet(サブネットの関連付け)
resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}
