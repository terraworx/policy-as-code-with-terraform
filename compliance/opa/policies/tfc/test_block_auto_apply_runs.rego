package terraform.tfc.block_auto_apply_runs

import future.keywords

test_run_workspace_auto_apply if {
	deny with input as {"run": {"workspace": {"auto_apply": true}}}
}
