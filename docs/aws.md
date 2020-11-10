## 準備(ACCESS_KEY_ID, SECRET_ACCESS_KEY)
1. グループ作成
2. ユーザー作成

## 環境構築
```sh
$ brew install awscli
```

## AWSのプロファイル作成
- `~/.aws/`配下を編集するのは面倒なので。
```sh:
$ aws configure --profile [プロファイル名]
AWS Access Key ID: [ACCESS_KEY_ID]
AWS Secret Access Key: [SECRET_ACCESS_KEY]
Default region name: ap-northeast-1
Default output format: json
# ローカルのデフォルトユーザーを設定(bash_profile)
export AWS_DEFAULT_PROFILE=[プロファイル名]
# デフォルトプロファイル切り替え確認
$ aws configure list
# 接続確認
$ aws iam list-users
```
