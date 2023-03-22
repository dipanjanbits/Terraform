region  = "ap-south-1"
profile = "terraform_user"


#common
env									= "np"
reg									= "aps1"
city								= "mum"

#EC2
vpc_id								= "vpc-030f5baee48b78b72"
sg_desc								= "Security Group for Apache server"
subnet_id_1							= "subnet-0c4e2971572364269"
subnet_id_2							= "subnet-07af12523ee19f86f"
private_ips_1						= "10.100.200.20"
private_ips_2						= "10.100.200.140"
ami_id								= "ami-05afd67c4a44cc983"
avb_zone_1							= "ap-south-1a"
avb_zone_2							= "ap-south-1b"
instance_type						= "t2.micro"
key_name							= "key-np-aps1-mum-01"
ec2_name_1							= "linnpaps1mumapache01"
ec2_name_2							= "linnpaps1mumapache02"