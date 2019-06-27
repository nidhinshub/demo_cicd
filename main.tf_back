resource "aws_instance" "my-test-instance" {
  ami             = "${data.aws_ami.amazon-linux-2.id}"
  instance_type   = "t2.micro"
  key_name = "${aws_key_pair.my_aws_key.key_name}"

  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}",
]

  tags {
    Name = "jenkins-deploy-instance"
  }
}