resource "aws_lb" "akash" {
  name               = "akash-lb"
  internal           = false  # Set to 'true' for internal load balancer
  load_balancer_type = "application"  # Use 'application' for ALB or 'network' for NLB
  security_groups    = [var.sg_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "akash-lb"
  }
}

resource "aws_lb_target_group" "akash" {
  name     = "akash-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path     = "/"
    port     = 80
    protocol = "HTTP"
  }

  tags = {
    Name = "akash-tg"
  }
}

resource "aws_lb_listener" "akash" {
  load_balancer_arn = aws_lb.akash.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.akash.arn
    type             = "forward"
  }
}
