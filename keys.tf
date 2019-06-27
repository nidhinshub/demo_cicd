resource "aws_key_pair" "my_web_key" {
  key_name   = "web-key"
  public_key = "${file("my_web_key.pub")}"
}
