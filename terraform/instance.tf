

resource "aws_instance" "docker" {
   ami           = "ami-0fdf70ed5c34c5f52"
   instance_type = "t2.medium"
  
  
   # the VPC subnet
   subnet_id      = aws_subnet.main-public-2.id

   # the security group
   vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}" , "${aws_security_group.allow-docker.id}"]

   # the public SSH key
   key_name = aws_key_pair.mykeypair.key_name
  
   user_data = <<-EOF
   #!/bin/bash -ex
   perl -pi -e 's/^#?Port 22$/Port 1337/' /etc/ssh/sshd_config
   service sshd restart || service ssh restart
  EOF
}
