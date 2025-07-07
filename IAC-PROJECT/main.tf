# resource "aws_instance" "komatsu-terraform-20250707" {
#   ami           = "ami-03598bf9d15814511"
#   instance_type = "t2.micro"
# 
#   tags = {
#     Name = "komatsu-tf-20250707"
#   }
# }

resource "aws_subnet" "komatsu-tf-public-subnet" {
  vpc_id                  = "vpc-08f77b07c34029b7a"
  cidr_block              = "10.10.6.192/28"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "komatsu-tf-public-subnet"
  }
}

resource "aws_route_table" "komatsu-tf-public-route-table" {
  vpc_id = "vpc-08f77b07c34029b7a"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0edd3612557ae42b4"
  }

  tags = {
    Name = "komatsu-tf-public-route-table"
  }
}

resource "aws_route_table_association" "komatsu-tf-public-rta" {
  subnet_id      = aws_subnet.komatsu-tf-public-subnet.id
  route_table_id = aws_route_table.komatsu-tf-public-route-table.id
}

