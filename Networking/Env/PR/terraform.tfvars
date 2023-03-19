region  = "ap-south-1"
profile = "terraform_user"


#common
env									= "pr"
sr_no								= "01"
reg									= "aps1"
city								= "mum"

#VPC
cidr								= "10.100.100.0/23"


#Subnet
public_sub_cidr_1					= "10.100.100.0/25"
public_sub_cidr_2					= "10.100.100.128/25"
private_sub_cidr_1					= "10.100.101.0/25"
private_sub_cidr_2					= "10.100.101.128/25"
availability_zone_1					= "ap-south-1a"
availability_zone_2					= "ap-south-1b"