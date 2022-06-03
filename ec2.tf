resource "aws_instance" "jenkins" {
    ami = var.my-ami-list["RHEL"]
    instance_type = var.my-instance-list[0]

    #security_groups = 

    tags = {
      "Name" = "Jenkins-Sandbox-TF"
      "Source" = "terraform"
    }
}