output "server-ip" {
  value = "${aws_eip.cicd-eip.public_ip}"
}
