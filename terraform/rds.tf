resource "aws_db_subnet_group" "postgres-subnet" {
  name        = "postgres-subnet"
  description = "RDS subnet group"
  subnet_ids  = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id]
}

resource "aws_db_instance" "postgres" {
  allocated_storage       = 20
  engine                  = "postgres"
  instance_class          = "db.t4g.micro" 
  identifier              = "postgres"
  name                    = "validator_backend"
  username                = "master"          
  password                = "master##" 
  db_subnet_group_name    = aws_db_subnet_group.postgres-subnet.name
  multi_az                = "false" 
  vpc_security_group_ids  = ["${aws_security_group.allow-postgres.id}"]
  backup_retention_period = 0   
  skip_final_snapshot     = true                                        
  tags = {
    Name = "postgres-instance"
  }
}

