resource "aws_vpc" "vpcc" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "${var.project_name}-vpc"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpcc.id
    tags = {
        Name = "${var.project_name}-igw"
    }
}

resource "aws_subnet" "public_1" {
    vpc_id = aws_vpc.vpcc.id
    cidr_block = var.public_subnets[0]
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
}


resource "aws_subnet" "public_2" {
    vpc_id = aws_vpc.vpcc.id
    cidr_block = var.public_subnets[1]
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.vpcc.id
    cidr_block = var.private_subnets[0]
    availability_zone = "us-east-1a"
    tags = {
        Name = "${var.project_name}-private-subnet-1"
    }
}

resource "aws_subnet" "private_2" {
    vpc_id = aws_vpc.vpcc.id
    cidr_block = var.private_subnets[1]
    availability_zone = "us-east-1b"
    tags = {
        Name = "${var.project_name}-private-subnet-2"
   }
}

resource "aws_eip" "this" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.this.id
    subnet_id = aws_subnet.public_1.id
    tags = {
        Name = "${var.project_name}-nat-gateway"
    }
}


resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.vpcc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "public_1" {
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.pub_rt.id
}
resource "aws_route_table_association" "public_2" {
    subnet_id = aws_subnet.public_2.id
    route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table" "prt_rt" {
    vpc_id = aws_vpc.vpcc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
}

resource "aws_route_table_association" "private_1" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.prt_rt.id
}

resource "aws_route_table_association" "private_2" {
    subnet_id = aws_subnet.private_2.id
    route_table_id = aws_route_table.prt_rt.id
}