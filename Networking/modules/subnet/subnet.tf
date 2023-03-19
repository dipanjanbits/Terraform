resource "aws_subnet" "main" {
	vpc_id     				= "${var.vpc_id}"
	cidr_block 				= "${var.cidr}"
	availability_zone 		= "${var.availability_zone}"
	map_public_ip_on_launch	= "${var.map_public_ip_on_launch}"

	tags = {
		Name 			= "${var.subnet_name}"
		Env 			= "${var.env}"
	}
}


resource "aws_route_table_association" "a" {
	subnet_id      = aws_subnet.main.id
	route_table_id = "${var.route_table_id}"
}