# Terraformのバージョン
terraform {
  required_version = "~> 0.12.29"
}

# 使用するクラウド
provider "aws" {
  version = "~> 3.0"
  region = "ap-northeast-1"
  profile = "admin-yuya"
}

# 各種変数
variable "public_key" {
  default = "~/.ssh/tf_aws_key.pub"
}
