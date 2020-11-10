resource "aws_security_group" "sg_ec2" {
  name = "security_ec2"
  description = "for ec2"
  vpc_id = aws_vpc.tf_vpc.id
}
# Rules
resource "aws_security_group_rule" "allow_http" {
  type = "ingress" # inbound
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_ec2.id
}
resource "aws_security_group_rule" "allow_ssh" {
  type = "ingress" # inbound
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_ec2.id
}
