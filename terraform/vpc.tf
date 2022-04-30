#create vpc
#terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block             = "${var.vpc-cidr}"
  instance_tenancy       = "default"
  enable_dns_hostnames   = true

  tags    = {
    Name  = "Test VPC"
  } 
}

#create internet gateway
#terraform aws create internet gateway
resource "aws_internet_gateway" "internet_gateway" {
 vpc_id    = aws_vpc.vpc.id

  tags = {
   Name = "Test IGW"
 }
}

#create Public subnet 1
#terraform aws create subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id                = aws_vpc.vpc.id  
cidr_block              = "${var.public-subnet-1-cidr}"
availability_zone       = "us-west-2a"
map_public_ip_on_launch = true

  tags = {
   Name = "Public Subnet 1"
 }
}


#create Route Table
##terraform aws route table
resource "aws_route_table" "public-route-table" {
    vpc_id             = aws_vpc.vpc.id
    route {
       cidr_block      = "0.0.0.0/0"
       gateway_id      = aws_internet_gateway.internet_gateway.id
    }

   tags = {
   Name = "Public Route Table"
 }
}

#Associate Public Subnet 1 to "Public Route Table"
##terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-1-route_table-association" {
    subnet_id      = aws_subnet.public-subnet-1.id
    route_table_id = aws_route_table.public-route-table.id
}

#create Public subnet 2
#terraform aws create subnet
resource "aws_subnet" "public-subnet-2" {
  vpc_id                = aws_vpc.vpc.id  
cidr_block              = "${var.public-subnet-2-cidr}"
availability_zone       = "us-west-2a"
map_public_ip_on_launch = false

  tags = {
   Name = "Public Subnet 2"
 }
}

#Associate Public Subnet 2 to "Public Route Table"
##terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-2-route_table-association" {
    subnet_id      = aws_subnet.public-subnet-2.id
    route_table_id = aws_route_table.public-route-table.id
}

#create Public subnet 3
#terraform aws create subnet
resource "aws_subnet" "public-subnet-3" {
  vpc_id                = aws_vpc.vpc.id  
cidr_block              = "${var.public-subnet-3-cidr}"
availability_zone       = "us-west-2a"
map_public_ip_on_launch = false

  tags = {
   Name = "Public subnet 3"
 }
}

#Associate Public Subnet 3 to "Public Route Table"
##terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-3-route_table-association" {
    subnet_id      = aws_subnet.public-subnet-3.id
    route_table_id = aws_route_table.public-route-table.id
}



