## 環境構築
```sh:
# version manager
$ brew install tfenv
# Linter
$ brew install tflint
# Show available versions
$ tfenv list-remote
# Terraform
$ tfenv install [latest or 0.12.29]
# switch version
$ tfenv use [latest or 0.12.29]
# for VSCode
$ code --install-extension 4ops.terraform
# for terraform(バケット名: yy-terraform)
$ aws s3 mb s3://[バケット名]
```

## 操作
```sh:
# .terraform生成(ワークスペース初期化.プラグインダウンロード)
$ terraform init
# 実行計画を確認
$ terraform plan
# インスタンス起動
$ terraform apply
```
