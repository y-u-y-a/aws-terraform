# Route Table
resource "aws_route_table" "tf_route_public" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf_route_public"
  }
}
# Pass IGW
resource "aws_route" "tf_route_igw" {
  route_table_id = aws_route_table.tf_route_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.tf_igw.id
  depends_on = [aws_route_table.tf_route_public] # aws_route_tableに依存
}
# Assciation Subnet(サブネットの関連付け)
resource "aws_route_table_association" "tf_associ_public" {
  subnet_id = aws_subnet.tf_subnet_public_1a.id
  route_table_id = aws_route_table.tf_route_public.id
}
