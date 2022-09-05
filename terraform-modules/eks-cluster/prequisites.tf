resource null_resource "prequisites_check"{
    provisioner "local-exec" {
        command = "pythonn"
    }
}