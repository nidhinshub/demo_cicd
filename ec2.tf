provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

data "aws_ami" "amazon-linux-2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

 filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami             = "${data.aws_ami.amazon-linux-2.id}"
  instance_type   = "t2.medium"
  key_name = "${aws_key_pair.my_web_key.key_name}"

  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}",
    "${aws_security_group.allow_app.name}",
    "${aws_security_group.allow_jenkins.name}"
]

  tags {
    Name = "WebApp"
  }

  provisioner "remote-exec" {
    inline = ["sudo yum -y update"]

    connection {
      host  = "${self.public_ip}" 
      type      = "ssh"
      user      = "ec2-user"
      private_key = "${file(var.ssh_key)}"
    }
  }

  provisioner "local-exec" {
      command = "ansible-playbook -u ec2-user -i '${self.public_ip},' --private-key ${var.ssh_key} docker.yml" 
  }
}
output "ip"{
value= "${aws_instance.web.public_ip}"
}
