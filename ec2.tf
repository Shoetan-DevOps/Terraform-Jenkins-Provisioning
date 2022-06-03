resource "aws_instance" "jenkins" {
    ami = var.my-ami-list["RHEL"]
    instance_type = var.my-instance-type[0]

    security_groups = [aws_security_group.allow_ssh, aws_security_group.allow_web]

    tags = {
      "Name" = "Jenkins-Sandbox-TF"
      "Source" = "terraform"
    }

    #userdata
}