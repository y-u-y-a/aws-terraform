# VPC作成
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main"
  }
}
# for yum
# resource "aws_vpc_endpoint" "s3" {
#   vpc_id = aws_vpc.main.id
#   service_name = "com.amazonaws.ap-northeast-1.s3"
#   route_table_ids = [aws_route_table.public.id]
# }
