# Needed for the traffic manager role assignment
provider "azuread" {
  version = "~> 0.7"
}

# common modules
module "common-provider" {
  source = "../../common/provider"
}
