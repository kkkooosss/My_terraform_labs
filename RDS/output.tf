output "instance" {
  value = "${aws_instance.ubuntu-srv.public_ip}"
}
output "rds" {
  value = "${aws_db_instance.mariadb.endpoint}"
}
