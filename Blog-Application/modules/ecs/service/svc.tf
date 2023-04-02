resource "aws_security_group" "sg" {
    name 			= "${var.sg_name}"
    description 	= "${var.sg_desc}"
    vpc_id      	= "${var.vpc_id}"
    tags = {
		Name = "${var.sg_name}"
		Env = "${var.env}"
		"App Name"		= "${var.app_name}"
	}
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
	ingress {
		from_port        = 80
		to_port          = 80
		protocol         = "tcp"
		cidr_blocks      = ["0.0.0.0/0"]
	}
}

resource "aws_ecs_service" "mongo" {
  name            = "${var.service_name}"
  cluster         = "${var.cluster_arn}"
  launch_type		= "FARGATE"
  task_definition = "${var.td}"
  desired_count   = 2
  enable_ecs_managed_tags            = true
  #depends_on      = [aws_iam_role_policy.foo]
  health_check_grace_period_seconds = 147

  load_balancer {
    target_group_arn = "${var.tg_arn}"
    container_name   = "${var.container_name}"
    container_port   = 80
  }
  network_configuration {
    assign_public_ip = true
        security_groups  = [aws_security_group.sg.id]
        subnets          = "${var.subnet_id}"
    }
	tags = {
		Name 			= "${var.service_name}"
		Env 			= "${var.env}"
		"App Name"		= "${var.app_name}"
	}

  
}