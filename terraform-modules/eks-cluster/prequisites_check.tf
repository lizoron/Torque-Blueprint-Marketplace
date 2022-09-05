locals{
    python_check_cmd = "python --version"
    bla_check_cmd = "bla --version"
}


resource null_resource "prequisites_check"{
    provisioner "local-exec" {
        command = local.python_check_cmd
    }
}