# TerraformでVPC, EC2, RDSを構築

動くところまで記述

## 前提・準備
- AWSのデフォルトプロファイルを設定してある

## 1. SSHに必要な鍵を生成
```sh:
$ cd build
$ mkdir .key
$ ssh-keygen -t rsa -f ~/.ssh/tf_aws_key -N ''
```

## 2. Terraform確認・実行
```sh:
$ terraform plan
$ terraform apply
```

## 3. SSHで接続確認
```sh:
$ ssh -i ~/.ssh/tf_aws_key ec2-user@[表示されたIPアドレス]
```
