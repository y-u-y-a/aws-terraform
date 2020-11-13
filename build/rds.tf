# サブネットグループ(RDSを起動させるサブネットを制御(複数推奨: マスタスレーブ構成))
resource "aws_db_subnet_group" "main" {
  name = "main"
  subnet_ids = aws_subnet.private.*.id # 全てのprivateに作成
}
# パラメータグループ(DB設定値を制御)
resource "aws_db_parameter_group" "main" {
  name = "main"
  family = "mysql8.0"
}
# オプショングループ(RDSへの機能追加を制御)
resource "aws_db_option_group" "main" {
  name = "main"
  engine_name = "mysql"
  major_engine_version = "8.0"
}
# RDS
resource "aws_db_instance" "main" {
  # required
  engine = "mysql"
  engine_version = "8.0.15"
  # optional
  identifier = "terraform" # RDSインスタンスの名前
  instance_class = "db.t2.micro" # インスタンスタイプ
  storage_type = "gp2" # ストレージタイプ
  allocated_storage = 20 # ストレージ(GB)
  multi_az = true # マルチAZ(マスタスレーブ構成, 複数のAZにRDSを自動作成)
  backup_retention_period = "30" # 自動バックアップの保持日数
  backup_window = "19:00-19:30" # バックアップを実行する時間(ja=UTC-9h)
  monitoring_interval = 0 # 拡張モニタリング無効
  auto_minor_version_upgrade = true # MySQLの自動バージョンアップグレード
  maintenance_window = "Sun:20:00-Sun:20:30"
  deletion_protection = false # 削除保護
  skip_final_snapshot = true
  # skip_final_snapshot = false
  # final_snapshot_identifier = "deleted-snapshot"
  apply_immediately = true # DB変更情報をすぐに反映させるか
  db_subnet_group_name = aws_db_subnet_group.main.name # サブネットグループ
  parameter_group_name = aws_db_parameter_group.main.name # パラメータグループ
  option_group_name = aws_db_option_group.main.name # オプショングループ
  vpc_security_group_ids = [aws_security_group.rds.id] # セキュリティグループ
  username = var.db_username # ユーザー名
  password = var.db_password # パスワード
}

output "rds_endpoint" {
    value = aws_db_instance.main.address
}
