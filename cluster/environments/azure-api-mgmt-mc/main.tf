module "apimgmt" {
  source = "../../azure/api-mgmt"

  apimgmt_name          = "${var.apimgmt_name}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  apimgmt_pub_name      = "${var.apimgmt_pub_name}"
  apimgmt_pub_email     = "${var.apimgmt_pub_email}"
  apimgmt_sku           = "${var.apimgmt_sku}"
  apimgmt_capacity      = "${var.apimgmt_capacity}"

}
/*
resource "azurerm_resource_group" "apimgmt" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_api_management" "apimgmt" {
  name                = "${var.apimgmt_name}"
  location            = "${azurerm_resource_group.apimgmt.location}"
  resource_group_name = "${azurerm_resource_group.apimgmt.name}"
  publisher_name      = "${var.apimgmt_pub_name}"
  publisher_email     = "${var.apimgmt_pub_email}"

  sku {
    name     = "${var.apimgmt_sku}"
    capacity = "${var.apimgmt_capacity}"
  }
}*/


resource "null_resource" "configure_apimgmt" {
  provisioner "local-exec" {
    command = "echo 'Need to use this var so terraform waits for api management service url '; push_api_mgmt.sh -b ${var.subscription_id} -f ${var.resource_group_name} -g ${var.apimgmt_name} -k ${var.api_config_repo} -d ${var.authorization_bearer}"
  }

  triggers {
    enable_api_mgmt  = "${var.enable_push_api_mgmt}"
  }
}