###################################################################################################
#   data.tf                                                                                       #
###################################################################################################

# This is used to output the Azure managed NS root record set merged with the custom NS record sets
data "azurerm_dns_ns_record" "recordset" {
  for_each              = toset(["@"])
  name                  = each.value
  zone_name             = var.zone.name
  resource_group_name   = var.zone.resource_group_name
  depends_on            = [ azurerm_dns_zone.zone ]
}

# This is used to output the Azure managed SOA record set
data "azurerm_dns_soa_record" "recordset" {
  zone_name             = var.zone.name
  resource_group_name   = var.zone.resource_group_name
  depends_on            = [ azurerm_dns_zone.zone ]
}
