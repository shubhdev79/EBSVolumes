
# Attach Volume
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdb"
  volume_id = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.web_server.id}"
  #delete_on_termination = false
}

resource "aws_instance" "web_server" {
ami = "ami-034e1d78dd9d4a332"
instance_type = "t2.micro"
key_name = var.key_name
#subnet_id = "${aws_subnet.Mgmt-Subnet.id}"
availability_zone = "us-east-1a"
security_groups = ["TESTEBSSecurityGroup"]
associate_public_ip_address = "true"

tags = {
Name = "TestEBS-Server"
	}
}

#Creating EBS Volume
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 5
  type				= "gp2"
  
  
  tags = {
    Name = "TestEBSVolume"
	}
}
