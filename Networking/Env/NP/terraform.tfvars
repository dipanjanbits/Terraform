region  = "ap-south-1"
profile = "terraform_user"


#common
env									= "np"
sr_no								= "01"
reg									= "aps1"
city								= "mum"

#VPC
cidr								= "10.100.200.0/23"


#Subnet
public_sub_cidr_1					= "10.100.200.0/25"
public_sub_cidr_2					= "10.100.200.128/25"
private_sub_cidr_1					= "10.100.201.0/25"
private_sub_cidr_2					= "10.100.201.128/25"
availability_zone_1					= "ap-south-1a"
availability_zone_2					= "ap-south-1b"