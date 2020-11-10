# Subnet(Region: Tokyo, AZ: 1a)
resource "aws_subnet" "tf_subnet_public_1a" {
  vpc_id = aws_vpc.tf_vpc.id # vpc
  availability_zone = "ap-northeast-1a" # AZ
  cidr_block = "10.0.10.0/24" # CIDR
  tags = {
    Name = "tf_subnet_public_1a"
  }
}
resource "aws_subnet" "tf_subnet_private_1a" {
  vpc_id = aws_vpc.tf_vpc.id # vpc
  availability_zone = "ap-northeast-1a" # AZ
  cidr_block = "10.0.11.0/24" # CIDR
  tags = {
    Name = "tf_subnet_private_1a"
  }
}
