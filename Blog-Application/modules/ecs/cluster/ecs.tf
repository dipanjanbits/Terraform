resource "aws_cloudwatch_log_group" "example" {
  name = "${var.log_grp_name}"
  tags = {
		Name 			= "${var.log_grp_name}"
		Env 			= "${var.env}"
		"App Name"		= "${var.app_name}"
	}
}

resource "aws_ecs_cluster" "test" {
  name = "${var.cluster_name}"

  configuration {
    execute_command_configuration {
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.example.name
      }
    }
  }
  tags = {
		Name 			= "${var.cluster_name}"
		Env 			= "${var.env}"
		"App Name"		= "${var.app_name}"
	}
}