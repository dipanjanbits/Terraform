resource "aws_internet_gateway" "gw" {
	vpc_id = "${var.vpc_id}"

	tags = {
		Name 			= "${var.igw_name}"
		Env 			= "${var.env}"
	}
}




resource "aws_route" "r" {
	route_table_id            	= "${var.rtb_id}"
	destination_cidr_block    	= "0.0.0.0/0"
	gateway_id					= aws_internet_gateway.gw.id
}