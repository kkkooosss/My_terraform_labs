resource "aws_instance" "ubuntu-srv" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu-eu-central-1"
  }
  #the VPC subnet
  subnet_id = aws_subnet.main-public-1.id
  #the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  #the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
}
