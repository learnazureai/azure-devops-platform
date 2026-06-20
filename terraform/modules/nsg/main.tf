resource "azurerm_network_security_group" "this" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "rules" {
  for_each = { for r in var.rules : r.name => r }

  name                        = each.value.name
  priority                    = 100 + each.value.priority_offset
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range          = "*"
  destination_port_range     = each.value.port
  source_address_prefix      = "*"
  destination_address_prefix  = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
}
