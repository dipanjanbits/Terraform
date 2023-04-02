resource "aws_ecr_repository" "foo" {
	name                 = "${var.ecr_name}"
	tags = {
		Name 			= "${var.ecr_name}"
		Env 			= "${var.env}"
		"App Name"		= "${var.app_name}"
	}
}