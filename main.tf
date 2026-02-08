provider "aws" {
  
  region = "us-east-1"
}

resource "aws_vpc" "prod_vpc"{
  cidr_block       = "10.81.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "prod"
  }
}

resource "aws_internet_gateway" "prod_igw" {

  vpc_id = aws_vpc.prod_vpc.id
  
}

resource "aws_route_table" "prod_tr" {
  
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "10.81.0.0/24"
    gateway_id = aws_internet_gateway.prod_igw.id
  }
}

resource "aws_subnet" "prod_sn" {
  vpc_id = aws_vpc.prod_vpc.id
  
}



