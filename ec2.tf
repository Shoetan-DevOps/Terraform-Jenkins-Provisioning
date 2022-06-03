resource "aws_instance" "jenkins" {
    ami = var.my-ami-list["RHEL"]
    instance_type = var.my-instance-type[1]
    user_data = file("${path.module}/install-jenkins.sh")
    key_name = var.my-key-pem

    vpc_security_group_ids = [aws_security_group.allow-jenkins-ssh.id, aws_security_group.allow-jenkins-web.id]

    tags = {
      "Name" = "Jenkins-Sandbox-TF"
      "Source" = "Terraform"
    }

    #userdata
}