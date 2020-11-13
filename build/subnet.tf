# Subnet(Region: Tokyo)
## AZ: 1a
### Public
resource "aws_subnet" "public_1a" {
  vpc_id = aws_vpc.main.id # vpc
  availability_zone = "ap-northeast-1a" # AZ
  cidr_block = "10.0.10.0/24" # CIDR
  tags = {
    Group = "public"
  }
}
### Private
resource "aws_subnet" "private_1a" {
  vpc_id = aws_vpc.main.id # vpc
  availability_zone = "ap-northeast-1a" # AZ
  cidr_block = "10.0.11.0/24" # CIDR
  tags = {
    Group = "private"
  }
}

## AZ: 1c
### Public
resource "aws_subnet" "public_1c" {
  vpc_id = aws_vpc.main.id # vpc
  availability_zone = "ap-northeast-1c" # AZ
  cidr_block = "10.0.20.0/24" # CIDR
  tags = {
    Group = "public"
  }
}
### Private
resource "aws_subnet" "private_1c" {
  vpc_id = aws_vpc.main.id # vpc
  availability_zone = "ap-northeast-1c" # AZ
  cidr_block = "10.0.21.0/24" # CIDR
  tags = {
    Group = "private"
  }
}
