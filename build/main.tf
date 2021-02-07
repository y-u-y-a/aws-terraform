# Terraformのバージョン
terraform {
  required_version = "~> 0.12.29"
}

# 使用するクラウド
provider "aws" {
  version = "~> 3.0"
  region = "ap-northeast-1"
  profile = var.profile_name
}

# Register public key in AWS
resource "aws_key_pair" "main" {
  key_name = "main"
  public_key = file(var.public_key)
}

# 各種変数
variable "profile_name" {
  default = "admin-yuya"
}
variable "public_key" {
  default = "~/.ssh/tf_aws_key.pub"
}
variable "private_key" {
  default = "~/.ssh/tf_aws_key"
}
## RDS関係
variable "db_username" {
  default = "root"
}
variable "db_password" {
  default = "rootroot" # 8文字以上
}
## scripts
variable "sh_install" {
  default = "./sh/install.sh"
}
