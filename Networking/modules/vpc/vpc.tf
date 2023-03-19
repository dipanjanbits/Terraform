resource "aws_vpc" "vpc-mum" {
	cidr_block       = "${var.cidr}" # "10.100.200.0/23"
	instance_tenancy = "default"

	tags = {
		Name = "${var.vpc_name}" # "ap-mum-vpc-np-01"
		Env = "${var.env}"
	}
}