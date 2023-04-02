resource "aws_security_group" "sg" {
    name 			= "${var.sg_name}"
    description 	= "${var.sg_desc}"
    vpc_id      	= "${var.vpc_id}"
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
	ingress {
		from_port        = 0
		to_port          = 0
		protocol         = "-1"
		cidr_blocks      = ["0.0.0.0/0"]
	}
}

resource "aws_lb" "test" {
  name               = "${var.alb_name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = "${var.subnet_ids}"

  enable_deletion_protection = false


}


resource "aws_lb_target_group" "ip-example" {
  name        = "${var.target_grp_name}"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = "${var.vpc_id}"
  
  health_check {
	matcher = "200-399"
	path	= "/blogs"
	healthy_threshold   = 5
	unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ip-example.arn
  }
}
