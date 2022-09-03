output "oidc" {
    value = var.create_oidc == "yes" ? data.external.get_oidc_script.result["oidc"] : null
}