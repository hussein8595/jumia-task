output "elb" {

  description = "ELB DNS NAME"
  value       = aws_elb.my-elb.dns_name
 
}

output "docker-ip" {


  description = "docker public ip"
  value       = aws_instance.docker.public_ip

}
output "docker-dns" {


  description = "docker public dns"
  value       = aws_instance.docker.public_dns

}
output "postgres" {


  
  description = " postgres endpoint"
  value       = aws_db_instance.postgres.endpoint
}
