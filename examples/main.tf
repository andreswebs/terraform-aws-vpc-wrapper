module "network" {
  source       = "github.com/andreswebs/terraform-aws-vpc-wrapper"
  network_name = var.network_name
}
