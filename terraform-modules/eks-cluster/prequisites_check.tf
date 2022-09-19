locals{
    kubectl_check_cmd = "kubectl version --client --short"
    awscli_check_cmd = "aws --version"
}


resource null_resource "prequisites_check"{
    provisioner "local-exec" {
        when = create
        command = join(" && ",[local.kubectl_check_cmd,local.awscli_check_cmd])
    }
}
