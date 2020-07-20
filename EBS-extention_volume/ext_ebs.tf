resource "aws_ebs_volume" "ext-ebs-volum-1" {
  availability_zone = "eu-central-1a"
  size              = "5"
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.ext-ebs-volum-1.id
  instance_id = aws_instance.ubuntu-srv.id
}
