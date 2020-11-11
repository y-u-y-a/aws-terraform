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

# 各種変数
variable "profile_name" {
  default = "admin-yuya"
}
variable "public_key" {
  default = "~/.ssh/tf_aws_key.pub"
}
