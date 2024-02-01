mock "tfplan/v2" {
  module {
    source = "../../testdata/fws001/fail.sentinel"
  }
}

import "module" "eval" {
    source = "../../../../imports/modules/eval/eval.sentinel"
}

test {
  rules = {
    main = false
  }
}