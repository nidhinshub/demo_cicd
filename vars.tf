
variable "access_key" {
    description = "Your AWS Access Key"
    default = "<copy-your-access-key-here>"
}

variable "secret_key" {
    description = "Your AWS Secret Key"
    default = "<copy-your-secret-key-here>"
}

variable "ssh_key" {
    default = "/home/akbharat/.ssh/my_aws_key"
}