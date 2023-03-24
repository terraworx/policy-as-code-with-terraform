package terraform.policies.fws.server.fws_srv_001

import future.keywords.in
import input.plan as tfplan

actions := [
	["no-op"],
	["create"],
	["update"],
]

types := [
	"t2.small",
	"t2.medium",
	"t2.large",
]

resources := [resource_changes |
	resource_changes := tfplan.resource_changes[_]
	resource_changes.type == "fakewebservices_server"
	resource_changes.mode == "managed"
	resource_changes.change.actions in actions
]

violations := [resource |
	resource := resources[_]
	not resource.change.after.type in types
]

violators[address] {
	address := violations[_].address
}

# METADATA
# title: FWS-SRV-001
# description: Ensure that only allowed server type values are defined
# custom:
#  severity: medium
#  enforcement_level: mandatory
# related_resources:
# - ref: https://github.com/hcrhall/rego-dynamic-policy-composition/
# authors:
# - name: Ryan Hall
# - email: mailme@example.com
# organizations:
# - HashiCorp
rule[result] {
	count(violations) != 0
	result := {
		"policy": rego.metadata.rule().title,
		"description": rego.metadata.rule().description,
		"severity": rego.metadata.rule().custom.severity,
		"resources": {
			"count": count(violations),
			"addresses": violators,
		},
	}
}
