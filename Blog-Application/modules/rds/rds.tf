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
		from_port        = 5432
		to_port          = 5432
		protocol         = "tcp"
		cidr_blocks      = "${var.cidr_blocks}"
	}
}

resource "aws_db_parameter_group" "pg" {
	name   				= "${var.pg_grp}"
	family 				= "${var.pgfamily}"
	tags = {
		Name 			= "${var.pg_grp}"
		Env 			= "${var.env}"
		"App Name"		= "${var.app_name}"
	}
}

resource "aws_db_subnet_group" "subnet_grp" {
	name       			= "${var.snt_grp}"
	description 		= "${var.subnetdescription}"
	subnet_ids 			= "${var.subnet_ids}"
	tags = {
		Name 			= "${var.snt_grp}"
		Env 			= "${var.env}"
		"App Name"		= "${var.app_name}"
	}
}

resource "aws_db_option_group" "example" {
  name                     = "${var.option_grp}"
  option_group_description = "${var.option_group_description}"
  engine_name              = "${var.engine_name}"
  major_engine_version     = "${var.option_engine_version}"
  tags = {
		Name 			= "${var.option_grp}"
		Env 			= "${var.env}"
		"App Name"		= "${var.app_name}"
	}
  
}


resource "aws_db_instance" "default" {
	identifier 		     = "${var.rds_name}"
	allocated_storage    = "${var.allocated_storage}"
	storage_type         = "gp2"
	engine               = "${var.engine}"
	engine_version       = "${var.engine_version}"
	instance_class       = "${var.instance_class}"
	db_name              = "${var.db_name}"
	username             = "${var.db_user}"
	password             = "${var.db_password}"
	parameter_group_name = "${aws_db_parameter_group.pg.id}"
	db_subnet_group_name = "${aws_db_subnet_group.subnet_grp.id}"
	vpc_security_group_ids = ["${aws_security_group.sg.id}"]
	copy_tags_to_snapshot = true
	tags = {
		Name 			= "${var.rds_name}"
		Env 			= "${var.env}"
		"App Name"		= "${var.app_name}"
	}
	deletion_protection    = true
	maintenance_window		= "Sun:00:00-Sun:01:00"
	skip_final_snapshot			= true
	storage_encrypted                     = true
}