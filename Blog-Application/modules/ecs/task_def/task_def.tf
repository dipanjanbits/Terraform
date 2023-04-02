resource "aws_ecs_task_definition" "test" {
  family                   = "${var.family}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "${var.cpu}"
  memory                   = "${var.memory}"
  execution_role_arn		= "${var.task_role_arn}"
  task_role_arn            = "${var.task_role_arn}"
  tags = {
		Name 			= "${var.family}"
		Env 			= "${var.env}"
		"App Name"		= "${var.app_name}"
	}
  container_definitions    = <<TASK_DEFINITION
[
        {
            "name": "${var.container_name}",
            "image": "${var.container_image}",
            "cpu": 0,
            "portMappings": [
                {
                    "name": "blog-80-tcp",
                    "containerPort": 80,
                    "hostPort": 80,
                    "protocol": "tcp",
                    "appProtocol": "http"
                }
            ],
            "essential": true,
            "environment": [],
            "environmentFiles": [],
            "mountPoints": [],
            "volumesFrom": [],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-create-group": "true",
                    "awslogs-group": "/ecs/${var.container_name}",
                    "awslogs-region": "${var.region}",
                    "awslogs-stream-prefix": "ecs"
                }
            }
        }
    ]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
	cpu_architecture        = "X86_64"
  }
}