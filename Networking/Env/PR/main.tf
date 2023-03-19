module "vpc-np"{
	source              = "../../modules/vpc"
	cidr         		= "${var.cidr}"
	vpc_name		   	= "vpc-${var.env}-${var.reg}-${var.city}-01"
	env				   	= "${var.env}"
}

module "rtb-pub"{
	source              = "../../modules/rtb"
	vpc_id         		= "${module.vpc-np.vpc_id}"
	rtb_name		   	= "rtb-public-${var.env}-${var.reg}-${var.city}-01"
	env				   	= "${var.env}"
}

module "rtb-pri"{
	source              = "../../modules/rtb"
	vpc_id         		= "${module.vpc-np.vpc_id}"
	rtb_name		   	= "rtb-private-${var.env}-${var.reg}-${var.city}-01"
	env				   	= "${var.env}"
}


module "igw-np"{
	source              = "../../modules/igw"
	vpc_id         		= "${module.vpc-np.vpc_id}"
	igw_name		   	= "igw-${var.env}-${var.reg}-${var.city}-01"
	env				   	= "${var.env}"
	rtb_id				= "${module.rtb-pub.rtb_id}"
}

module "public-subnet-1"{
	source              	= "../../modules/subnet"
	vpc_id         			= "${module.vpc-np.vpc_id}"
	cidr					= "${var.public_sub_cidr_1}"
	availability_zone		= "${var.availability_zone_1}"
	map_public_ip_on_launch	= "true"
	route_table_id			= "${module.rtb-pub.rtb_id}"
	subnet_name		   		= "sub-public-${var.env}-${var.reg}-${var.city}-01"
	env				   		= "${var.env}"
}

module "public-subnet-2"{
	source              	= "../../modules/subnet"
	vpc_id         			= "${module.vpc-np.vpc_id}"
	cidr					= "${var.public_sub_cidr_2}"
	availability_zone		= "${var.availability_zone_2}"
	route_table_id			= "${module.rtb-pub.rtb_id}"
	map_public_ip_on_launch	= "true"
	subnet_name		   		= "sub-public-${var.env}-${var.reg}-${var.city}-02"
	env				   		= "${var.env}"
}

module "private-subnet-1"{
	source              	= "../../modules/subnet"
	vpc_id         			= "${module.vpc-np.vpc_id}"
	cidr					= "${var.private_sub_cidr_1}"
	availability_zone		= "${var.availability_zone_1}"
	route_table_id			= "${module.rtb-pri.rtb_id}"
	map_public_ip_on_launch	= "false"
	subnet_name		   		= "sub-private-${var.env}-${var.reg}-${var.city}-01"
	env				   		= "${var.env}"
}

module "private-subnet-2"{
	source              	= "../../modules/subnet"
	vpc_id         			= "${module.vpc-np.vpc_id}"
	cidr					= "${var.private_sub_cidr_2}"
	availability_zone		= "${var.availability_zone_2}"
	route_table_id			= "${module.rtb-pri.rtb_id}"
	map_public_ip_on_launch	= "false"
	subnet_name		   		= "sub-private-${var.env}-${var.reg}-${var.city}-02"
	env				   		= "${var.env}"
}