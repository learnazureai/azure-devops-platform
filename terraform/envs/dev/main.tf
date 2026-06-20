module "nsg" {
  source              = "../../modules/nsg"
  nsg_name            = "dev-nsg"
  location            = "australiaeast"
  resource_group_name = azurerm_resource_group.rg.name

  rules = [
    {
      name            = "allow-8082"
      port            = 8082
      priority_offset = 0
    },
    {
      name            = "allow-8083"
      port            = 8083
      priority_offset = 10
    }
  ]
}
