package terraform.tfc.block_auto_apply_runs

import input.run as run

deny[msg] {
	run.workspace.auto_apply != false
	msg := sprintf(
		"Terraform Cloud workspace %s has been configured to automatically provision Terraform infrastructure. Change the workspace Apply Method settings to 'Manual Apply'",
		[run.workspace.name],
	)
}
