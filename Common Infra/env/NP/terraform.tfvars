region  = "ap-south-1"
profile = "terraform_user"


#common
env									= "np"
reg									= "aps1"
city								= "mum"

#EC2
vpc_id								= "vpc-030f5baee48b78b72"
sg_desc								= "Security Group for Bastion Host"
subnet_id							= "subnet-0c4e2971572364269"
private_ips							= "10.100.200.10"
ami_id								= "ami-0bd3f43f107376d6b"
avb_zone							= "ap-south-1a"
instance_type						= "t2.micro"
key_name							= "key-np-aps1-mum-01"
ec2_name							= "winnpaps1mumbastion"