resource "aws_security_group" "sg_adm" {
  name = "sg_adm"
  vpc_id = "${aws_vpc.vpc_main.id}"
  ingress {
    from_port = "${var.ssh_port}"
    to_port   = "${var.ssh_port}"
    protocol  = "tcp"
    cidr_blocks = ["151.80.59.19/32"]
  }

  ingress {
    from_port = "${var.ssh_port}"
    to_port   = "${var.ssh_port}"
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "sg_www" {
  name = "sg_www"
  vpc_id = "${aws_vpc.vpc_main.id}"
  ingress {
    from_port = "${var.http_port}"
    to_port   = "${var.http_port}"
    protocol  = "tcp"
    cidr_blocks = ["172.16.0.0/16"]
  }

  ingress {
    from_port = "${var.ssh_port}"
    to_port   = "${var.ssh_port}"
    protocol  = "tcp"
    cidr_blocks = ["172.16.0.0/16"]
  }


  ingress {
    from_port = "${var.ssh_port}"
    to_port   = "${var.ssh_port}"
    protocol  = "tcp"
    cidr_blocks = ["151.80.59.19/32"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

