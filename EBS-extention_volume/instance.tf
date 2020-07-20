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
  #user data
  user_data = <<EOF
#!/bin/bash
echo '----------------start-----------------'
mkdir -p /ebs-volume
mkfs.ext4 /dev/xvdf
echo  '/dev/xvdf /ebs-volume ext4 defaults 0 0' >> /etc/fstab
mount /ebs-volume
echo '---------------stop-------------------'
EOF
}
