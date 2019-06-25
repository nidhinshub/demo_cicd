output "server-ip" {
  value = "${aws_eip.my-test-eip.public_ip}"
}
