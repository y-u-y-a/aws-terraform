# EC2(アクセス可能なポートを制限)
resource "aws_security_group" "ec2" {
  name = "security_ec2"
  description = "for ec2"
  vpc_id = aws_vpc.main.id
}
# Rules
## インバウンド
resource "aws_security_group_rule" "allow_http" {
  type = "ingress"
  protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}
resource "aws_security_group_rule" "allow_ssh" {
  type = "ingress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}
## アウトバウンド
resource "aws_security_group_rule" "allow_all" {
  type = "egress"
  protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}
# --------------------------------------------------------

# RDS(EC2からのアクセスのみ許可)
resource "aws_security_group" "rds" {
  name = "security_rds"
  description = "for rds"
  vpc_id = aws_vpc.main.id
}
# Rules
## インバウンド
resource "aws_security_group_rule" "allow_ec2" {
  type = "ingress"
  protocol = "tcp"
  from_port = 3306
  to_port = 3306
  source_security_group_id = aws_security_group.ec2.id # ソース(EC2のセキュリティグループIDを指定)
  security_group_id = aws_security_group.rds.id
}
