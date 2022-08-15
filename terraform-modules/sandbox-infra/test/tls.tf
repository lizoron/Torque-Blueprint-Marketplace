resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "private_key" {
    value = nonsensitive(tls_private_key.example.private_key_openssh)
  
}

output "public_key" {
    value = tls_private_key.example.public_key_pem
}