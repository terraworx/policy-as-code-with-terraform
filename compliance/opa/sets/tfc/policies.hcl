policy "block_auto_apply_runs" {
  description = "Policy that is used to ensure that Terraform Cloud workspaces are not configured to use the Auto Apply method"
  query = "data.terraform.tfc.block_auto_apply_runs.deny"
  enforcement_level = "mandatory"
}
