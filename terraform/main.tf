// The Main Module
module "stack" {
  source         = "aqitio/stack/fakewebservices"
  version        = "0.0.3"
  stack_prefix   = "ENV"
  server_count   = var.server_count
  server_type    = "t2.micro"
  database_size  = 256
  vpc_cidr_block = "0.0.0.0/1"
}
