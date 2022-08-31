output "oidc" {
    value = data.external.get_oidc_script.result["oidc"]
  
}