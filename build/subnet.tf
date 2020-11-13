# Subnet(Region: Tokyo)
variable "public_subnets" {
  default = [
    {
      "az" = "ap-northeast-1a"
      "cidr" = "10.0.1.0/24"
    },
    {
      "az" = "ap-northeast-1c"
      "cidr" = "10.0.2.0/24"
    },
    {
      "az" = "ap-northeast-1d"
      "cidr" = "10.0.3.0/24"
    },
  ]
}
variable "private_subnets" {
  default = [
    {
      "az" = "ap-northeast-1a"
      "cidr" = "10.0.10.0/24"
    },
    {
      "az" = "ap-northeast-1c"
      "cidr" = "10.0.20.0/24"
    },
    {
      "az" = "ap-northeast-1d"
      "cidr" = "10.0.30.0/24"
    },
  ]
}
## public
resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id # vpc
  availability_zone = var.public_subnets[count.index].az # AZ
  cidr_block = var.public_subnets[count.index].cidr # CIDR
  tags = {
    Group = "public"
  }
}
## private
resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.main.id # vpc
  availability_zone = var.private_subnets[count.index].az # AZ
  cidr_block = var.private_subnets[count.index].cidr # CIDR
  tags = {
    Group = "public"
  }
}
