resource "aws_eip" "cicd-eip" {
  instance    = "${aws_instance.my-cicd-instance.id}"
}
