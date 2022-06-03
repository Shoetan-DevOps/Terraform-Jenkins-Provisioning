resource "aws_instance" "jenkins" {
    ami = var.my-ami-list["RHEL"]
    instance_type = var.my-instance-type[0]

    vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-web.id]

    tags = {
      "Name" = "Jenkins-Sandbox-TF"
      "Source" = "terraform"
    }

    #userdata
}