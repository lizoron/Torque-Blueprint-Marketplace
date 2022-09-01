data "aws_caller_identity" "current" {}

locals {
  current_user_arn = data.aws_caller_identity.current.arn
  current_user_arn_parts = split("/", local.current_user_arn)
  current_user_name = element(local.current_user_arn_parts, length(local.current_user_arn_parts)-1)
}


output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}
