resource "aws_security_group" "TESTEBSSecurityGroup" {
    name = "TESTEBSSecurityGroup"
    description = "Allow incoming connections from Internet and RDP"

    ingress { 
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${"0.0.0.0/0"}"]
    }

    ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = ["${"0.0.0.0/0"}"]
    }

    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

   tags = {
       
        Name= "TESTEBSSecurityGroup"
    }
}