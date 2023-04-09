module "ecr-repo"{
	source              	= "../../modules/ecr"
	ecr_name				= "ecr-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	env				   		= "${var.env}"
	app_name				= "${var.app_name}"
}


module "rds"{
	source              		= "../../modules/rds"
	sg_name						= "rsg-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	sg_desc						= "${var.sg_desc}"
	vpc_id						= "${var.vpc_id}"
	cidr_blocks					= "${var.cidr_blocks}"
	pg_grp						= "rpg-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	pgfamily		   			= "${var.pgfamily}"
	snt_grp			   			= "rsng-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	subnetdescription  			= "${var.subnetdescription}"
	subnet_ids		  			= "${var.subnet_ids}"
	rds_name		  			= "rdi-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	allocated_storage  			= "${var.allocated_storage}"
	engine			  			= "${var.engine_name}"
	engine_version	  			= "${var.engine_version}"
	instance_class	  			= "${var.instance_class}"
	db_name			  			= "${var.db_name}"
	db_user			  			= "${var.db_user}"
	db_password		  			= "${var.db_password}"
	option_grp		  			= "rop-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	option_group_description	= "${var.option_group_description}"
	engine_name		  			= "${var.engine_name}"
	option_engine_version		= "${var.option_engine_version}"
	env				   			= "${var.env}"
	app_name					= "${var.app_name}"
}


module "ecs-cluster"{
	source              	= "../../modules/ecs/cluster"
	log_grp_name			= "clg-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	cluster_name			= "ecs-cluster-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	env				   		= "${var.env}"
	app_name				= "${var.app_name}"
}

module "ecs-task-def"{
	source              	= "../../modules/ecs/task_def"
	family					= "ecs-taskdef-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	cpu						= "${var.cpu}"
	memory					= "${var.memory}"
	task_role_arn			= "${var.task_role_arn}"
	container_name			= "${var.container_name}"
	container_image			= "${var.container_image}"
	region					= "${var.region}"
	env				   		= "${var.env}"
	app_name				= "${var.app_name}"
}


module "alb"{
	source              		= "../../modules/alb"
	env				   		= "${var.env}"
	app_name				= "${var.app_name}"
	alb_name				= "alb-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	target_grp_name			= "alt-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	subnet_ids				= "${var.alb_subnet_ids}"
	sg_name					= "lsg-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	sg_desc					= "${var.alb_sg_desc}"
	vpc_id					= "${var.vpc_id}"
	
}

module "ecs-service"{
	source              	= "../../modules/ecs/service"
	service_name			= "ecs-svc-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	cluster_arn				= "${module.ecs-cluster.cluster_arn}"
	td						= "ecs-taskdef-${var.app_name}-${var.env}-${var.reg}-${var.city}-01:${module.ecs-task-def.td_revision}"
	tg_arn					= "${module.alb.target_arn}"
	container_name			= "${var.container_name}"
	sg_name					= "ecsg-${var.app_name}-${var.env}-${var.reg}-${var.city}-01"
	vpc_id					= "${var.vpc_id}"
	sg_desc					= "${var.ecs_sg_desc}"
	subnet_id				= "${var.ecs_subnet_ids}"
	env				   		= "${var.env}"
	app_name				= "${var.app_name}"
}