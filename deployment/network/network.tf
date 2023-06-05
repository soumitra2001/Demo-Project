resource "aws_vpc" "web_app_vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Environment = var.application_name
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.web_app_vpc.id

  tags = {
    Environment = var.application_name
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.web_app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Environment = var.application_name
  }
}
