resource "aws_instance" "www1" {
  ami = "ami-c1cf79bc"
  instance_type = "t2.micro"
  key_name = "aws-ssh-key"
  vpc_security_group_ids = ["${aws_security_group.sg_www.id}"]
  user_data = <<EOF
#!/bin/bash
echo www1 > /etc/hostname
hostname -F /etc/hostname
apt -y update
EOF
  subnet_id              = "${aws_subnet.sub-priv-a.id}"
  associate_public_ip_address = "false"
}

resource "aws_instance" "www2" {
  ami = "ami-c1cf79bc"
  instance_type = "t2.micro"
  key_name = "aws-ssh-key"
  vpc_security_group_ids = ["${aws_security_group.sg_www.id}"]
  user_data = <<EOF
#!/bin/bash
echo www2 > /etc/hostname
hostname -F /etc/hostname
apt -y update
EOF
  subnet_id              = "${aws_subnet.sub-priv-a.id}"
  associate_public_ip_address = "false"
}

resource "aws_instance" "remote" {
  ami = "ami-c1cf79bc"
  instance_type = "t2.micro"
  key_name = "aws-ssh-key"
  vpc_security_group_ids = ["${aws_security_group.sg_adm.id}"]
  user_data = <<EOF
#!/bin/bash
echo remote > /etc/hostname
hostname -F /etc/hostname
apt -y update
EOF
  subnet_id              = "${aws_subnet.sub-pub-a.id}"
  associate_public_ip_address = "true"
}


