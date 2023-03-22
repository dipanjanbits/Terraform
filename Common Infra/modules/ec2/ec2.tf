resource "aws_security_group" "sg" {
    name 			= "${var.sg_name}"
    description 	= "${var.sg_desc}"
    vpc_id      	= "${var.vpc_id}"
    tags = {
		Name = "${var.sg_name}"
		Env = "${var.env}"
	}
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_network_interface" "eni" {
	subnet_id       = "${var.subnet_id}"
	private_ips     = ["${var.private_ips}"]
	security_groups = ["${aws_security_group.sg.id}"]
	tags = {
		Name = "${var.eni_name}"
		Env = "${var.env}"
	}
}

# Defining the App Server1 EC2
resource "aws_instance" "app_server" {
  ami                          = "${var.ami_id}" # Use the latest version of the Golden image and please do not use Marketplace images
  availability_zone            = "${var.avb_zone}"
  instance_type                = "${var.instance_type}"
  key_name                     = "${var.key_name}"
  tags = {
		Name = "${var.ec2_name}"
		Env = "${var.env}"
	}

network_interface {
		network_interface_id = "${aws_network_interface.eni.id}"
		device_index         = 0
   }
}

