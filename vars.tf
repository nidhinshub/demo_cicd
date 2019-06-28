variable "access_key" {
    description = "Your AWS Access Key"
    default = "<copy-your-access-key-here>"
}

variable "secret_key" {
    description = "Your AWS Secret Key"
    default = "<copy-your-secret-key-here>"
}

variable "aws_region" {
  default = "eu-west-2"
}

variable "ssh_key" {
    default = "./my_aws_key"
}
