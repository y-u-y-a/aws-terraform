# ターゲットグループ
resource "aws_lb_target_group" "main" {
  name = "main"
  vpc_id = aws_vpc.main.id
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  health_check {
    port = 80
    protocol = "HTTP"
    path = "/"
  }
}
# 分散対象のEC2インスタンスを登録
resource "aws_lb_target_group_attachment" "main" {
  count = length(aws_instance.main)
  target_group_arn = aws_lb_target_group.main.arn # 登録するターゲットグループのARN
  target_id = aws_instance.main[count.index].id # インスタンスのID
  port = 80
}
