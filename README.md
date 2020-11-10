# TerraformでVPC, EC2, RDSを構築

動くところまで記述

## 前提・準備
- AWSのデフォルトプロファイルを設定してある

## 1. EC2にSSHする際に必要な鍵を生成
```sh:
$ cd build
$ mkdir .key
$ ssh-keygen -t rsa -f ./key/tf_key -N ''
```

## 2. Terraform実行
```sh:
$ terraform apply
```

## 3. SSHで接続確認
```sh:
$ ssh -i ./.key/tf_key ec2-user@[表示されたIPアドレス]
```
