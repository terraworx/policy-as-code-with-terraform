policy "fws_db_001" {
  description = "Ensure that all databases are sized accordingly"
  query = "data.terraform.policies.fws.database.fws_db_001.rule"
  enforcement_level = "advisory"
}

policy "fws_srv_001" {
  description = "Ensure that only allowed server-type values are defined"
  query = "data.terraform.policies.fws.server.fws_srv_001.rule"
  enforcement_level = "mandatory"
}

policy "fws_srv_002" {
  description = "Ensure that servers are connected to the 'Primary VPC' network"
  query = "data.terraform.policies.fws.server.fws_srv_002.rule"
  enforcement_level = "advisory"
}