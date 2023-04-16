resource "aws_vpc" "tf-vpc" {
  cidr_block           = var.address_space
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = "tf-vpc" }
}

resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.tf-vpc.id
  tags   = { Name = "tf-igw" }
}

resource "aws_route_table" "tf-public-rt" {
  vpc_id = aws_vpc.tf-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }
  tags = { Name = "routing table for public subnet" }
}

resource "aws_subnet" "tf-public-sn" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = var.public_subnet
  map_public_ip_on_launch = true
  availability_zone       = var.azs_public
  tags                    = { Name = "tf-public-sn" }
}

resource "aws_subnet" "tf-private-sn" {
  vpc_id            = aws_vpc.tf-vpc.id
  cidr_block        = var.private_subnet
  availability_zone = var.azs_private
  tags              = { Name = "tf-private-sn" }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.tf-public-sn.id
  route_table_id = aws_route_table.tf-public-rt.id
}

resource "aws_security_group" "allow_web_ssh" {
  name        = "allow_web_ssh"
  description = "allow http and ssh"
  vpc_id      = aws_vpc.tf-vpc.id
  ingress {
    description = "allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
