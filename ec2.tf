
resource "aws_instance" "web" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  key_name = "terraform-ssh"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
#   timeout ="10m"
  

  tags = {
    Name = "WebServer"
  }
#   provisioner "remote-exec" {
#    inline = [ "touch f1" ]
  
#     connection {
#       type = "ssh"
#       host = self.public_ip
#       user = "ubuntu"
#       private_key = file("./terraform-ssh")
#     }  
#   }
}
resource "aws_instance" "db" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  key_name = "terraform-ssh"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.data_tls.id]
  
#   timeout ="10m"
  

  tags = {
    Name = "database"
  }
}
resource "aws_instance" "bs" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  key_name = "terraform-ssh"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
#   timeout ="10m"
  

  tags = {
    Name = "bastion-server"
  }
    provisioner "remote-exec" {
   inline = [ "touch f1" ]
  
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = file("./terraform-ssh")
    }  
  }
}
 resource "aws_key_pair" "deployer" {
  key_name   = "terraform-ssh"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVBoFKoeOseKMON/ERUhLTxo5RRYACVlTQ77MGMbInP+N/MCkoUDtvg/MeW2JDVUxDje7rjX6NAvqEC9bmuthjHtRyV1DEo2ejrDJjbHxJB3crJqvSCc45RKJC3E4GGQArmupe7Dlq7dwHF3xS/YgMLOkUhsCuCUTJivPs48exxsfOGlVKaQ/FLAs8hBpJwDpsHFEGFXD/DbKblP8q9cbXhl/M1BksbPEEEJupo+BhVUXQnE3zTz4BTyyDV71n55q7dUMF4dF31m/YFWpNy7TApD2sGMi8LWogj/UoUV5MEgPNdWbOVjlWEqgu/Fbk3kwChvLTU4xmYoklfQPAB9eF nikhi@Nikhith_Naini"
}
