# ALB(Application Load Balancer)
resource "aws_lb" "ec2" {
  name = "ec2"
  internal = false # インターネット向け
  load_balancer_type = "application"
  subnets = aws_subnet.public.*.id # 分散させるサブネット
  security_groups = [aws_security_group.alb.id]
}
# リスナー
resource "aws_lb_listener" "main" {
  port = 80
  protocol = "HTTP"
  load_balancer_arn = aws_lb.ec2.arn
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
# リスナールール
resource "aws_lb_listener_rule" "main" {
  listener_arn = aws_lb_listener.main.arn
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}
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
# ターゲットグループにEC2を登録
resource "aws_lb_target_group_attachment" "main" {
  count = length(aws_instance.main)
  target_group_arn = aws_lb_target_group.main.arn # 登録するターゲットグループのARN
  target_id = aws_instance.main[count.index].id # インスタンスのID
  port = 80
}
## ALBのDNS
output "alb_dns_name" {
  value = aws_lb.ec2.dns_name
}
