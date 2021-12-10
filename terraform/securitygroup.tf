resource "aws_security_group" "allow-ssh" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh"
  }
}
resource "aws_security_group" "allow-docker" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-docker"
  description = "security group that allows port 80"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = ["${aws_security_group.allow-elb.id}"]
  }
  tags = {
    Name = "allow-docker"
  }
}
resource "aws_security_group" "allow-elb" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-elb"
  description = "security group that allows elb"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-elb"
  }
}
resource "aws_security_group" "allow-postgres" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-postgres"
  description = "security group that allows connections from docker to postgres "
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = ["${aws_security_group.allow-docker.id}"]
  }
  tags = {
    Name = "allow-postgres"
  }
}