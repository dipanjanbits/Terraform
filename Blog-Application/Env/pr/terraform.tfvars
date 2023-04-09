region  = "ap-south-1"
profile = "terraform_user"


#common
env									= "pr"
reg									= "aps1"
city								= "mum"
app_name							= "blog-app"

#rds
sg_desc						= "Security Group for RDS Blog Application"
vpc_id						= "vpc-07555889ab9662817"
cidr_blocks					= ["10.100.101.0/25","10.100.101.128/25"]
pgfamily					= "postgres14"
subnetdescription			= "Subnet Group for RDS Blog Application"
subnet_ids					= ["subnet-0991bd37fd7a18db4", "subnet-084ce1e0bd59b5f89"]
allocated_storage			= "20"
engine_version				= "14.6"
instance_class				= "db.t3.micro"
db_name						= "blogdb"
db_user						= "blog_user"
db_password					= "blog_pass#123456789"
option_group_description	= "Option Group for RDS Blog Application"
engine_name					= "postgres"
option_engine_version		= "14"

#ecs
cpu						= "256"
memory					= "512"
task_role_arn			= "arn:aws:iam::551242489466:role/ecsTaskExecutionRole"
container_name			= "blog"
container_image			= "551242489466.dkr.ecr.ap-south-1.amazonaws.com/ecr-blog-app-np-aps1-mum-01:fcdb7e7"


#alb
alb_subnet_ids			= ["subnet-0fa95f7a58f70a901", "subnet-0daf7f4390dbcfb7a"]
alb_sg_desc				= "Security Group for load balancer Blog Application"

#ecs service
ecs_sg_desc				= "Security Group for ecs Blog Application"
ecs_subnet_ids			= ["subnet-0fa95f7a58f70a901", "subnet-0daf7f4390dbcfb7a"]