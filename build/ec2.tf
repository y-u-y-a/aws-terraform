# Register public key in AWS
resource "aws_key_pair" "main" {
  key_name = "main"
  public_key = file("${var.public_key}")
}

# EC2 Instance
resource "aws_instance" "main" {
  ami = "ami-0ce107ae7af2e92b5"
  instance_type = "t2.micro"
  # count = 1
  key_name = "main"
  subnet_id = aws_subnet.public_1a.id
  associate_public_ip_address = true # 自動割り当てパブリックIP(TODO: サブネット設定を使用する方が良いのか？)
  vpc_security_group_ids = [aws_security_group.ec2.id]
  tags = {
    Name = "main"
  }
}

# Associate Elastic IP
resource "aws_eip" "eip" {
  vpc = true
  instance = aws_instance.main.id
}

# Output
output "public_ip" {
  value = aws_eip.eip.public_ip
}
