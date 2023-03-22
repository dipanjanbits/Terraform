module "bastion-host"{
	source              	= "../../modules/ec2"
	vpc_id         			= "${var.vpc_id}"
	sg_name					= "esg-${var.ec2_name}-${var.env}-${var.reg}-${var.city}-01"
	sg_desc					= "${var.sg_desc}"
	subnet_id				= "${var.subnet_id}"
	private_ips				= "${var.private_ips}"
	eni_name		   		= "eni-${var.ec2_name}-${var.env}-${var.reg}-${var.city}-01"
	ami_id				   	= "${var.ami_id}"
	avb_zone				= "${var.avb_zone}"
	instance_type			= "${var.instance_type}"
	key_name				= "${var.key_name}"
	ec2_name				= "${var.ec2_name}"
	env				   		= "${var.env}"
}

module "s3-bucket-mum" {
	source              	= "../../modules/s3"
	bucket         			= "s3b-${var.env}-${var.reg}-${var.city}-01"
	env				   		= "${var.env}"
}