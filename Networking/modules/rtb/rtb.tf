resource "aws_route_table" "example" {
	vpc_id = "${var.vpc_id}"

	route = []

	tags = {
		Name 			= "${var.rtb_name}"
		Env 			= "${var.env}"
	}
}