# Register public key in AWS
resource "aws_key_pair" "main" {
  key_name = "main"
  public_key = file(var.public_key)
}
# EC2
resource "aws_instance" "main" {
  key_name = "main"
  ami = "ami-0ce107ae7af2e92b5"
  instance_type = "t2.micro"
  count = length(aws_subnet.public)
  subnet_id = aws_subnet.public[count.index].id
  associate_public_ip_address = true # 自動割り当てパブリックIP
  vpc_security_group_ids = [aws_security_group.ec2.id]
  tags = {
    Name = "main"
  }
  ## build environment
  provisioner "remote-exec" {
    connection {
      private_key = file(var.private_key)
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip
    }
    script = var.sh_install
  }
}

# Associate Elastic IP
resource "aws_eip" "eip" {
  count = length(aws_instance.main)
  instance = element(aws_instance.main, count.index).id
  vpc = true
}

# Output
output "public_ip" {
  value = aws_instance.main.*.public_ip
}
output "elastic_ip" {
  value = aws_eip.eip.*.public_ip
}
