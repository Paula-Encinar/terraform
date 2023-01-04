# main dev vpc
resource "aws_vpc" "dev" {
  cidr_block            = var.vpc_cidr
  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags = {
    Name = "vpc-${var.environment}"
  }
}

// Public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.dev.id
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 2)
  tags = {
    Name = "${var.environment}-PublicSubnet01"
    
  }
}


resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.dev.id


}

//Route tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.dev.id

   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  depends_on = [aws_internet_gateway.internet_gateway]

}

// Associations:
resource "aws_route_table_association" "public_subnet_1_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}


// Outputs
output "public_subnet_1" {
  value = aws_subnet.public_subnet_1
}
output "vpc_id" {
  value = aws_vpc.dev.id
}