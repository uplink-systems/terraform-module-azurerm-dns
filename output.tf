###################################################################################################
#   output.tf                                                                                     #
###################################################################################################

output "azurerm_dns_zone" {
  description = "output of all exported DNS zone attribute values"
  value       = azurerm_dns_zone.zone
  depends_on  = [ azurerm_dns_zone.zone ]
}

output "azurerm_dns_zone_id" {
  description = "output of exported DNS zone's 'id' attribute value"
  value       = azurerm_dns_zone.zone.id
  depends_on  = [ azurerm_dns_zone.zone ]
}

output "azurerm_dns_zone_name" {
  description = "output of exported DNS zone's 'name' attribute value"
  value       = azurerm_dns_zone.zone.name
  depends_on  = [ azurerm_dns_zone.zone ]
}

output "azurerm_dns_zone_name_servers" {
  description = "output of exported DNS zone's 'name_servers' attribute values"
  value       = azurerm_dns_zone.zone.name_servers
  depends_on  = [ azurerm_dns_zone.zone ]
}

output "azurerm_dns_zone_number_of_record_sets" {
  description = "output of exported DNS zone's 'number_of_record_sets' attribute value"
  value       = azurerm_dns_zone.zone.number_of_record_sets
  depends_on  = [ azurerm_dns_zone.zone ]
}

output "azurerm_dns_a_record" {
  description = "output of all exported A record sets' attribute values"
  value       = azurerm_dns_a_record.recordset
  depends_on  = [ azurerm_dns_a_record.recordset ]
}

output "azurerm_dns_aaaa_record" {
  description = "output of all exported AAAA record sets' attribute values"
  value       = azurerm_dns_aaaa_record.recordset
  depends_on  = [ azurerm_dns_aaaa_record.recordset ]
}

output "azurerm_dns_caa_record" {
  description = "output of all exported CAA record sets' attribute values"
  value       = azurerm_dns_caa_record.recordset
  depends_on  = [ azurerm_dns_caa_record.recordset ]
}

output "azurerm_dns_cname_record" {
  description = "output of all exported CNAME record sets' attribute values"
  value       = azurerm_dns_cname_record.recordset
  depends_on  = [ azurerm_dns_cname_record.recordset ]
}

output "azurerm_dns_mx_record" {
  description = "output of all exported MX record sets' attribute values"
  value       = azurerm_dns_mx_record.recordset
  depends_on  = [ azurerm_dns_mx_record.recordset ]
}

output "azurerm_dns_ns_record" {
  description = "output of all exported NS record sets' attribute values"
  value       = [ data.azurerm_dns_ns_record.recordset, azurerm_dns_ns_record.recordset ]
  depends_on  = [ data.azurerm_dns_ns_record.recordset, azurerm_dns_ns_record.recordset ]
}

output "azurerm_dns_soa_record" {
  description = "output of all exported SOA record sets' attribute values"
  value       = data.azurerm_dns_soa_record.recordset
  depends_on  = [ data.azurerm_dns_soa_record.recordset ]
}

output "azurerm_dns_srv_record" {
  description = "output of all exported SRV record sets' attribute values"
  value       = azurerm_dns_srv_record.recordset
  depends_on  = [ azurerm_dns_srv_record.recordset ]
}

output "azurerm_dns_txt_record" {
  description = "output of all exported TXT record sets' attribute values"
  value       = azurerm_dns_txt_record.recordset
  depends_on  = [ azurerm_dns_txt_record.recordset ]
}

output "azurerm_management_lock" {
  description = "output of all exported management lock attribute values"
  value       = azurerm_management_lock.lock
  depends_on  = [ azurerm_management_lock.lock ]
}
