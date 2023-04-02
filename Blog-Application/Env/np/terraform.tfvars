region  = "ap-south-1"
profile = "terraform_user"


#common
env									= "np"
reg									= "aps1"
city								= "mum"
app_name							= "blog-app"

#rds
sg_desc						= "Security Group for RDS Blog Application"
vpc_id						= "vpc-030f5baee48b78b72"
cidr_blocks					= ["10.100.200.128/25","10.100.200.0/25"]
pgfamily					= "postgres14"
subnetdescription			= "Subnet Group for RDS Blog Application"
subnet_ids					= ["subnet-09cbd4268fdf7cf0d", "subnet-019b55c16b40f464a"]
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
container_image			= "dipanjan2020/django_blog:v1"


#alb
alb_subnet_ids			= ["subnet-07af12523ee19f86f", "subnet-0c4e2971572364269"]
alb_sg_desc				= "Security Group for load balancer Blog Application"

#ecs service
ecs_sg_desc				= "Security Group for ecs Blog Application"
ecs_subnet_ids			= ["subnet-07af12523ee19f86f", "subnet-0c4e2971572364269"]