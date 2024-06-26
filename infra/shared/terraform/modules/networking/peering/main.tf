locals {
    remote_vnet_tokens      = split("/", var.remote_vnet_id)
    remote_vnet_name        = local.remote_vnet_tokens[8]
}

resource "azurerm_virtual_network_peering" "peering" {
  name                         = "${var.local_vnet_name}-peerTo-${local.remote_vnet_name}"
  allow_virtual_network_access = true
  allow_gateway_transit        = false
  allow_forwarded_traffic      = false
  use_remote_gateways          = false

  remote_virtual_network_id = var.remote_vnet_id
  virtual_network_name      = var.local_vnet_name
  resource_group_name       = var.resource_group_name
}

