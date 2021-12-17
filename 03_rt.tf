resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id  #여기
  }
  tags = {
    "Name" = "cada-rt"
  }
}

resource "aws_route_table_association" "rtas_public_1" {
  subnet_id      = aws_subnet.pub_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "rtas_public_2" {
  subnet_id      = aws_subnet.pub_2.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw_1.id  #여기
  }
  tags = {
    "Name" = "cada-webrt"
  }
}

resource "aws_route_table_association" "rtas_web_1" {
  subnet_id      = aws_subnet.web_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rtas_web_2" {
  subnet_id      = aws_subnet.web_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rtas_was_1" {
  subnet_id      = aws_subnet.was_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rtas_was_2" {
  subnet_id      = aws_subnet.was_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rtas_db_1" {
  subnet_id      = aws_subnet.db_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rtas_db_2" {
  subnet_id      = aws_subnet.db_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}





#resource "aws_route_table" "web_rt_2" {
#  vpc_id = aws_vpc.vpc.id

#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_nat_gateway.nat_gateway_2.id  #여기
#  }
#  tags = {
#    "Name" = "cada-webrt-2"
#  }
#}

/*
resource "aws_route_table" "was_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_1.id  #여기
  }
  tags = {
    "Name" = "cada-wasrt"
  }
}

#resource "aws_route_table" "was_rt_2" {
#  vpc_id = aws_vpc.vpc.id

#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_nat_gateway.nat_gateway_2.id  #여기
#  }
#  tags = {
#    "Name" = "cada-wasrt-2"
#  }
#}


resource "aws_route_table" "ansible_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_1.id  
  }
  tags = {
    "Name" = "cada-ansiblert"
  }
}


resource "aws_route_table_association" "public_ass_1" {
    subnet_id = aws_subnet.pub_1.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_ass_2" {
    subnet_id = aws_subnet.pub_2.id
    route_table_id = aws_route_table.public_rt.id             
}

resource "aws_route_table_association" "web_ass_1" {
    subnet_id = aws_subnet.web_subnet_1.id
    route_table_id = aws_route_table.web_rt.id             
}



resource "aws_route_table_association" "web_ass_2" {
    subnet_id = aws_subnet.web_subnet_2.id
    route_table_id = aws_route_table.web_rt.id             
}


resource "aws_route_table_association" "ansible_ass" {
    subnet_id = aws_subnet.ansible_subnet.id
    route_table_id = aws_route_table.ansible_rt.id             
}

*/