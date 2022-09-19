locals {
  oidc_url = module.eks.oidc_provider
  oidc_url_parts = split("/",local.oidc_url)
  oidc = element(local.oidc_url_parts,length(local.oidc_url_parts)-1)
}


output "oidc" {
    value = local.oidc
    
}