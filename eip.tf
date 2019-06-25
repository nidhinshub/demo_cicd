resource "aws_eip" "my-test-eip" {
  instance    = "${aws_instance.my-test-instance.id}"
}
