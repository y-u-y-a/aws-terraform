####################################################
# ssh-keygen -t rsa -f ./key/[ファイル名] -N ''
# ssh -i ./.key/tf_key ec2-user@[取得したパブリックIP]
####################################################

# Register public key in AWS
resource "aws_key_pair" "tf_key" {
  key_name = "tf_key"
  public_key = file("./.key/tf_key.pub")
}

# EC2 Instance
resource "aws_instance" "ec2" {
  ami = "ami-0ce107ae7af2e92b5"
  instance_type = "t2.micro"
  # count = 1
  key_name = "tf_key"
  subnet_id = aws_subnet.tf_subnet_public_1a.id
  associate_public_ip_address = true # 自動割り当てパブリック IP(TODO: サブネット設定を使用する方が良いのか？)
  vpc_security_group_ids = [aws_security_group.sg_ec2.id]
  tags = {
    Name = "tf_ec2"
  }
}

# Associate Elastic IP
resource "aws_eip" "eip" {
  vpc = true
  instance = aws_instance.ec2.id
}

# Output
output "public_ip" {
  value = aws_eip.eip.public_ip
}
