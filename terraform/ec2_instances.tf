resource "aws_instance" "demo1" {
  count                  = 1
  ami                    = var.redhatami
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.ec2-security-group.id]
  subnet_id              = aws_subnet.public-subnet-1.id
  #security_groups         = [aws_security_group.ec2_sg.id]
  #vpc_id                = aws_vpc.vpc.id 
  #subnet_id              = aws_subnet.private-subnet-1.id
  key_name               = var.key_name
  tags = {
    Name = "Demo1_server"
  }
}

resource "aws_instance" "demo2" {
  count                  = 1
  ami                    = var.redhatami
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.ec2-security-group.id]
  subnet_id              = aws_subnet.public-subnet-2.id
  #security_groups         = [aws_security_group.ec2_sg.id]
  #vpc_id                = aws_vpc.vpc.id 
  #subnet_id              = aws_subnet.private-subnet-1.id
  key_name               = var.key_name
  tags = {
    Name = "Demo2_server"
  }
}

resource "aws_instance" "demo3" {
  count                  = 1
  ami                    = var.redhatami
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.ec2-security-group.id]
  subnet_id              = aws_subnet.public-subnet-3.id
  #security_groups       = [aws_security_group.ec2_sg.id]
  #vpc_id                = aws_vpc.vpc.id 
  #subnet_id              = aws_subnet.private-subnet-1.id
  key_name               = var.key_name
  tags = {
    Name = "Demo3_server"
  }
}
