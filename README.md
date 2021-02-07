# TerraformでAWSを構築

動くところまで記述

## 前提・準備
- AWSのデフォルトプロファイルを設定してある

## 1. SSHに必要な鍵を生成
```sh:
# 鍵ファイル名 = tf_aws_key とする
$ ssh-keygen -t rsa -f ~/.ssh/[鍵ファイル名] -N ''
# 確認
ls ~/.ssh
# tf_aws_key tf_aws_key.pub
```

## 2. Terraform実行
```sh:
$ terraform apply
```

## 3. 接続確認
```sh:
# ブラウザ
[ALBのドメイン or IPアドレス]にアクセス
# EC2
$ ssh -i ~/.ssh/tf_aws_key ec2-user@[IPアドレス]
# RDS(RDSはプライベートサブネットに構築しているので,EC2にSSH接続した状態でのみ可能)
$ mysql -h [エンドポイント] -u root -p
```

## イメージ図(途中)
![イメージ図](./docs/image.png)
