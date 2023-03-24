// -------------------------------------------------------------
// MOCKS
// -------------------------------------------------------------
mock "tfplan/v2" {
  module {
    source = "../../testdata/fws003/fail.sentinel"
  }
}

mock "tfrun" {
  module {
    source = "../../testdata/fws003/tfrun.sentinel"
  }
}

// -------------------------------------------------------------
// MODULES
// -------------------------------------------------------------
import "module" "eval" {
    source = "../../../../../imports/modules/eval/eval.sentinel"
}

import "module" "policy" {
    source = "../../../../../imports/modules/policy/policy.sentinel"
}

// -------------------------------------------------------------
// STATIC DATA
// -------------------------------------------------------------
import "static" "exemptions" {
  source = "../../../imports/static/exemptions/exemptions.json"
  format = "json"
}

// -------------------------------------------------------------
// TESTS
// -------------------------------------------------------------
test {
  rules = {
    main = false
  }
}