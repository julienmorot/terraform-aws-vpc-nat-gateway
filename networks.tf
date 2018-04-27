resource "aws_vpc" "vpc_main" {
  cidr_block = "172.16.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "sub-pub-a" {
  vpc_id                  = "${aws_vpc.vpc_main.id}"
  cidr_block              = "172.16.20.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-3a"
  tags {
    Name = "Subnet public eu-west-3a"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  tags {
    Name = "InternetGW"
  }
}

resource "aws_route_table" "rt_public" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
}

resource "aws_route_table_association" "pub_sub-a_assoc" {
    subnet_id = "${aws_subnet.sub-pub-a.id}"
    route_table_id = "${aws_route_table.rt_public.id}"
}

resource "aws_subnet" "sub-priv-a" {
  vpc_id                  = "${aws_vpc.vpc_main.id}"
  cidr_block              = "172.16.10.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-3a"
}

resource "aws_eip" "nat" {
  vpc = true
  depends_on = ["aws_internet_gateway.default"]
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.sub-pub-a.id}"
  depends_on = ["aws_internet_gateway.default"]
}

resource "aws_route_table" "rt_private" {
    vpc_id = "${aws_vpc.vpc_main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
    }
}

resource "aws_route_table_association" "priv_sub-a_assoc" {
    subnet_id = "${aws_subnet.sub-priv-a.id}"
    route_table_id = "${aws_route_table.rt_private.id}"
}



