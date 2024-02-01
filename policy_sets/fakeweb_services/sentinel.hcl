// -------------------------------------------------------------
// FEATURES
// -------------------------------------------------------------
sentinel {
  features = {
    apply-all = true
    terraform = true
  }
}

// -------------------------------------------------------------
// PLUGINS
// -------------------------------------------------------------
import "plugin" "tfplan/v2" {
  config = {
    "plan_path": "../../terraform/plan.json"
  }
}

// -------------------------------------------------------------
// MODULES
// -------------------------------------------------------------
import "module" "eval" {
  source = "../../imports/modules/eval/eval.sentinel"
}

import "module" "policy" {
  source = "../../imports/modules/policy/policy.sentinel"
}

// -------------------------------------------------------------
// STATIC DATA
// -------------------------------------------------------------
import "static" "exemptions" {
  source = "../../imports/static/exemptions/exemptions.json"
  format = "json"
}

// -------------------------------------------------------------
// POLICIES
// -------------------------------------------------------------
policy "fws001" {
  source            = "../../policies/sentinel/fws/fws001.sentinel"
  enforcement_level = "advisory"
}

policy "fws002" {
  source            = "../../policies/sentinel/fws/fws002.sentinel"
  enforcement_level = "advisory"
}

policy "fws003" {
  source            = "../../policies/sentinel/fws/fws003.sentinel"
  enforcement_level = "advisory"
}