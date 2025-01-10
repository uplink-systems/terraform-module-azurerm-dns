####################################################################################################
#   output.tf                                                                                      #
####################################################################################################

output "azurerm_dns_zone" {
  description = "list of all exported attributes values from the DNS zone"
  value       = azurerm_dns_zone.zone
}

output "azurerm_dns_zone_id" {
  description = "list of exported 'id' attribute values from the DNS zone"
  value       = azurerm_dns_zone.zone.id
}

output "azurerm_dns_zone_name" {
  description = "list of exported 'name' attribute values from the DNS zone"
  value       = azurerm_dns_zone.zone.name
}

output "azurerm_dns_zone_name_servers" {
  description = "list of exported 'name_servers' attribute values from the DNS zone"
  value       = azurerm_dns_zone.zone.name_servers
}

output "azurerm_dns_zone_number_of_record_sets" {
  description = "list of exported 'number_of_record_sets' attribute values from the DNS zone"
  value       = azurerm_dns_zone.zone.number_of_record_sets
}

output "azurerm_dns_a_record" {
  description = "list of all exported attributes from the A record set resources"
  value       = azurerm_dns_a_record.recordset
  depends_on  = [ azurerm_dns_a_record.recordset ]
}

output "azurerm_dns_aaaa_record" {
  description = "list of all exported attributes from the AAAA record set resources"
  value       = azurerm_dns_aaaa_record.recordset
  depends_on  = [ azurerm_dns_aaaa_record.recordset ]
}

output "azurerm_dns_caa_record" {
  description = "list of all exported attributes from the CAA record set resources"
  value       = azurerm_dns_caa_record.recordset
  depends_on  = [ azurerm_dns_caa_record.recordset ]
}

output "azurerm_dns_cname_record" {
  description = "list of all exported attributes from the CNAME record set resources"
  value       = azurerm_dns_cname_record.recordset
  depends_on  = [ azurerm_dns_cname_record.recordset ]
}

output "azurerm_dns_mx_record" {
  description = "list of all exported attributes from the MX record set resources"
  value       = azurerm_dns_mx_record.recordset
  depends_on  = [ azurerm_dns_mx_record.recordset ]
}

output "azurerm_dns_ns_record" {
  description = "list of all exported attributes from the NS record set resources"
  value       = azurerm_dns_ns_record.recordset
  depends_on  = [ azurerm_dns_ns_record.recordset ]
}

output "azurerm_dns_soa_record" {
  description = "list of all exported attributes from the SOA record set data sources"
  value       = data.azurerm_dns_soa_record.recordset
  depends_on  = [ data.azurerm_dns_soa_record.recordset ]
}

output "azurerm_dns_srv_record" {
  description = "list of all exported attributes from the SRV record set resources"
  value       = azurerm_dns_srv_record.recordset
  depends_on  = [ azurerm_dns_srv_record.recordset ]
}

output "azurerm_dns_txt_record" {
  description = "list of all exported attributes from the TXT record set resources"
  value       = azurerm_dns_txt_record.recordset
  depends_on  = [ azurerm_dns_txt_record.recordset ]
}